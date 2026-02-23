import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../art_core/extensions/padding.dart';
import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/assets_data.dart';

class AppBarIconsWidget extends StatelessWidget {
  final String icon;
  final void Function()? onTap;

   const AppBarIconsWidget({
    super.key, required this.icon, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.textFieldLightBorderColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
         icon

        ).padAll(6),
      ),
    );
  }
}
