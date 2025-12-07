part of '../themes.dart';

class AppButtonThemes {
  static ButtonThemeData light = ButtonThemeData(
    buttonColor: AppColors.primary,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  static ButtonThemeData dark = ButtonThemeData(
    buttonColor: AppColors.primary,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.grey.shade50, 
      surface: AppColors.darkBlue, 
    ),
  );
}