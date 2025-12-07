part of 'sliders.dart';

class MediaSliderWidget extends StatefulWidget {
  final List<String> imageUrls;
  final Function(String)? onTap;

  const MediaSliderWidget({super.key, this.imageUrls = const [], this.onTap});

  @override
  _MediaSliderWidgetState createState() => _MediaSliderWidgetState();
}

class _MediaSliderWidgetState extends State<MediaSliderWidget>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 180.0.h,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 180.0.h,
              enlargeCenterPage: true,
              autoPlay: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 15),
              autoPlayAnimationDuration: const Duration(seconds: 4),
              autoPlayCurve: Curves.easeInOutQuart,
              enableInfiniteScroll: widget.imageUrls.length > 1,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() => _currentIndex = index);
              },
            ),
            items:
                widget.imageUrls
                    .map(
                      (url) => _bannerItem(
                        imageUrl: url,
                        onTap:
                            widget.onTap != null
                                ? () => widget.onTap!(url)
                                : null,
                      ),
                    )
                    .toList(),
          ),
          Positioned(
            bottom: 12.0.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.imageUrls.length, (index) {
                bool isActive = _currentIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() => _currentIndex = index);
                  },
                  child: Container(
                    margin: REdgeInsets.symmetric(horizontal: 7),
                    width: isActive ? 18 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color:
                          isActive
                              ? AppColors.yellow
                              : AppColors.primary.shade600,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bannerItem({required String imageUrl, GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(22.r)),
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: AppStyles.paddingLarge),
          child: AppImage(
            urlImg: imageUrl,
            width: double.infinity,
            fit: BoxFit.fill,
            borderRadius: 36,
          ),
        ),
      ),
    );
  }
}
