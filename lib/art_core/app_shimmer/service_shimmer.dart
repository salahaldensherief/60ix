part of "app_shimmer.dart";

class ServiceShimmerHelper {
  static Widget serviceCardShimmerH() => ServiceCardShimmerH();

  static Widget buildListHorizontal() {
    return SizedBox(
      height: 265.h,
      child: ListView.separated(
        itemCount: 4,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) => ServiceCardShimmerH(),
      ),
    );
  }

  static Widget buildListVertical() {
    return ListView.separated(
      itemCount: 4,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) => ServiceCardShimmerH(),
    );
  }

  static Widget buildGrid({bool isShrinkWrap = false}) {
    return GridView.builder(
      shrinkWrap: isShrinkWrap,
      physics:
          isShrinkWrap
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: (1.sw / 2 - 24.w) / 230.h,
      ),
      itemCount: 6,
      itemBuilder: (_, i) => ServiceCardShimmerH(),
    );
  }

  static Widget buildDetailsPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 270.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 4),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              return _CustomShimmerCard(height: 270.h, width: 270.w);
            },
          ),
        ),

        SizedBox(height: 30.h),
        ShimmerWidgetsHelper.buildShimmerText(
          width: 200.w,
        ).paddingSymmetric(horizontal: AppStyles.paddingLarge),
        SizedBox(height: 10.h),

        ShimmerWidgetsHelper.buildShimmerText(
          width: 140.w,
        ).paddingSymmetric(horizontal: AppStyles.paddingLarge),
        SizedBox(height: 10.h),

        ShimmerWidgetsHelper.buildShimmerText(
          width: 200.w,
        ).paddingSymmetric(horizontal: AppStyles.paddingLarge),
        SizedBox(height: 16.h),
        ShimmerWidgetsHelper.shimmerCard(
          height: 55.h,
        ).paddingSymmetric(horizontal: AppStyles.paddingLarge),
        SizedBox(height: 16.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerWidgetsHelper.buildShimmerText(width: 150.w),
            ShimmerWidgetsHelper.buildShimmerText(width: 80.w),
          ],
        ).paddingSymmetric(horizontal: AppStyles.paddingLarge),
        SizedBox(height: 16.h),

        ShimmerWidgetsHelper.buildShimmerText(
          height: 10,
        ).paddingSymmetric(horizontal: AppStyles.paddingLarge, vertical: 4),
        ShimmerWidgetsHelper.buildShimmerText(
          height: 10,
        ).paddingSymmetric(horizontal: AppStyles.paddingLarge, vertical: 4),
        ShimmerWidgetsHelper.buildShimmerText(
          height: 10,
        ).paddingSymmetric(horizontal: AppStyles.paddingLarge, vertical: 4),
        ShimmerWidgetsHelper.buildShimmerText(
          height: 10,
        ).paddingSymmetric(horizontal: AppStyles.paddingLarge, vertical: 4),
        ShimmerWidgetsHelper.buildShimmerText(
          height: 10,
        ).paddingSymmetric(horizontal: AppStyles.paddingLarge, vertical: 4),
        SizedBox(height: 16.h),

        ShimmerWidgetsHelper.shimmerCard(
          height: 50.h,
        ).paddingSymmetric(horizontal: AppStyles.paddingLarge),
      ],
    );
  }
}

class ServiceCardShimmerH extends StatelessWidget {
  const ServiceCardShimmerH({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166.w,
      height: 265.h,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium.r),
        boxShadow: [AppStyles.shadowMedium],
        color: AppColors.getShimmerBackgroundColor(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Stack(
            children: [
              _CustomShimmerCard(
                height: 120,
                width: double.infinity,
                radius: AppStyles.borderRadiusMedium,
              ),
              PositionedDirectional(
                top: 6.h,
                end: 6.w,
                child: ShimmerWidgetsHelper.buildCircleShimmer(),
              ),
            ],
          ),

          Padding(
            padding: REdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerWidgetsHelper.buildShimmerText(
                            height: 14,
                            width: 100,
                          ),
                          SizedBox(height: 5.h),
                          ShimmerWidgetsHelper.buildShimmerText(
                            height: 14,
                            width: 80,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 5.w,
                        runSpacing: 5.w,
                        children: [
                          FittedBox(
                            child: ShimmerWidgetsHelper.buildShimmerText(
                              height: 14,
                              width: 50,
                            ),
                          ),
                          FittedBox(
                            child: ShimmerWidgetsHelper.buildShimmerText(
                              height: 10,
                              width: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    ShimmerWidgetsHelper.buildShimmerText(
                      height: 14,
                      width: 14,
                    ),
                    SizedBox(width: 2.w),
                    ShimmerWidgetsHelper.buildShimmerText(
                      height: 14,
                      width: 50,
                    ),
                    const Spacer(),
                    ShimmerWidgetsHelper.buildShimmerText(
                      height: 16,
                      width: 16,
                    ),
                    SizedBox(width: 2.w),
                    ShimmerWidgetsHelper.buildShimmerText(
                      height: 14,
                      width: 50,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                Center(
                  child: ShimmerWidgetsHelper.buildShimmerText(
                    height: 30,
                    width: double.infinity,
                    radius: 4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
