import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:uuid/uuid.dart';

import '../../art_core/widgets/log/logger.dart';
import 'api_constant.dart';
import 'package:sixty_ix/modules/core/cache/preference_manager.dart';

class DioClient {
  final ApiConfigurations configurations = ApiConfigurations();
  final PreferenceManager preferenceManager = PreferenceManager();

  static const _uuidKey = 'APP_DEVICE_UUID';
  final _secureStorage = const FlutterSecureStorage();

  Dio get dio => _buildDio();

  Dio _buildDio() {
    final options = BaseOptions(
      baseUrl: ApiConfigurations.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    );

    final dio = Dio(options);

    dio.interceptors.addAll([
      AuthInterceptor(
        preferenceManager: preferenceManager,
        configurations: configurations,
        getGuestId: _getPersistentUdid,
        getTimezone: _getTimezoneSafe,
      ),
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ]);

    return dio;
  }

  /// Returns a stable ID and persists it for future launches.
  Future<String> _getPersistentUdid() async {
    final stored = await _secureStorage.read(key: _uuidKey);
    if (stored != null && stored.isNotEmpty) return stored;

    String udid;
    try {
      udid = await FlutterUdid.udid;
      Log.info("Flutter UDID: $udid");
    } catch (_) {
      final info = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final androidInfo = await info.androidInfo;
        udid = androidInfo.id;
        Log.info("Android UDID: $udid");
      } else if (Platform.isIOS) {
        final iosInfo = await info.iosInfo;
        udid = iosInfo.identifierForVendor ?? '';
        Log.info("iOS UDID: $udid");
      } else {
        udid = const Uuid().v4();
        Log.info("Fallback UDID: $udid");
      }
    }

    await _secureStorage.write(key: _uuidKey, value: udid);
    return udid;
  }

  /// Timezone helper with safe fallback.
  Future<String> _getTimezoneSafe() async {
    try {
      final tz = await FlutterTimezone.getLocalTimezone();
      if (tz.isNotEmpty) return tz;
    } catch (e) {
      Log.error('Failed to get timezone: $e');
    }
    return 'Africa/Cairo';
  }
}

class AuthInterceptor extends Interceptor {
  final PreferenceManager preferenceManager;
  final ApiConfigurations configurations;
  final Future<String> Function() getGuestId;
  final Future<String> Function() getTimezone;

  AuthInterceptor({
    required this.preferenceManager,
    required this.configurations,
    required this.getGuestId,
    required this.getTimezone,
  });

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.baseUrl = ApiConfigurations.baseUrl;

    // Resolve dynamic values at request-time
    final guestId = await getGuestId();
    final timezoneName = await getTimezone();

    // Centralize all headers here so they’re always fresh
    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferenceManager.authToken()}',
      'Accept-Language': preferenceManager.currentLang(),
      'X-User-Latitude': preferenceManager.latitude(),
      'X-User-Longitude': preferenceManager.longitude(),
      "X-Selected-Country": preferenceManager.getActiveCountry()?.id,
      'X-Timezone': timezoneName,
      'Guest-ID': guestId,
    });

    Log.info(">Token ${preferenceManager.authToken()}");
    return super.onRequest(options, handler);
  }
}
