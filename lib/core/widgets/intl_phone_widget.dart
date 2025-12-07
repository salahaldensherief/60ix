import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../utils/app_colors.dart';
import '../utils/font_styles.dart';

class IntlPhoneWidget extends StatelessWidget {
  const IntlPhoneWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColors.white10,
        borderRadius: BorderRadius.circular(8.r),
        border: BoxBorder.all(color: AppColors.white20),
      ),
      // I have done everything in my power to find a solution to this problem.
      child: IntlPhoneField(

        dropdownTextStyle: TextStyles.font12bold,
        dropdownIconPosition: IconPosition.trailing,
        dropdownIcon: Icon(
          size: 16.sp,
          Icons.arrow_drop_down,
          color: AppColors.textColorPrimary,
        ),
        readOnly: true,
        showCursor: false,
        showDropdownIcon: true,
        disableLengthCheck: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(

            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        initialCountryCode: 'EG',
        disableAutoFillHints: true,
        onChanged: (phone) {},
      ),
    );
  }
}
