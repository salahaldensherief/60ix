part of "app_shimmer.dart";

class DropDownShimmer extends StatelessWidget {
  final double? width;
  final double? height;

  const DropDownShimmer({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.getShimmerBaseColor(context),
      highlightColor: AppColors.getShimmerHighlightColor(context),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50.h,
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.getShimmerBackgroundColor(context),
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(
            color: const Color.fromRGBO(238, 238, 238, 1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 14.h,
                color: AppColors.getShimmerBackgroundColor(context),
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.arrow_drop_down,
              color: AppColors.getShimmerBackgroundColor(context),
            ),
          ],
        ),
      ),
    );
  }
}
