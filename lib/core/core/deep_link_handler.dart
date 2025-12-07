import 'dart:io' show Platform;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/core/router/navigator_keys.dart';
import 'package:sixty_ix/env_config_env.dart';

enum DLType { post, service, vendor }

class ShareHelper {
  static Future<void> share({
    required String description,
    required DLType type,
    required String id,
    BuildContext? context,
  }) async {
    const title = 'مشاركة من تطبيق 60ix';
    const baseUrl = '${AppConfigEnv.apiBaseUrl}/share';
    final linkUrl = '$baseUrl/${type.name}/$id';

    final content = '$title\n$description\n$linkUrl';

    if (context != null && Platform.isIOS) {
      final renderBox = context.findRenderObject();
      if (renderBox is RenderBox) {
        Share.share(
          content,
          subject: title,
          sharePositionOrigin: renderBox.localToGlobal(Offset.zero) & renderBox.size,
        );
        return;
      }
    }
    Share.share(content, subject: title);
  }

  static void copyLinkToClipboard({
    required String description,
    required DLType type,
    required String id,
  }) {
    try {
      const title = 'مشاركة من تطبيق 60ix';
      const baseUrl = 'https://dashboard.60ix.com/api/share';
      final linkUrl = '$baseUrl/${type.name}/$id';

      final content = '$title\n$description\n$linkUrl';

      Clipboard.setData(ClipboardData(text: linkUrl));

      AppToast.info(AppString.linkCopiedToClipboard.tr());
    } catch (e) {
      debugPrint('Error copying link to clipboard: $e');
    }
  }
}




class DeepLinkHandler {
  static const _host = 'dashboard.60ix.com';
  static const _basePath = 'api/share';

  static Uri? _lastUri;
  static DateTime? _lastTime;
  static const _dupWindow = Duration(seconds: 1);

  static Future<void> handle(Uri uri) async {
    try {
      if (!_isAcceptedHost(uri)) return;

      // prevent duplicates
      final now = DateTime.now();
      if (_lastUri == uri && _lastTime != null && now.difference(_lastTime!) < _dupWindow) {
        return;
      }
      _lastUri = uri;
      _lastTime = now;

      // Expect: /api/share/:type/:id
      final seg = uri.pathSegments;
      if (seg.length < 4 || '${seg[0]}/${seg[1]}' != _basePath) return;

      final typeStr = seg[2].toLowerCase();
      final idStr = seg[3];

      final type = _parseType(typeStr);
      if (type == null || idStr.isEmpty) return;

      final id = int.tryParse(idStr);
      if (id == null) return;


      Log.info('DeepLinkHandler: type=$type, id=$id');

      switch (type) {
        case DLType.post:
          Modular.to.pushNamed(
            NavigatorKeys.COMMUNITY_KEY + NavigatorKeys.COMMUNITY_POST_DETAILS_PAGE,
            arguments: id,
          );
          break;

        case DLType.service:
          Modular.to.pushNamed(
            NavigatorKeys.SERVICES_KEY + NavigatorKeys.SERVICES_DETAILS_PAGE,
            arguments: id,
          );
          break;

        case DLType.vendor:
          Modular.to.pushNamed(
            NavigatorKeys.VENDOR_KEY + NavigatorKeys.VENDOR_PROFILE_PAGE,
            arguments: id,
          );
          break;
      }
    } catch (e, s) {
      debugPrint('DeepLinkHandler error: $e\n$s');
    }
  }

  static bool _isAcceptedHost(Uri uri) =>
      uri.scheme == 'https' && uri.host == _host;

  static DLType? _parseType(String t) {
    switch (t) {
      case 'post':
        return DLType.post;
      case 'service':
        return DLType.service;
      case 'vendor':
        return DLType.vendor;
      default:
        return null;
    }
  }
}
