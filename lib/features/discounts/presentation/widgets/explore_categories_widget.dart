import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/art_core/utils/app_colors.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/art_core/widgets/scroll/mini_scroll_widget.dart';
import 'package:ix/features/discounts/presentation/category_item_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../art_core/extensions/padding.dart';
import '../../../../art_core/utils/assets_data.dart';

class ExploreCategories extends StatefulWidget {
  ExploreCategories({super.key});

  @override
  State<ExploreCategories> createState() => _ExploreCategoriesState();
}

class _ExploreCategoriesState extends State<ExploreCategories> {
  int _current = 0;
  final double itemWidth = 8;
  late final ScrollController _scrollController;

  final List<String> imgList = List.generate(8, (_) => AssetsData.horse2Image);
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      int currentIndex = (_scrollController.offset / itemWidth).floor();
      if (currentIndex != _current) {
        setState(() {
          _current = currentIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: false,
            reverse: false,
            itemCount: imgList.length,
            controller: _scrollController,
            scrollDirection: Axis.horizontal,

            itemBuilder: (context, index) {
              return _buildExploreCategories(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryItemScreen()),
                );
              });
            },
          ),
        ),
        SizedBox(height: 8),
    MiniScrollbar(
      minThumbWidth: 12,
        controller: _scrollController)
      ],
    );
  }

  Column _buildExploreCategories(void Function()? onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                width: 64.w,
                height: 64.h,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(AssetsData.horse2Image),
              ).padSymmetric(horizontal: 4),
              Positioned(
                right: 5,
                bottom: 2,
                child: SvgPicture.asset(AssetsData.vectorImage, height: 45.h),
              ),
            ],
          ),
        ),
        Text(AppStrings.safari.tr()),
      ],
    );
  }
}
