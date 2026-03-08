import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/assets_data.dart';
import '../../../../art_core/widgets/buttons/custom_button.dart';

class ApplyAndResetFilters extends StatelessWidget {
  const ApplyAndResetFilters({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SizedBox(width: 290.w,
            child: CustomButton(
              onPressed: (){},
              color: AppColors.primaryColor,
              radius:  BorderRadius.circular(24.r),
              text: 'Apply Filters',
              textStyle: theme.headlineLarge?.copyWith(
                  color: AppColors.whiteColor
              ),
            ),
          ),
          SizedBox(width: 10,),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.3),

              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset(AssetsData.reloadIcon,),
            ),
          )
        ],
      ),
    );
  }
}
