import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/core/utils/app_colors.dart';
import 'package:ix/core/utils/font_weight_helper.dart';

class TextStyles {
  static TextStyle font20SemiBoldBlue = TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.blue500,
  );
  static TextStyle font14SemiBoldBlue = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.blue500,
  );
  static TextStyle font14SemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.whiteColor,
  );
  static TextStyle font14 = TextStyle(
    fontSize: 14,
    color: AppColors.textColorPrimary,

    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16SemiBold = TextStyle(
    fontSize: 16.sp,
    color: AppColors.textColorPrimary,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font12Small = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.small,
  );static TextStyle font12bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14SemiBoldOrange = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.primaryColor,
  );
  static TextStyle font14BoldOrange = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle font14MediumGray = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.gray300Color,
  );
  static TextStyle font18MediumGray = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.gray300Color,
  );
  static TextStyle font14SemiBoldGray = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.gray300Color,
  );
  static TextStyle font14mediumRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textColorPrimary,
  );
  static TextStyle font14lightRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.small,
    color: AppColors.textColorPrimary,
  );
  static TextStyle font12Regular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.Regular,
    color: AppColors.textColorSecondary,
  );
  static TextStyle font12light = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.small,
    color: AppColors.textColorSecondary,
  );
}
