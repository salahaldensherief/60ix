part of "app_shimmer.dart";

class VendorShimmerHelper {
  static Widget buildListVertical() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      padding: AppStyles.defaultPadding,
      separatorBuilder: (_, __) => SizedBox(height: 15.h),
      itemBuilder: (context, index) => VendorCardShimmerV(),
    );
  }

  static Widget buildGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: (1.sw / 2 - 24.w) / 230.h,
      ),

      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      padding: AppStyles.defaultPadding,
      itemBuilder: (context, index) => VendorCardShimmerH(),
    );
  }

  static Widget buildListHorizontal() {
    return RSizedBox(
      height: 265.h,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        padding: AppStyles.defaultPadding,
        separatorBuilder: (_, __) => SizedBox(height: 15.h),
        itemBuilder: (context, index) => VendorCardShimmerV(),
      ),
    );
  }

  static Widget buildDetailsPage() {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),

          Align(
            alignment: Alignment.center,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                ShimmerWidgetsHelper.buildCircleShimmer(size: 100),
                SizedBox(height: 20.h),
                ShimmerWidgetsHelper.buildShimmerText(width: 100),
                SizedBox(height: 10.h),
                ShimmerWidgetsHelper.buildShimmerText(width: 200),
                SizedBox(height: 30.h),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              _smallItem(),
              ShimmerWidgetsHelper.buildShimmerText(height: 60, width: 2),
              _smallItem(),
              ShimmerWidgetsHelper.buildShimmerText(height: 60, width: 2),

              _smallItem(),
            ],
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              ShimmerWidgetsHelper.shimmerCard(height: 45, width: 100),

              ShimmerWidgetsHelper.shimmerCard(height: 45, width: 100),
              ShimmerWidgetsHelper.shimmerCard(height: 45, width: 100),
            ],
          ),
          SizedBox(height: 30.h),
          ShimmerWidgetsHelper.buildShimmerText(width: 200),
          SizedBox(height: 15.h),
          ShimmerWidgetsHelper.buildShimmerText(
            height: 10,
          ).paddingSymmetric(vertical: 4),
          ShimmerWidgetsHelper.buildShimmerText(
            height: 10,
          ).paddingSymmetric(vertical: 4),
          ShimmerWidgetsHelper.buildShimmerText(
            height: 10,
          ).paddingSymmetric(vertical: 4),
          ShimmerWidgetsHelper.buildShimmerText(
            height: 10,
          ).paddingSymmetric(vertical: 4),
          ShimmerWidgetsHelper.buildShimmerText(
            height: 10,
          ).paddingSymmetric(vertical: 4),

          SizedBox(height: 30.h),
          ShimmerWidgetsHelper.shimmerCard(height: 50),
          SizedBox(height: 10.h),

          ShimmerWidgetsHelper.shimmerCard(height: 50),
        ],
      ).paddingSymmetric(horizontal: AppStyles.paddingMedium),
    );
  }

  static Widget _smallItem() {
    return Column(
      children: [
        ShimmerWidgetsHelper.buildShimmerText(height: 40, width: 55),
        SizedBox(height: 8.h),
        ShimmerWidgetsHelper.buildShimmerText(height: 20, width: 50),
      ],
    );
  }
}

class VendorCardShimmerV extends StatelessWidget {
  const VendorCardShimmerV({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.getShimmerBackgroundColor(context),
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium),
        boxShadow: [AppStyles.shadowVLarge],
      ),
      child: Row(
        children: [
          // AppImage(
          //   urlImg: AssetsManager.serviceTest,
          //   width: 72.w,
          //   height: 72.h,
          //   borderRadius: 100.r,
          //   fit: BoxFit.cover,
          // ),
          ShimmerWidgetsHelper.buildCircleShimmer(size: 72),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AppText(
                        //   text: "Jane Doe",
                        //   fontSize: 12.sp,
                        //   fontWeight: FontWeight.w600,
                        // ),
                        // SizedBox(height: 5.h),
                        // AppText(
                        //   text: "Horse Trainer",
                        //   fontSize: 12.sp,
                        //   fontWeight: FontWeight.w500,
                        //   color: AppColors.grey.shade300,
                        // ),
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
                    Spacer(),
                    ShimmerWidgetsHelper.buildCircleShimmer(),
                    // FavoriteButton(isFavorite: isFavorite),
                  ],
                ),
                SizedBox(height: 11.h),
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

                    Spacer(),

                    ShimmerWidgetsHelper.buildShimmerText(
                      height: 16,
                      width: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VendorCardShimmerH extends StatelessWidget {
  const VendorCardShimmerH({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.getShimmerBackgroundColor(context),
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium),
        boxShadow: [AppStyles.shadowVLarge],
      ),
      child: Row(
        children: [
          // AppImage(
          //   urlImg: AssetsManager.serviceTest,
          //   width: 72.w,
          //   height: 72.h,
          //   borderRadius: 100.r,
          //   fit: BoxFit.cover,
          // ),
          ShimmerWidgetsHelper.buildCircleShimmer(size: 72),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AppText(
                        //   text: "Jane Doe",
                        //   fontSize: 12.sp,
                        //   fontWeight: FontWeight.w600,
                        // ),
                        // SizedBox(height: 5.h),
                        // AppText(
                        //   text: "Horse Trainer",
                        //   fontSize: 12.sp,
                        //   fontWeight: FontWeight.w500,
                        //   color: AppColors.grey.shade300,
                        // ),
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
                    Spacer(),
                    ShimmerWidgetsHelper.buildCircleShimmer(),
                    // FavoriteButton(isFavorite: isFavorite),
                  ],
                ),
                SizedBox(height: 11.h),
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

                    Spacer(),

                    ShimmerWidgetsHelper.buildShimmerText(
                      height: 16,
                      width: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
