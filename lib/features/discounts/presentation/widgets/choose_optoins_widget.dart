import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/utils/assets_data.dart';
import 'package:ix/features/discounts/presentation/widgets/sections_header_widget.dart';

import '../../../../art_core/utils/app_colors.dart';
import '../get_discount_service_screen.dart';
import 'option_card_widget.dart';

class OptionsWidget extends StatefulWidget {

  const OptionsWidget({super.key,});

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  int selectedWeight = 0;
  int selectedType = 0;
  int selectedColor = 0;

  final List<Map<String, dynamic>> weights = [
    {"title": "5 kg", "price": 100},
    {"title": "10 kg", "price": 150},
    {"title": "15 kg", "price": 200},
  ];

  final List<Map<String, dynamic>> types = [
    {"title": "Lather Bag", "price": 10},
    {"title": "Plastic Bag", "price": 10},
    {"title": "Wood Box", "price": 20},
  ];

  final List<Map<String, dynamic>> colors = [
    {"title": "White", "price": 10, "color": Colors.white},
    {"title": "Red", "price": 10, "color": Colors.red},
    {"title": "Black", "price": 15, "color": Colors.black},
    {"title": "Blue", "price": 12, "color": Colors.blue},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          icon: AssetsData.arrowIcon,
          name1: 'Choose ',
          name2: 'Package Type',
          badge: Badge.required,
        ),
        SizedBox(height: 10.h),

        Row(
          children: List.generate(weights.length, (index) {
            final item = weights[index];
            final isSelected = selectedWeight == index;

            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedWeight = index),
                child: OptionCard(
                  isSelected: isSelected,
                  isLast: index == weights.length - 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        item["title"],
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? AppColors.primaryColor
                              : Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "${item["price"]}.00 SAR",
                        style: TextStyle(
                          fontSize: 11.sp,
                          color:  isSelected
                              ? AppColors.primaryColor
                              : Colors.black87,
                          fontWeight: FontWeight.w700,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),

        SizedBox(height: 18.h),


        SectionHeader(
          icon: AssetsData.arrowIcon,

          name1: 'Choose ',
          name2: 'Package type',
          badge: Badge.required,
        ),
        SizedBox(height: 10.h),

        Row(
          children: List.generate(types.length, (index) {
            final item = types[index];
            final isSelected = selectedType == index;

            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedType = index),
                child: OptionCard(
                  isSelected: isSelected,
                  isLast: index == types.length - 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item["title"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? AppColors.primaryColor
                              : Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "+${item["price"]}.00 SAR",
                        style: TextStyle(
                          fontSize: 11.sp,
                          color:   isSelected
                              ? AppColors.primaryColor
                              : Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),

        SizedBox(height: 18.h),

        SectionHeader(
          icon: AssetsData.arrowIcon,

          name1: 'Choose ',
          name2: 'Color',
          badge: Badge.required,
        ),
        SizedBox(height: 10.h),

        Row(
          children: List.generate(colors.length, (index) {
            final item = colors[index];
            final isSelected = selectedColor == index;
            final itemColor = item["color"] as Color;

            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedColor = index),
                child: OptionCard(
                  isSelected: isSelected,
                  isLast: index == colors.length - 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 15.w,
                            height: 15.w,
                            decoration: BoxDecoration(
                              color: itemColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            item["title"],
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "+${item["price"]}.00 SAR",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color:  isSelected
                              ? AppColors.primaryColor
                              : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
