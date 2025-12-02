import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../utils/app_colors.dart';

class IntlPhoneWidget extends StatelessWidget {
  const IntlPhoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: BoxBorder.all(color: AppColors.white20),
        color: AppColors.white10,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: IntlPhoneField(
          readOnly: true,

          showCursor: false,
          cursorColor: AppColors.primaryColor,
          showDropdownIcon: false,
          disableLengthCheck: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.transparent),
            ),
          ),
          initialCountryCode: 'EG',
          onChanged: (phone) {
            print(phone.completeNumber);
          },
        ),
      ),
    );
  }
}
