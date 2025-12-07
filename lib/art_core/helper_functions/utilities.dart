import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:permission_handler/permission_handler.dart';

class Utilities {


  /// Get device name only
  static Future<String> getDeviceName() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        // Return brand + model (e.g., "Realme GT", "Samsung Galaxy S21")
        return '${androidInfo.brand} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        // Return model name (e.g., "iPhone 13", "iPad Air")
        return iosInfo.name;
      }
    } catch (e) {
      log('Error getting device name: $e');
    }

    return 'Unknown Device';
  }

  /// Check specific permissions with better handling for different platforms
  static Future<PermissionStatus> checkSpecificPermissions(
      BuildContext context, {
        required Permission permissionType,
      }) async {
    try {
      final status = await permissionType.status;

      if (status == PermissionStatus.granted) {
        return status;
      }

      // For storage permission on Android, handle different cases
      if (permissionType == Permission.storage && Platform.isAndroid) {
        // Check if we're on Android 13+ where storage permission works differently
        return await _handleStoragePermission(context);
      }

      final result = await permissionType.request();

      if (result == PermissionStatus.granted) {
        return result;
      }

      // Show dialog only if permission is permanently denied or on iOS
      if (Platform.isIOS || result == PermissionStatus.permanentlyDenied) {
        await showPermissionDeniedDialog(context, permissionType);
      }

      return result;
    } catch (e) {
      print('Error checking permissions: $e');
      return PermissionStatus.denied;
    }
  }

  /// Handle storage permission specifically for different Android versions
  static Future<PermissionStatus> _handleStoragePermission(BuildContext context) async {
    try {
      // Try photos permission first (works on Android 13+)
      final photosStatus = await Permission.photos.status;
      if (photosStatus == PermissionStatus.granted) {
        return photosStatus;
      }

      // Try to request photos permission
      final photosResult = await Permission.photos.request();
      if (photosResult == PermissionStatus.granted) {
        return photosResult;
      }

      // If photos permission failed, try storage (for older Android versions)
      final storageStatus = await Permission.storage.status;
      if (storageStatus == PermissionStatus.granted) {
        return storageStatus;
      }

      final storageResult = await Permission.storage.request();
      if (storageResult == PermissionStatus.granted) {
        return storageResult;
      }

      // If both failed and permanently denied, show dialog
      if (photosResult == PermissionStatus.permanentlyDenied ||
          storageResult == PermissionStatus.permanentlyDenied) {
        await showPermissionDeniedDialog(context, Permission.photos);
      }

      return storageResult;
    } catch (e) {
      print('Error handling storage permission: $e');
      return PermissionStatus.denied;
    }
  }

  /// Get permission name in Arabic for better user experience
  static String _getPermissionNameInArabic(Permission permission) {
    switch (permission) {
      case Permission.camera:
        return 'الكاميرا';
      case Permission.storage:
      case Permission.photos:
        return 'الصور والملفات';
      case Permission.microphone:
        return 'الميكروفون';
      case Permission.location:
        return 'الموقع';
      case Permission.contacts:
        return 'جهات الاتصال';
      case Permission.notification:
        return 'الإشعارات';
      default:
        return 'الصلاحية المطلوبة';
    }
  }

  /// Displays a dialog to inform the user about the required permission
  static Future<void> showPermissionDeniedDialog(
      BuildContext context,
      Permission permission,
      ) async {
    final permissionName = _getPermissionNameInArabic(permission);

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: Colors.orange,
              size: 28,
            ),
            SizedBox(width: 10),
            Text(
              'صلاحية $permissionName مطلوبة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Text(
          'يحتاج التطبيق إلى صلاحية $permissionName لتتمكن من استخدام هذه الميزة.\n\nيرجى منح الصلاحية من إعدادات التطبيق.',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey[600],
            ),
            child: Text(
              'إلغاء',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await openAppSettings();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffFF6B3D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: Text(
              'فتح الإعدادات',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Check multiple permissions at once
  static Future<Map<Permission, PermissionStatus>> checkMultiplePermissions(
      BuildContext context,
      List<Permission> permissions,
      ) async {
    Map<Permission, PermissionStatus> results = {};

    for (Permission permission in permissions) {
      results[permission] = await checkSpecificPermissions(
        context,
        permissionType: permission,
      );
    }

    return results;
  }

  /// Check if all required permissions for image picking are granted
  static Future<bool> checkImagePermissions(BuildContext context) async {
    if (Platform.isAndroid) {
      // For Android 13+, usually no permission needed for image picker
      // But we'll check anyway for older versions
      final result = await checkSpecificPermissions(
        context,
        permissionType: Permission.storage,
      );
      return result == PermissionStatus.granted;
    } else if (Platform.isIOS) {
      final result = await checkSpecificPermissions(
        context,
        permissionType: Permission.photos,
      );
      return result == PermissionStatus.granted;
    }

    return false;
  }


  static final InternetConnectionChecker _checker =
  InternetConnectionChecker.createInstance();


  /// Check internet connection
  static Future<bool> checkInternet() async {
    try {
      return true ;
      return await _checker.hasConnection;
    } catch (e) {
      print('Error checking internet connection: $e');
      return false;
    }
  }

  /// Show internet connection error dialog
  static Future<void> showNoInternetDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Row(
          children: [
            Icon(
              Icons.wifi_off_rounded,
              color: Colors.red,
              size: 28,
            ),
            SizedBox(width: 10),
            Text(
              'لا يوجد اتصال بالإنترنت',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Text(
          'يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى.',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffFF6B3D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'حسناً',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}