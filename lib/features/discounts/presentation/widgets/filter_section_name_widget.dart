import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/app_strings.dart';

class FilterSectionNameWidget extends StatelessWidget {
  const FilterSectionNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.filterByCategory.tr(),
          style: theme.headlineLarge?.copyWith(fontSize: 14.sp),
        ),
        SizedBox(height: 5.h),
        Container(
          width: 30,
          height: 3.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}


