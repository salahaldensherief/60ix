import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/core/networking/networking.dart';
import 'package:url_launcher/url_launcher.dart';


class ForceAppUpdateConfig {
  final NetworkHandler _networkHandler = NetworkHandler();

  // Your app store links
  static const String androidStoreUrl =
      'https://play.google.com/store/apps/details?id=com.sixty.ix.sixty_ix';
  static const String iosStoreUrl =
      'https://apps.apple.com/eg/app/60ix/id6749853854';

  /// Fetch version info from backend
  Future<GetAppVersionResponse?> _getAppVersionFromDashboard() async {
    GetAppVersionResponse? response;
    final res = await _networkHandler.get(
      GetAppVersionResponse(),
      ApiConfigurations.getAppVersion,
      canLogOut: false,
      enableShowErrorToast: false
    );

    if (res.isRequestSuccess) {
      response = res.body;
    }

    return response;
  }

  /// Compare versions and show dialog if needed
  Future<void> checkForUpdate(BuildContext context) async {
    try {
      final versionInfo = await _getAppVersionFromDashboard();

      if (versionInfo == null) return;

      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;

      bool shouldForceUpdate = false;
      bool shouldSuggestUpdate = false;

      if (Platform.isAndroid) {
        shouldForceUpdate = _isVersionLower(
          currentVersion,
          versionInfo.minSupportedVersionAndroid,
        );
        shouldSuggestUpdate = _isVersionLower(
          currentVersion,
          versionInfo.latestVersionAndroid,
        );
      } else if (Platform.isIOS) {
        shouldForceUpdate = _isVersionLower(
          currentVersion,
          versionInfo.minSupportedVersionIos,
        );
        shouldSuggestUpdate = _isVersionLower(
          currentVersion,
          versionInfo.latestVersionIos,
        );
      }

      if (shouldForceUpdate) {
        _showUpdateDialog(context, force: true);
      } else if (shouldSuggestUpdate) {
        _showUpdateDialog(context, force: false);
      }
    } catch (e) {
      debugPrint('Error checking app version: $e');
    }
  }

  /// Compares semantic version numbers (e.g., 1.0.3 vs 1.0.4)
  bool _isVersionLower(String current, String minimum) {
    try {
      List<int> currentParts = current
          .split('.')
          .map((e) => int.tryParse(e) ?? 0)
          .toList();
      List<int> minParts = minimum
          .split('.')
          .map((e) => int.tryParse(e) ?? 0)
          .toList();

      for (int i = 0; i < 3; i++) {
        if (currentParts[i] < minParts[i]) return true;
        if (currentParts[i] > minParts[i]) return false;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  /// Shows update dialog
  void _showUpdateDialog(BuildContext context, {required bool force}) {
    showDialog(
      barrierDismissible: !force,

      context: Modular.routerDelegate.navigatorKey.currentContext!,
      // context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        title: AppText(text: AppString.updateAvailable.tr()),
        content: AppText(
          text: force
              ? AppString.desForceUpdate.tr()
              : AppString.desSuggestUpdate.tr(),
          maxLines: 3,
        ),
        actions: [
          if (!force)
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: AppText(text: AppString.later.tr()),
            ),
          TextButton(
            onPressed: () async {
              final url = Platform.isAndroid ? androidStoreUrl : iosStoreUrl;
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );
              }
              if (!force) Navigator.pop(ctx);
            },
            child: AppText(text: AppString.update.tr()),
          ),
        ],
      ),
    );
  }
}

class GetAppVersionResponse extends BaseMappable {
  final String minSupportedVersionAndroid;
  final String minSupportedVersionIos;
  final String latestVersionAndroid;
  final String latestVersionIos;

  GetAppVersionResponse({
    this.minSupportedVersionAndroid = '',
    this.minSupportedVersionIos = '',
    this.latestVersionAndroid = '',
    this.latestVersionIos = '',
  });

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    return GetAppVersionResponse(
      latestVersionAndroid:
          json['data']['latest_version_android']?.toString() ?? '',
      latestVersionIos: json['data']['latest_version_ios']?.toString() ?? '',
      minSupportedVersionAndroid:
          json['data']['min_supported_version_android']?.toString() ?? '',
      minSupportedVersionIos:
          json['data']['min_supported_version_ios']?.toString() ?? '',
    );
  }
}
