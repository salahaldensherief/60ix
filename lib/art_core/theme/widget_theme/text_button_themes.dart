part of '../themes.dart';

class AppTextButtonThemes {
  static TextButtonThemeData light = TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      iconAlignment: IconAlignment.end,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      textStyle: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
        fontFamily: FontsManager.fontFamily,
      ),
    ),
  );

  static TextButtonThemeData dark = TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      iconAlignment: IconAlignment.end,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      textStyle: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.grey.shade50, 
        fontFamily: FontsManager.fontFamily,
      ),
      backgroundColor: AppColors.transparent,
    ),
  );
}