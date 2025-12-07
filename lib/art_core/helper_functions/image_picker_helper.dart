import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

enum ImageSourceType { camera, gallery }

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<List<File>> pickImages({
    required BuildContext context,
    required ImageSourceType sourceType,
    int maxImages = 5,
  }) async {
    try {

      // final hasPermission = await _checkPermissions(context, sourceType);
      // if (!hasPermission) return [];

      if (sourceType == ImageSourceType.camera) {
        final XFile? image = await _picker.pickImage(
          source: ImageSource.camera,
          imageQuality: 80,
          maxWidth: 1080,
          maxHeight: 1080,
        );

        if (image != null) return [File(image.path)];
      } else {
        final List<XFile> images = await _picker.pickMultiImage(
          imageQuality: 80,
          maxWidth: 1080,
          maxHeight: 1080,
        );

        return images.take(maxImages).map((x) => File(x.path)).toList();
      }
    } catch (e) {
      debugPrint('Error picking images: $e');
      return [];
    }

    return [];
  }

  static Future<bool> _checkPermissions(
      BuildContext context, ImageSourceType type) async {
    Permission permission;

    if (type == ImageSourceType.camera) {
      permission = Permission.camera;
    } else {
      if (Platform.isIOS) {
        permission = Permission.photos;
      } else if (Platform.isAndroid) {
        final sdkInt = await _getAndroidSdkInt();
        permission = sdkInt < 33 ? Permission.storage : Permission.photos;
      } else {
        return true;
      }
    }

    final status = await permission.request();
    return status.isGranted;
  }

  static Future<int> _getAndroidSdkInt() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.sdkInt;
    } catch (e) {
      return 0;
    }
  }
}
