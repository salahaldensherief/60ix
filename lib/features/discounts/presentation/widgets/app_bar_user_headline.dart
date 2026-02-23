import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';

import '../../../../art_core/theme/text_theme_toggle.dart';

class AppBarUserHeadline extends StatelessWidget {
  const AppBarUserHeadline({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final theme = TextThemeToggle.textTheme(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hi, Salah',
          style: theme.headlineLarge?.copyWith(fontSize: 14.sp),
        ).padOnly(bottom: 2),

        Text(
          'Cairo ,Egypt',
          style: theme.labelSmall?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
