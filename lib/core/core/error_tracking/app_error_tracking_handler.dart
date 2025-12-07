import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:bugsnag_flutter/bugsnag_flutter.dart';

part 'send_notification_slack.dart';
part 'firebase_crashlytics_helper.dart';
part 'insight_hub_helper.dart';

class AppErrorTrackingHandler {
  static final _slack = _SendNotificationSlackHelper();

  static Future<void> init() async {
    await _FirebaseCrashlyticsHelper.init();
    await _InsightHubHelper.init();
  }

  static Future<void> setUser({
    required String id,
    String? email,
    String? name,
  }) async {
    await _FirebaseCrashlyticsHelper.setUserId(id);
    _InsightHubHelper.setUser(id: id, email: email, name: name);
  }

  static Future<void> reportError(
      dynamic error,
      StackTrace? stack, {
        bool fatal = false,
        String? context,
        Map<String, dynamic>? metadata,
        String? customSlackMessage,
      }) async {
    if (!kReleaseMode) {
      debugPrint('[Dev] Error: $error');
      return;
    }

    await _FirebaseCrashlyticsHelper.recordError(error, stack, fatal: fatal);
    _InsightHubHelper.notifyError(error, stackTrace: stack);

    final message = customSlackMessage ??
        '''
🚨 *Flutter Exception*
• Type: ${error.runtimeType}
• Message: ${error.toString()}
• Context: ${context ?? "-"}
• Stack: ${stack?.toString().split('\n').take(3).join('\n')}...
''';

    await _slack.sendSlackMessage(message);
  }

  static Future<void> reportServerError(Response response) async {
    if (!kReleaseMode) return;

    final log = await _FirebaseCrashlyticsHelper.recordServerError(response);

    final request = response.requestOptions;
    final statusCode = response.statusCode ?? 0;
    final errorMessage =
        response.data?['message'] ??
            response.data?['error'] ??
            'Unknown server error';

    final meta = {
      'headers': request.headers,
      'request_body': request.data.toString(),
      'response': response.data.toString(),
    };

    _InsightHubHelper.notifyError(
      Exception("HTTP $statusCode: $errorMessage : MetaData $meta"),
    );

    await _slack.sendSlackMessage(log);
  }
}
