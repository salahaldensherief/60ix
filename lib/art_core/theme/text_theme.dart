import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/font_styles.dart';

class TTextTheme {

  static TextTheme lightTextTheme = TextTheme(

    // onboarding
    displayMedium: TextStyles.font18SemiBold.copyWith(
      color: AppColors.textColorLightPrimary,
    ),
    // appbar title / buttons text
    headlineLarge: TextStyles.font16SemiBold.copyWith(
      color: AppColors.textColorLightPrimary,

    ),
    // appbar subtitle
    headlineMedium: TextStyles.font18SemiBold.copyWith(
      color: AppColors.textColorLightPrimary,
    ),
    titleLarge: TextStyles.font14mediumRegular.copyWith(
      color: AppColors.textColorLightPrimary,
    ),

    // text field label / top hint
    titleMedium: TextStyles.font12mediumRegular.copyWith(
      color: AppColors.textColorLightSecondary,
    ),
    titleSmall:TextStyles.font12SemiBold.copyWith(
      color: AppColors.primaryColor,
    ),

    bodyLarge: TextStyles.font12Regular.copyWith(
      color: AppColors.textColorLightPrimary,
    ),

    bodyMedium: TextStyles.font12mediumRegular.copyWith(
      color: AppColors.textColorLightSecondary,
    ),

    bodySmall: TextStyles.font12Regular.copyWith(
      color: AppColors.gray300Color,
    ),

    labelSmall: TextStyles.font12mediumRegular.copyWith(
      color: AppColors.gray300Color,
    ),

  );


  static TextTheme darkTextTheme = TextTheme(

    // onboarding
    displayMedium: TextStyles.font18SemiBold.copyWith(
      color: AppColors.whiteColor,
    ),

    // appbar title / buttons text
    headlineLarge: TextStyles.font16SemiBold.copyWith(
      color: AppColors.appBarDarkColor,
    ),

    // appbar subtitle / helper text
    headlineMedium: TextStyles.font12Regular.copyWith(
      color: AppColors.textColorDarkSecondary,
    ),

    titleSmall:TextStyles.font12SemiBold.copyWith(
      color: AppColors.textColorDarkSecondary,
    ),

    titleLarge: TextStyles.font14mediumRegular.copyWith(
      color: AppColors.textColorDarkPrimary,
    ),

    // text field label / top hint
    titleMedium: TextStyles.font12mediumRegular.copyWith(
      color: AppColors.textColorDarkSecondary,
    ),

    bodyLarge: TextStyles.font12Regular.copyWith(
      color: AppColors.textColorDarkPrimary,
    ),

    bodyMedium: TextStyles.font12mediumRegular.copyWith(
      color: AppColors.textColorDarkSecondary,
    ),

    bodySmall: TextStyles.font12Regular.copyWith(
      color: AppColors.textColorDarkThree,
    ),

    labelSmall: TextStyles.font12mediumRegular.copyWith(
      color: AppColors.textColorDarkThree,
    ),
  );
}
