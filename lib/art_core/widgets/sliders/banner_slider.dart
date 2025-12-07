part of 'sliders.dart';

class BannerSlider extends StatefulWidget {
  final List<String> imageUrls;
  final Duration? autoPlayInterval;
  final Duration? autoPlayAnimationDuration;
  final double? viewportFraction;

  const BannerSlider({
    super.key,
    this.imageUrls = const [],
    this.autoPlayInterval,
    this.autoPlayAnimationDuration,
    this.viewportFraction,
  });

  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 280.0.h,
            enlargeCenterPage: true,
            autoPlay: true,
            viewportFraction: widget.viewportFraction ?? 1,
            autoPlayInterval:
                widget.autoPlayInterval ?? const Duration(seconds: 15),
            autoPlayAnimationDuration:
                widget.autoPlayAnimationDuration ?? const Duration(seconds: 4),
            autoPlayCurve: Curves.easeInOutQuart,
            enableInfiniteScroll: widget.imageUrls.length > 1,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.imageUrls.map((url) => _bannerItem(url)).toList(),
        ),
        const SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.imageUrls.length, (index) {
            bool isActive = _currentIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                width: isActive ? 34 : 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color:
                      isActive
                          ? AppColors.primary.shade400
                          : AppColors.primary.shade100,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _bannerItem(String imageUrl) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(36)),
      child: Padding(
        padding: REdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: AppStyles.paddingLarge,
        ),
        child: AppImage(
          urlImg: imageUrl,
          width: double.infinity,
          // height: 200.0.h,
          fit: BoxFit.cover,
          borderRadius: 36,
        ),
      ),
    );
  }
}
