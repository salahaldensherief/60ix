part of '../themes.dart';

class AppTabBarThemes {
  static TabBarThemeData light = TabBarThemeData(
    labelColor: AppColors.blue,
    indicatorAnimation: TabIndicatorAnimation.linear,
    labelPadding: REdgeInsetsDirectional.only(end: 15),
    dividerColor: Colors.transparent,
    indicatorColor: Colors.transparent,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.blue,
    ),
  );

  static TabBarThemeData dark = TabBarThemeData(
    labelColor: AppColors.grey.shade50,
    labelStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    ),
    overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
    indicatorAnimation: TabIndicatorAnimation.linear,
    unselectedLabelColor: AppColors.grey.shade50.withOpacity(0.6), 
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.transparent,
    indicatorColor: Colors.transparent,
    dividerHeight: 2.1.h,
    unselectedLabelStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.grey.shade50.withOpacity(0.6), 
    ),
  );
}