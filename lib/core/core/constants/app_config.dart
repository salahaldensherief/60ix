import 'package:flutter/material.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';

import '../cache/preference_manager.dart';

class AppConfig {
  // App Information
  static const String appName = "60IX";
  static const String appVersion = "1.0.0";

  ///********************* Themes *********************///
  static bool get isDarkMode => AppThemes.themeMode() == ThemeMode.dark;

  static bool get isGuestUser =>
      PreferenceManager().isOpenAsGuestUser() ||
      PreferenceManager().authToken().isEmpty;

  static void checkIfGuestUser() {
    if (isGuestUser) {
      CheckLoginView.show();
      return;
    }
  }

  // {
  //   try {
  //     final context = Modular.routerDelegate.navigatorKey.currentContext;
  //     if (context != null) {
  //       return Theme.of(context).brightness == Brightness.dark;
  //     }
  //     return PreferenceManager().isDarkMode();
  //   } catch (e) {
  //     return PreferenceManager().isDarkMode();
  //   }
  // }

  // Context-aware isDarkMode for widgets usage
  static bool isDarkModeWithContext(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  ///********************* Localization *********************///
  static const String _englishLanguageCode = "en";
  static const String _arabicLanguageCode = "ar";
  static const List<Locale> supportedLanguages = [
    Locale(_englishLanguageCode),
    Locale(_arabicLanguageCode),
  ];

  static bool get isEnglish =>
      PreferenceManager().currentLang() == _englishLanguageCode;

  static bool get isArabic =>
      PreferenceManager().currentLang() == _arabicLanguageCode;

  // Currency
  static const String defaultCurrency = "SAR";

  // Timeout Durations
  static const Duration apiTimeout = Duration(seconds: 30);



  ///********************* App Settings *********************///
  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

}
