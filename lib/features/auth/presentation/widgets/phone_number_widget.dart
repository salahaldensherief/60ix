import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ix/core/utils/font_styles.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'intl_phone_widget.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({super.key, required this.textFieldHint});
  final String textFieldHint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone Number', style: TextStyles.font14mediumRegular),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 2,
                 child: IntlPhoneWidget()),
            SizedBox(width: 16.w),
            Expanded(
              flex: 5,
              child: CustomTextFormField(
                text: textFieldHint,
                textInputType: TextInputType.phone,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
