import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/utils/app_colors.dart';

class BranchSelectorWidget extends StatelessWidget {
  final VoidCallback onChooseOptions;
  final VoidCallback onChooseBranch;
  final bool isOptionsSelected;

  const BranchSelectorWidget({
    super.key,
    required this.onChooseOptions,
    required this.onChooseBranch,
    this.isOptionsSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ActionButton(
            label: 'Choose Branch',
            color: !isOptionsSelected
                ? AppColors.colorBtnSecondaryLabel
                : AppColors.borderColor,
            textColor: !isOptionsSelected
                ? Colors.white
                : AppColors.colorBtnSecondaryLabel,
            svgIcon: '',
            onTap: onChooseBranch,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: ActionButton(
            label: 'Choose Options & Ads',
            color: isOptionsSelected
                ? AppColors.colorBtnSecondaryLabel
                : AppColors.borderColor,
            textColor: isOptionsSelected
                ? Colors.white
                : AppColors.colorBtnSecondaryLabel,

            svgIcon: '',
            onTap: onChooseOptions,
          ),
        ),
      ],
    );
  }
}
class ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final String svgIcon;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.label,
    required this.color,
    required this.textColor,
    required this.svgIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.5.sp,
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}