import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../extensions/padding.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_data.dart';

class LoveIconWidget extends StatelessWidget {
  const LoveIconWidget({super.key, this.onTap});
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.whiteColor,
        ),
        child: SvgPicture.asset(AssetsData.loveIcon).padAll(4),
      ),
    );
  }
}
