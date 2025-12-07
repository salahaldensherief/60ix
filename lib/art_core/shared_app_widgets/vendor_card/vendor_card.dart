part of "../shared_app_widgets.dart";

class VendorCard extends StatelessWidget {
  final VendorModel vendor;
  final void Function(bool isFav , int count)? onToggleFavorite;

  const VendorCard({super.key, required this.vendor , this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(
          NavigatorKeys.VENDOR_KEY + NavigatorKeys.VENDOR_PROFILE_PAGE,
          arguments: vendor.id,
        );
      },
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.getCardBackground(context),
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium),
          boxShadow: [AppStyles.shadowVLarge],
        ),
        child: Row(
          children: [
            Container(
              width: 72.w,
              height: 72.h,
              decoration: BoxDecoration(
                color: AppColors.grey.shade800,
                borderRadius: BorderRadius.circular(100.r),
                boxShadow: [AppStyles.shadowLarge],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: AppImage(
                  urlImg: vendor.vendorLogo?.path ?? "",
                  useFirstNameIfError: true,
                  nameIfError:vendor.name ,
                  width: 72.w,
                  height: 72.h,
                  borderRadius: 100.r,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: vendor.name ?? "",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: vendor?.description ?? "",
                              fontSize: 12.sp,
                              maxLines: 2,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey.shade300,
                              overflow:  TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      FavoriteButton(
                        type:MainTypesEnum.vendor ,
                        modelId: vendor.id!,
                        initialValue: vendor.isFavourite,
                        onToggle: onToggleFavorite,
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      AppText(
                        text: "(${vendor.ratesAvgValue?.toStringAsFixed(1) ?? "0.0"})",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey.shade300,
                      ),
                      SizedBox(width: 4.w),
                      SvgIconWidget(
                        path: AssetsManager.star,
                        width: 14.w,
                        height: 14.h,
                      ),
                      if((vendor.ratesCount) > 0 ) ...[
                        SizedBox(width: 8.w),
                        AppText(
                          text: "${vendor.ratesCount} ${AppString.ratings.tr()}",
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ],

                      // Spacer(),
                      // SvgIconWidget(
                      //   path: AssetsManager.location,
                      //   width: 16.w,
                      //   height: 16.h,
                      // ),
                      // SizedBox(width: 2.w),
                      // AppText(
                      //   text: vendor.details?.country?.name ?? "",
                      //   fontSize: 10.sp,
                      //   fontWeight: FontWeight.w500,
                      //   color: AppColors.grey.shade300,
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
