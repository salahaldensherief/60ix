import 'package:flutter/material.dart';
import 'package:ix/art_core/theme/text_theme.dart';

class TextThemeToggle {
  static TextTheme textTheme(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return isDark
        ? TTextTheme.darkTextTheme
        : TTextTheme.lightTextTheme;
  }

}