part of '../themes.dart';

class AppBarThemes {
  static AppBarTheme light = AppBarTheme(
    backgroundColor: AppColors.transparent,
    shadowColor: AppColors.transparent,
    surfaceTintColor: AppColors.transparent,
    centerTitle: true,
    scrolledUnderElevation: 0,
    elevation: 0,
    titleSpacing: 0,
    iconTheme: IconThemeData(color: AppColors.blue.shade500, size: 20),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.blue,
      fontFamily: FontsManager.fontFamily
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.scaffoldBackgroundLight,
    ),
  );

  static AppBarTheme dark = AppBarTheme(
    backgroundColor: AppColors.transparent,
    shadowColor: AppColors.transparent,
    surfaceTintColor: AppColors.transparent,
    centerTitle: true,
    scrolledUnderElevation: 0,
    elevation: 0,
    titleSpacing: 0,
    iconTheme: IconThemeData(
      color: AppColors.grey.shade50,
      size: 20,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.grey.shade50,
        fontFamily: FontsManager.fontFamily
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: AppColors.scaffoldBackgroundDark,
    ),
  );
}