import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<void> requestPermissions() async {
    // Request WiFi & Location permissions
    await [
      Permission.location,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.nearbyWifiDevices,
    ].request();
  }

  static Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    debugPrint("######### requestLocationPermission ##########  STATUS =====>>> ${status.toString()} ");
    return status.isGranted;
  }


  static Future<bool> hasPermissions() async {
    return await Permission.location.isGranted &&
        await Permission.bluetoothScan.isGranted &&
        await Permission.bluetoothConnect.isGranted;
  }
}
