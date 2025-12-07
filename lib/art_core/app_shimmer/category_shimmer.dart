part of 'app_shimmer.dart';

class CategoryShimmer {

  static Widget buildListHorizontal() {
    return SizedBox(
      height: 130.h,
      width: double.infinity,
      child: ListView.separated(
        itemCount: 6,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: REdgeInsets.symmetric(vertical: AppStyles.paddingSmall, horizontal: AppStyles.paddingLarge),
        separatorBuilder: (context, index) => SizedBox(width: 20.w),
        itemBuilder: (_, i) => const _CategoryCard(),
      ),
    );
  }


  static Widget buildGrid() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: (1.sw / 2 - 24.w) / 275.h,
      ),
      itemCount: 20,
      itemBuilder: (_, i) => _CategoryCard(),
    );
  }

}


class _CategoryCard extends StatelessWidget {
  const _CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShimmerWidgetsHelper.buildCircleShimmer(size: 88),
        SizedBox(height: 5.h),
        ShimmerWidgetsHelper.buildShimmerText(width: 50),
      ],
    );
  }
}
