import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/art_core/extensions/padding.dart';

import '../../../../art_core/theme/text_field_theme.dart';

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

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: AppTextFieldTheme.textFieldColor(context),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(image),
        ),
      ).padSymmetric(horizontal: 8),
    );
  }
}
