import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_styles.dart';
import '../theme/themes.dart';
import 'app_shimmer.dart';

class CommentShimmerCard extends StatelessWidget {
  const CommentShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.getShimmerBackgroundColor(context),
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusSmall),
        boxShadow: [AppStyles.shadowSmall],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidgetsHelper.buildCircleShimmer(size: 36),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidgetsHelper.buildShimmerText(height: 12, width: 100),
                // username
                SizedBox(height: 6.h),
                ShimmerWidgetsHelper.buildShimmerText(
                  height: 14,
                  width: double.infinity,
                ),
                SizedBox(height: 4.h),
                ShimmerWidgetsHelper.buildShimmerText(
                  height: 14,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
