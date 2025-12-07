part of "app_shimmer.dart";

class ShimmerWidgetsHelper {
  //? Build Shimmer Card
  static Widget shimmerCard({
    double? width,
    double? height,
    double? radius,
    Widget? child,
  }) {
    return _CustomShimmerCard(
      width: width,
      height: height,
      radius: radius,
      child: child,
    );
  }

  //? Build Shimmer Section Title
  static Widget shimmerSectionTitle({
    required String title,
    bool showAll = true,
    EdgeInsetsGeometry? padding,
  }) {
    return _CustomSectionTitle(
      title: title,
      showAll: showAll,
      padding: padding,
    );
  }

  //? build circle shimmer
  static Widget buildCircleShimmer({double size = 30}) {
    return _CustomShimmerCard(width: size, height: size, isCircle: true);
  }

  //? build shimmer Text
  static Widget buildShimmerText({
    double? width,
    double height = 16,
    double radius = 8,
  }) {
    return _CustomShimmerCard(width: width, height: height, radius: radius);
  }
}
