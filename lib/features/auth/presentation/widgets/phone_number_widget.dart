import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ix/core/utils/font_styles.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/intl_phone_widget.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: IntlPhoneWidget(),
            ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 3,
              child: CustomTextFormField(
                textInputType: TextInputType.phone,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

