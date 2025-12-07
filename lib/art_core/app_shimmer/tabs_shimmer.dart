part of 'app_shimmer.dart';

class TabsShimmer {
  static Widget buildCategoriesTabs({int? count}) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: count ?? 5,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) => _CustomShimmerCard(height: 30.0, width: 100.0),
      ),
    );
  }
}
