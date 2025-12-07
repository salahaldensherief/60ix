part of "../app_shimmer.dart";

class _CustomSectionTitle extends StatelessWidget {
  final String title;
  final bool showAll;
  final EdgeInsetsGeometry? padding;

  const _CustomSectionTitle({
    super.key,
    required this.title,
    this.showAll = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.getShimmerBaseColor(context),
      highlightColor: AppColors.getShimmerHighlightColor(context),
      child: Padding(
        padding: padding ?? AppStyles.defaultPaddingH,
        child: Row(
          children: [
            AppText(text: title, fontSize: 18.sp, fontWeight: FontWeight.w600),
            const Spacer(),
            if (showAll) ...[
              TextButton.icon(
                onPressed: null,
                label: AppText(
                  text: AppString.seeAll.tr(),
                  color: AppColors.primary,
                  fontSize: 12.sp,
                ),
                icon: SvgIconWidget(
                  path: AssetsManager.arrowRight,
                  width: 5.w,
                  height: 10.h,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
