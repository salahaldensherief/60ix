import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LaunchHelper {
  /// 🔹 Opens an external URL in a browser or supported app
  static Future<bool> openUrl(String urlString) async {
    try {
      final Uri url = Uri.parse(urlString);
      if (await canLaunchUrl(url)) {
        return await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        debugPrint('❌ Could not launch $urlString');
        return false;
      }
    } catch (e) {
      debugPrint('❌ Error launching URL: $e');
      return false;
    }
  }

  /// 🔹 Opens a location in Google Maps (Android) or Apple Maps (iOS)
  static Future<bool> openMap(LatLng location) async {
    try {
      final Uri url = Platform.isIOS
          ? Uri.parse('https://maps.apple.com/?q=${location.latitude},${location.longitude}')
          : Uri.parse('https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}');

      if (await canLaunchUrl(url)) {
        return await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        debugPrint('❌ Could not launch map at ${location.latitude}, ${location.longitude}');
        return false;
      }
    } catch (e) {
      debugPrint('❌ Error launching map: $e');
      return false;
    }
  }

  /// 🔹 Opens the phone dialer with a specific phone number
  /// Accepts formats: "+201011560375" or "01011560375"
  static Future<bool> callPhone(String phoneNumber) async {
    try {
      // Clean phone number (remove spaces, dashes, etc.)
      String cleanNumber = phoneNumber.replaceAll(RegExp(r'[\s\-\(\)]'), '');

      // Ensure it starts with +
      if (!cleanNumber.startsWith('+')) {
        // If it doesn't start with +, check if it's a local number
        if (cleanNumber.startsWith('0')) {
          // This is a local number, you might want to add country code
          debugPrint('⚠️ Local number detected: $cleanNumber. Consider adding country code.');
        }
      }

      final Uri url = Uri.parse('tel:$cleanNumber');

      if (await canLaunchUrl(url)) {
        return await launchUrl(url);
      } else {
        debugPrint('❌ Could not call $phoneNumber');
        return false;
      }
    } catch (e) {
      debugPrint('❌ Error calling phone: $e');
      return false;
    }
  }

  /// 🔹 Opens the default email client with the given email address
  static Future<bool> sendEmail(String email, {String? subject, String? body}) async {
    try {
      String emailUrl = 'mailto:$email';

      // Add subject and body if provided
      List<String> params = [];
      if (subject != null && subject.isNotEmpty) {
        params.add('subject=${Uri.encodeComponent(subject)}');
      }
      if (body != null && body.isNotEmpty) {
        params.add('body=${Uri.encodeComponent(body)}');
      }

      if (params.isNotEmpty) {
        emailUrl += '?${params.join('&')}';
      }

      final Uri url = Uri.parse(emailUrl);

      if (await canLaunchUrl(url)) {
        return await launchUrl(url);
      } else {
        debugPrint('❌ Could not send email to $email');
        return false;
      }
    } catch (e) {
      debugPrint('❌ Error sending email: $e');
      return false;
    }
  }

  /// 🔹 Opens WhatsApp chat with a specific number and optional message
  /// Phone number should include country code (e.g., "201011560375" or "+201011560375")
  static Future<bool> openWhatsApp(String phoneNumber, {String message = ''}) async {
    try {
      // Clean phone number (remove spaces, +, -, (, ))
      String cleanNumber = phoneNumber.replaceAll(RegExp(r'[\s\+\-\(\)]'), '');

      // Remove leading zeros (e.g., 0106... -> 106...)
      cleanNumber = cleanNumber.replaceFirst(RegExp(r'^0+'), '');

      // Add country code if missing (assuming Egypt = +20)
      if (!cleanNumber.startsWith('20')) {
        cleanNumber = '20$cleanNumber';
      }

      final Uri url = Uri.parse(
        'https://wa.me/$cleanNumber?text=${Uri.encodeComponent(message)}',
      );

      if (await canLaunchUrl(url)) {
        return await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        debugPrint('❌ Could not open WhatsApp chat with $cleanNumber');
        return false;
      }
    } catch (e) {
      debugPrint('❌ Error opening WhatsApp: $e');
      return false;
    }
  }


  /// 🔹 Opens a social media link in the default browser
  static Future<bool> openSocialMedia(String platform, String user) async {
    try {
      String urlString;
      switch (platform.toLowerCase()) {
        case 'facebook':
          urlString = 'https://www.facebook.com/$user';
          break;
        case 'instagram':
          urlString = 'https://www.instagram.com/$user';
          break;
        case 'x':
        case 'twitter': // Support both
          urlString = 'https://twitter.com/$user';
          break;
        case 'tiktok':
          urlString = 'https://www.tiktok.com/@$user';
          break;
        default:
          debugPrint('❌ Unsupported social media platform: $platform');
          return false;
      }
      return await openUrl(urlString);
    } catch (e) {
      debugPrint('❌ Error opening social media: $e');
      return false;
    }
  }
}