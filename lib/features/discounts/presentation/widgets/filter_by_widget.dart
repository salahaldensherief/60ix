import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/features/discounts/presentation/widgets/filter_section_name_widget.dart';

import '../../../../art_core/extensions/padding.dart';
import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/app_strings.dart';
import '../../../../art_core/utils/assets_data.dart';

class FilterByWidget extends StatelessWidget {
  const FilterByWidget({super.key});

  final List<String> categories = const [
    "Safari",
    "Horse",
    "Food",
    "Travel",
    "Offers",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionNameWidget(),

        SizedBox(height: 8.h),

        SizedBox(
          height: 110.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildAllItemsContainer();
              }
              final category = categories[index - 1];

              return _buildCategoryItem(category);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String category) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              AssetsData.horse2Image,
              width: 55.w,
              height: 55.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 6.h),
          Text(category.tr()),
        ],
      ),
    );
  }

  Widget _buildAllItemsContainer() {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Column(
        children: [
          Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                AssetsData.allIcon,
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Text("All"),
        ],
      ),
    );
  }
}
