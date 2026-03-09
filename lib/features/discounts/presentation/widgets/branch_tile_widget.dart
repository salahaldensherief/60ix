import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/assets_data.dart';
import '../../domain/branch_model.dart';

class BranchTileWidget extends StatelessWidget {
  final BranchModel branch;
  final bool isSelected;
  final VoidCallback onTap;

  const BranchTileWidget({
    required this.branch,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.textFieldLightFillColor,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [
            Container(
              width: 38.w,
              height: 38.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryColor
                    : Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AssetsData.mapIcon,
                  color: isSelected
                      ? AppColors.whiteColor
                      : AppColors.colorBtnSecondaryLabel,
                ),
              ),
            ),

            SizedBox(width: 10.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          branch.name,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1A1A2E),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      SizedBox(width: 3.w),
                      Text(
                        branch.address,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 14.w,
                  height: 14.w,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.greenColor
                        : AppColors.whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.greenColor
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Icon(
                            Icons.check,
                            size: 10.sp,
                            color: AppColors.whiteColor,
                          ),
                        )
                      : null,
                ),
                SizedBox(height: 5),
                Text(
                  '${branch.price.toStringAsFixed(2)} SAR',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isSelected ? AppColors.primaryColor: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
