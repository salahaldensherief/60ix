part of 'themes.dart';

enum AppTheme { light, dark }

class AppThemes {
  static ThemeData light = ThemeData(
    appBarTheme: AppBarThemes.light,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
    buttonTheme: AppButtonThemes.light,
    inputDecorationTheme: TextFieldThemes.light,
    // platform: TargetPlatform.iOS,
    tabBarTheme: AppTabBarThemes.light,
    textButtonTheme: AppTextButtonThemes.light,
    iconTheme: IconThemeData(color: AppColors.blue.shade500),
    cardTheme: CardThemeData(
      color: AppColors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    fontFamily: FontsManager.fontFamily,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.blue.shade500),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary.shade100,
      secondary: AppColors.blue,
      surface: AppColors.white,
      error: AppColors.red,
      onPrimary: AppColors.white,
      onSecondary: AppColors.blue.shade500,
      onSurface: AppColors.blue.shade500,
      onError: AppColors.white,
    ),
    useMaterial3: true,
  );

  static ThemeData dark = ThemeData(
    appBarTheme: AppBarThemes.dark,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
    buttonTheme: AppButtonThemes.dark,
    inputDecorationTheme: TextFieldThemes.dark,
    tabBarTheme: AppTabBarThemes.dark,
    textButtonTheme: AppTextButtonThemes.dark,
    iconTheme: IconThemeData(color: AppColors.grey.shade50),
    cardTheme: CardThemeData(
      color: AppColors.darkBlue,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    fontFamily: FontsManager.fontFamily,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.grey.shade50),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary.shade100,
      secondary: AppColors.blue,
      surface: AppColors.darkBlue,
      error: AppColors.red,
      onPrimary: AppColors.white,
      onSecondary: AppColors.blue.shade500,
      onSurface: AppColors.grey.shade50,
      onError: AppColors.white,
    ).copyWith(surface: AppColors.darkBlue),
    useMaterial3: true,
  );

  static ThemeMode themeMode() {
    final isDarkMode = PreferenceManager().isDarkMode();

    if (isDarkMode == null) {
      final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    } else {
      return isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
  }

  static bool isDarkMode() {
    return themeMode() == ThemeMode.dark;
  }
}
