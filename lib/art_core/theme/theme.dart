 import 'package:flutter/material.dart';
import 'package:ix/art_core/theme/text_theme.dart';

import '../utils/app_colors.dart';

class AppTheme{

  static ThemeData lightTheme = ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.whiteColor,
      fontFamily: 'Source Sans 3',
      primaryColor: AppColors.primaryBtnColor,
    textTheme: TTextTheme.lightTextTheme,

  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
    fontFamily: 'Source Sans 3',
    primaryColor: AppColors.primaryBtnColor,
      textTheme: TTextTheme.darkTextTheme,
  );

 }