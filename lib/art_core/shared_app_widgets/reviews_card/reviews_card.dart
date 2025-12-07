part of '../shared_app_widgets.dart';

class ReviewsCard extends StatelessWidget {
  final ReviewsModel model;
  const ReviewsCard({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusSmall),
        border: Border.all(color: AppColors.shadowColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.0.w,
        children: [
          CircleAvatar(
            radius: 25.0.sp,
            backgroundColor: AppColors.transparent,
            child: ClipOval(
              child: AppImage(
                urlImg: model.creatorModel?.profile?.path ?? "",
                fit: BoxFit.fill,
                height: 50.h,
                width: 50.w,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppText(
                  text: model.creatorModel?.name ?? "",
                  fontSize: 14.sp,
                  maxLines: 2,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                AppText(
                  text: model.createdAt ?? "",
                  color: AppColors.red,
                  fontSize: 10.sp,
                ),
                SizedBox(height: 8.h),
                AppText(
                  text: model.comment ?? "",
                  showAllTextOnTap: true,
                  // color: AppColors.grey.shade300,
                  fontSize: 12.sp,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              border: Border.all(color: AppColors.yellow, width: 2.0.w),
              borderRadius: BorderRadius.circular(13.r),
            ),
            padding: REdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Row(
              children: [
                SvgIconWidget(
                  path: AssetsManager.star,
                  height: 14.h,
                  width: 14.w,
                ),
                SizedBox(width: 6.0.w),
                AppText(
                  text: "${model.value}",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
