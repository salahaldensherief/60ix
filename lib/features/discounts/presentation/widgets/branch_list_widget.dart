import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/art_core/utils/app_colors.dart';
import 'package:ix/features/discounts/presentation/widgets/categories_headline.dart';

import '../../../../art_core/utils/assets_data.dart';
import '../../domain/branch_model.dart';
import 'branch_tile_widget.dart';

class BranchListWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onBranchSelected;

  const BranchListWidget({
    super.key,
    required this.selectedIndex,
    required this.onBranchSelected,
  });

  final List<BranchModel> branches = const [
    BranchModel(
      name: 'Primavet Medical Center',
      address: 'Cairo - 2km',
      price: 50.00,
      isRecommended: true,
      phone: '+20 100 000 0001',
    ),
    BranchModel(
      name: 'Primavet Medical Center',
      address: 'Cairo - 5km',
      price: 60.00,
      phone: '+20 100 000 0002',
    ),
    BranchModel(
      name: 'Primavet Medical Center',
      address: 'Cairo - 8km',
      price: 45.00,
      phone: '+20 100 000 0003',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoriesHeadline(
          name1: 'Choose The ',
          icon: AssetsData.mapColorsIcon,
          name2: 'Branch :',
        ),

        SizedBox(height: 8.h),

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: branches.length,
          separatorBuilder: (context, index) => SizedBox(height: 8.h),
          itemBuilder: (context, index) {
            final branch = branches[index];

            return BranchTileWidget(
              branch: branch,
              isSelected: index == selectedIndex,
              onTap: () => onBranchSelected(index),
            );
          },
        ),
      ],
    );
  }
}
