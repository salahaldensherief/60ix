import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position?> getCurrentLocation() async {
    log("❇❇ Get Current Location ❇❇❇");
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        log("❌❌❌Location services are disabled. ❌❌❌", error: 'Location');

        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          log("❌❌❌Location permissions are denied. ❌❌❌", error: 'Location');

          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        log("❌❌❌Location permissions are permanently denied, we cannot request permissions. ❌❌❌",
            error: 'Location');

        return Future.error('Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      final location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      log("❇️❇️ Success Get Current Location ❇️❇️ latitude >>>  ${location.latitude} &&& longitude >>>  ${location.longitude}  ");

      return location;
    } on Exception catch (e, s) {
      log("❌❌❌Exception $e ❌❌❌  $s", error: 'Location');

      return Future.error(e);
    }
  }

  Future<String?> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<String?> getCurrentAddress() async {
    try {
      final res = await getCurrentLocation();
      if (res != null) {
        return await getAddressFromLatLng(res.latitude, res.latitude);
      }
    } catch (e) {
      print("catch_errro $e");
    }
    return null;
  }
}