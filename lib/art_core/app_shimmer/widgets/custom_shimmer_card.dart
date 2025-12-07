part of "../app_shimmer.dart";

class _CustomShimmerCard extends StatelessWidget {
  final double? width, height, radius;
  final Widget? child;
  final bool isCircle;

  const _CustomShimmerCard({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.child,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.getShimmerBaseColor(context),
      highlightColor: AppColors.getShimmerHighlightColor(context),
      child: Container(
        width: width?.w,
        height: height?.h,
        decoration: BoxDecoration(
          color: AppColors.getShimmerBackgroundColor(context),
          borderRadius: isCircle ? null : BorderRadius.circular(radius ?? AppStyles.borderRadiusMedium.r),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: child,
      ),
    );
  }
}
