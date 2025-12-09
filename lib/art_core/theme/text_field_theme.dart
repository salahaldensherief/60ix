import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTextFieldTheme {
  static Color textFieldColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return isDark ? AppColors.textFieldDarkFillColor : AppColors.textFieldLightFillColor;
  }


}
