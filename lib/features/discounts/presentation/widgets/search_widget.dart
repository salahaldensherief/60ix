import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../art_core/extensions/padding.dart';
import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/assets_data.dart';
import '../../../../art_core/widgets/text_fields/custom_text_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                borderSide: BorderSide(color: AppColors.transparent),
                text: 'Search for discounts , vendors..',
                radius: BorderRadius.circular(40.r),
                prefixIcon: SvgPicture.asset(AssetsData.searchIcon).padAll(5),
              ).padSymmetric( vertical: 10,horizontal: 8),
            ),
            Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),

              child: SvgPicture.asset(AssetsData.searchSort).padAll(11),
            ),

          ],
        ).padSymmetric(horizontal: 10),
        SizedBox(height: 10.h,),
        Divider(
          color: AppColors.borderColor,
          height: 2,
          thickness: 2,
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
