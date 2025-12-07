part of 'sliders.dart';

class GallerySlider extends StatefulWidget {
  final List<String> imageUrls;
  final Duration? autoPlayInterval;
  final Duration? autoPlayAnimationDuration;
  final double? viewportFraction;
  final String? emptyImage;

  const GallerySlider({
    super.key,
    this.imageUrls = const [],
    this.autoPlayInterval,
    this.emptyImage,
    this.autoPlayAnimationDuration,
    this.viewportFraction,
  });

  @override
  _GallerySliderState createState() => _GallerySliderState();
}

class _GallerySliderState extends State<GallerySlider>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(36)),
        child: Padding(
          padding: REdgeInsetsDirectional.all(AppStyles.paddingLarge),
          child: AppImage(
            urlImg: widget.emptyImage ?? "",
            width: double.infinity,
            fit: BoxFit.cover,
            borderRadius: 14,
            height: 270.0.h,
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 270.0.h,
            autoPlay: false,
            enlargeCenterPage: false,
            enableInfiniteScroll: false,
            viewportFraction: widget.imageUrls.length ==1 ? 1 : 0.75,
            disableCenter: true,
            padEnds: false,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            autoPlayInterval: widget.autoPlayInterval ?? const Duration(seconds: 15),
            autoPlayAnimationDuration: widget.autoPlayAnimationDuration ?? const Duration(seconds: 4),
            autoPlayCurve: Curves.easeInOutQuart,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, _) {
              setState(() => _currentIndex = index);
            },
          ),
          items: widget.imageUrls.map((url) => _bannerItem(url)).toList(),
        ),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.imageUrls.length, (index) {
            bool isActive = _currentIndex == index;
            return Container(
              margin: REdgeInsets.symmetric(horizontal: 5),
              width: isActive ? 41.w : 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: isActive ? AppColors.primary : AppColors.primary.shade50,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _bannerItem(String imageUrl) {
    bool isFirstItem = widget.imageUrls.indexOf(imageUrl) == 0;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(36)),
      child: Padding(
        padding: REdgeInsetsDirectional.only(
          end: AppStyles.paddingLarge,
          start: isFirstItem ? AppStyles.paddingLarge : 0.0,
        ),
        child: AppImage(
          urlImg: imageUrl,
          width: double.infinity,
          height: 270.0.h,
          fit: BoxFit.fill,
          borderRadius: 14,
        ),
      ),
    );
  }
}
