import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ix/core/utils/font_styles.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('phone number', style: TextStyles.font14MediumGray),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: BoxBorder.all(color: AppColors.white20),
                  color: AppColors.white10,
                ),
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
            ),
            SizedBox(width: 20.w),
            Expanded(
              flex: 3,
              child: CustomTextFormField(
                hintText: '',
                textInputType: TextInputType.phone,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
