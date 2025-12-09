import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTextButtonStyles {
  static Color primaryColor(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return isDark
        ? AppColors.primaryBtnColor
        : AppColors.primaryBtnColor;
  }

  static Color secondaryColor(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return isDark
        ? AppColors.transparent
        : AppColors.secondaryBtnColor;
  }
}
// class AppTextButtonTextStyles {
//   static TextStyle headlinePrimary(BuildContext context) {
//     final isDark =
//         Theme.of(context).brightness == Brightness.dark;
//
//     return Theme.of(context).textTheme.headlineLarge!.copyWith(
//       color: isDark
//           ? AppColors.whiteColor
//           : AppColors.lightPrimaryText,
//     );
//   }
//
//   static TextStyle headlineSecondary(BuildContext context) {
//     final isDark =
//         Theme.of(context).brightness == Brightness.dark;
//
//     return Theme.of(context).textTheme.headlineLarge!.copyWith(
//       color: isDark
//           ? AppColors.darkSecondaryText
//           : AppColors.lightSecondaryText,
//     );
//   }
// }
