import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final slider.CarouselSliderController _carouselController =
      slider.CarouselSliderController();
  int _current = 0;

  final List<String> imgList = [
    'assets/images/onboarding1.png',
    'assets/images/onboarding1.png',
    'assets/images/onboarding1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          slider.CarouselSlider(

            items: imgList
                .map(
                  (item) => Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(item),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
                .toList(),
            carouselController: _carouselController,
            options: slider.CarouselOptions(
              height: 297,

              viewportFraction: .70,
              padEnds: true,
              enableInfiniteScroll: true,
              autoPlay: false,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          SizedBox(height: 10.h),
          AnimatedSmoothIndicator(

            textDirection:TextDirection.rtl ,
            activeIndex: _current,
            count: imgList.length,
            effect: CustomizableEffect(
              activeDotDecoration: DotDecoration(
                width: 40,
                height: 8,
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(24),
              ),
              dotDecoration: DotDecoration(
                width: 8,
                height: 8,
                color: AppColors.primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
