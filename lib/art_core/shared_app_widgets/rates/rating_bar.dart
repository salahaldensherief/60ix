part of '../shared_app_widgets.dart';


class RatingBarWidget extends StatelessWidget {
  final double rating;
  final double itemSize;
  final int itemCount;

  const RatingBarWidget({
    super.key,
    this.rating = 0.0,
    this.itemSize = 18.0,
    this.itemCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4.0.w,
      children: List.generate(
        itemCount,
            (index) => _svgIcon(
          index < rating ? AssetsManager.star : AssetsManager.starEmpty,
          width: itemSize,
          height: itemSize,
        ),
      ),
    );
  }

  Widget _svgIcon(String path, {double? width, double? height}) {
    return SvgIconWidget(
      path: path,
      width: width ?? 18.0.sp,
      height: height ?? 18.0.sp,
    );
  }
}
