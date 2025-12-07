part of '../themes.dart';

class TextFieldThemes {
  static const Color _whiteColor = Colors.white;

  static InputDecorationTheme light = InputDecorationTheme(
    fillColor: _whiteColor,
    filled: true,
    border: InputBorder.none,
  );

  static InputDecorationTheme dark = InputDecorationTheme(
    fillColor: AppColors.darkBlue, 
    border: InputBorder.none,
    hintStyle: TextStyle(color: AppColors.grey.shade50.withValues(alpha: 0.6)),
    labelStyle: TextStyle(color: AppColors.grey.shade50),
    filled: true,
  );
}