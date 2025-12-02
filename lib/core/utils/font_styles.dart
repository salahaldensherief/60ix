import 'package:flutter/material.dart';
import 'package:ix/core/utils/app_colors.dart';
import 'package:ix/core/utils/font_weight_helper.dart';

class TextStyles{
  static TextStyle font20SemiBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.blue500,
  );
  static TextStyle font14SemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.whiteColor,
  ); static TextStyle font14SemiBoldOrange = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.primaryColor,
  );

  static TextStyle font14MediumGray = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.gray300Color,
  );

}