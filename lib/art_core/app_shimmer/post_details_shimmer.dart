import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_styles.dart';
import '../theme/themes.dart';
import 'app_shimmer.dart';
class PostDetailsShimmerCard extends StatelessWidget {
  const PostDetailsShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0,),
      child: Container(
        padding: REdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.getShimmerBackgroundColor(context),
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium),
          boxShadow: [AppStyles.shadowVLarge],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerWidgetsHelper.buildShimmerText(height: 18, width: 180), // title
            SizedBox(height: 8.h),
            ShimmerWidgetsHelper.buildShimmerText(height: 14, width: 120), // subtitle
            SizedBox(height: 12.h),
            ShimmerWidgetsHelper.buildShimmerText(height: 100, width: double.infinity), // content block
            SizedBox(height: 12.h),
            Row(
              children: [
                ShimmerWidgetsHelper.buildCircleShimmer(size: 40),
                SizedBox(width: 10.w),
                ShimmerWidgetsHelper.buildShimmerText(height: 14, width: 100), // username
              ],
            ),
          ],
        ),
      ),
    );
  }
}
