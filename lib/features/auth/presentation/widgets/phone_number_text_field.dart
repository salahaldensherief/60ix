import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import '../../../../art_core/utils/font_styles.dart';
import '../../../../art_core/widgets/text_fields/custom_text_field.dart';
import 'intl_phone_widget.dart';

///TODO: name
class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
    required this.textFieldHint,
    this.controller,
    this.onCountryChanged,
    this.phoneNController,
  });
  final TextEditingController? controller;
  final TextEditingController? phoneNController;
  final void Function(Country)? onCountryChanged;

  final String textFieldHint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.phoneNumber.tr(),
          style: TextStyles.font14mediumRegular,
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: IntlPhoneWidget(
                controller: controller,
                onCountryChanged: onCountryChanged,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              flex: 5,
              child: CustomTextFormField(
                controller: phoneNController,
                text: textFieldHint,
                textInputType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.phoneRequired.tr();
                  }
                  if (value.length < 7) {
                    return AppStrings.phoneInvalid.tr();
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
