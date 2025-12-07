import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/resources/app_styles.dart';

import '../../theme/themes.dart';
import '../images/images.dart';

part 'banner_slider.dart';
part 'custom_slider.dart';
part 'gallery_slider.dart';

class EXSliders extends StatelessWidget {
  const EXSliders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        MediaSliderWidget(
          imageUrls: [
            "https://thumbs.dreamstime.com/b/mega-sale-special-offer-banner-golden-sign-board-promotion-vector-mega-sale-special-offer-banner-golden-sign-board-promotion-356023077.jpg",
            "https://thumbs.dreamstime.com/b/mega-sale-special-offer-banner-golden-sign-board-promotion-vector-mega-sale-special-offer-banner-golden-sign-board-promotion-356023077.jpg",
            "https://thumbs.dreamstime.com/b/mega-sale-special-offer-banner-golden-sign-board-promotion-vector-mega-sale-special-offer-banner-golden-sign-board-promotion-356023077.jpg",
          ],
        ),
      ],
    );
  }
}
