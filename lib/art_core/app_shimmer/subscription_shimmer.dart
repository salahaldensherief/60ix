part of "app_shimmer.dart";

class SubscriptionShimmer {

  static Widget buildList() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      padding: AppStyles.defaultPadding,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (_, _) => SizedBox(height: 16.0.h),
      itemBuilder: (context, index) => _SubscriptionCardShimmer(),
    );
  }


}


class _SubscriptionCardShimmer extends StatelessWidget {
  const _SubscriptionCardShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppStyles.paddingLarge),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium),
        border: Border.all(color: AppColors.stroke),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidgetsHelper.buildShimmerText(width: 120.w),
          SizedBox(height: 8.h),
          ShimmerWidgetsHelper.buildShimmerText(width: 180.w),
          SizedBox(height: 12.h),
          ...List.generate(3, (_) => Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerWidgetsHelper.buildShimmerText(width: 100.w),
                ShimmerWidgetsHelper.buildShimmerText(width: 80.w),
              ],
            ),
          )),
          SizedBox(height: 20.h),
          ShimmerWidgetsHelper.shimmerCard(height: 45.h),
        ],
      ),
    );
  }
}

