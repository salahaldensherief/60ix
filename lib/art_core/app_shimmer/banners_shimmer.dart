part of "app_shimmer.dart";

class BannersShimmer {
  static Widget buildList() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      padding: AppStyles.defaultPadding,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (_, _) => SizedBox(height: 16.0.h),
      itemBuilder:
          (context, index) =>
              ShimmerWidgetsHelper.shimmerCard(height: 180.h, radius: 36.r),
    );
  }
}
