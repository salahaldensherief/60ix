import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/app_shimmer/post_details_shimmer.dart';

import '../resources/app_styles.dart';
import 'comments_shimmer.dart';

class PostShimmerHelper {
  static Widget buildPostDetailsShimmer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PostDetailsShimmerCard(),
    );
  }

  static Widget buildPostDetailsShimmerList() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      // padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingLarge),
      separatorBuilder: (_, __) => SizedBox(height: 10.h),
      itemBuilder: (context, index) => const PostDetailsShimmerCard(),
    );
  }


  static Widget buildCommentsShimmer() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingLarge),
      separatorBuilder: (_, __) => SizedBox(height: 10.h),
      itemBuilder: (context, index) => const CommentShimmerCard(),
    );
  }
}
