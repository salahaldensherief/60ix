import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../art_core/utils/app_colors.dart';

class DiscountContainerWidget extends StatelessWidget {
  const DiscountContainerWidget({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
     height:  14.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.discountColor,

      ),
      child: Center(
        child: Text(
          '20% Off',style: theme.bodyLarge?.copyWith(
          fontSize: 8.sp,
          fontWeight: FontWeight.w600,

        ),
            ),
      ),
    );
  }
}
