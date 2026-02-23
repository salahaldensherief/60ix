import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/art_core/extensions/padding.dart';

import '../../../../art_core/utils/app_colors.dart';

class CategoriesHeadline extends StatelessWidget {
 final String? name1;
 final String? name2;
  final String? icon;
  final String? suffixIcon;

  const CategoriesHeadline({super.key,   this.icon, this.suffixIcon, this.name1, this.name2});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Row(
      children: [
        SvgPicture.asset(icon??'',width: 20.w,height: 20.h,),
        SizedBox(width: 5.w,),
        RichText(
          text: TextSpan(
            text: name1,

            style: theme.headlineLarge,
            children: [
              TextSpan(
                text: name2,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        SvgPicture.asset(suffixIcon??'')

      ],
    );
  }
}
