part of "app_shimmer.dart";

class CustomSearchShimmer extends StatelessWidget {
  final double? width, height, radius;
  final bool hasLeadingWidget, hasText, hasSearchIcon;
  final String? hint;

  const CustomSearchShimmer({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.hasLeadingWidget = false,
    this.hasText = false,
    this.hasSearchIcon = false,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _CustomShimmerCard(width: width, height: height, radius: radius),
        if (hasText) ...[
          PositionedDirectional(
            top: 20,
            end: 70,
            child: Shimmer.fromColors(
              baseColor: AppColors.getShimmerBaseColor(context),
              highlightColor: AppColors.getShimmerHighlightColor(context),
              child: AppText(
                text: hint ?? AppString.searchForServicesAndVendors.tr(),
              ),
            ),
          ),
        ],

        if (hasSearchIcon) ...[
          PositionedDirectional(
            top: 20,
            start: 10,
            child: Shimmer.fromColors(
              baseColor: AppColors.getShimmerBaseColor(context),
              highlightColor: AppColors.getShimmerHighlightColor(context),
              child: SvgIconWidget(path: AssetsManager.search),
            ),
          ),
        ],

        if (hasLeadingWidget) ...[
          PositionedDirectional(
            top: 10,
            end: 10,
            child: _CustomShimmerCard(width: 38.w, height: 38.h, radius: 10.r),
          ),
        ],
      ],
    );
  }
}
