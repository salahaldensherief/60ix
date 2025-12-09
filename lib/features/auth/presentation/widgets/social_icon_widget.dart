import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../art_core/theme/text_field_theme.dart';
import '../../../../art_core/utils/app_colors.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget({
    super.key,
    required this.onPressed,
    required this.image,
  });

  final VoidCallback onPressed;
  final String  image;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: AppTextFieldTheme.textFieldColor(context),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
