import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../art_core/utils/app_colors.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    required this.isSelected,
    required this.child,
    this.isLast = false,
  });

  final bool isSelected;
  final bool isLast;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      margin: EdgeInsets.only(right: isLast ? 0 : 8.w),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.textFieldLightFillColor,
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          width:  1.0,
        ),
      ),
      child: child,
    );
  }
}
