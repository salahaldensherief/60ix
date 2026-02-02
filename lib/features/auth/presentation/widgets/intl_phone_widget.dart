import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../art_core/theme/text_field_theme.dart';
import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/font_styles.dart';

class IntlPhoneWidget extends StatelessWidget {
  final void Function(Country)? onCountryChanged;
  final TextEditingController? controller;

  const IntlPhoneWidget({super.key, this.onCountryChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: AppTextFieldTheme.textFieldColor(context),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          width: isDark ? 0.1 : 1,
          color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
        ),
      ),
      child: IntlPhoneField(
        controller: controller,
        onCountryChanged: onCountryChanged,
        flagsButtonPadding: EdgeInsets.only(left: 2),
        dropdownTextStyle: TextStyles.font12bold,
        dropdownIconPosition: IconPosition.trailing,
        dropdownIcon: Icon(
          size: 16.sp,
          Icons.arrow_drop_down,
          color: AppColors.textColorLightPrimary,
        ),
        showDropdownIcon: true,
        readOnly: true,
        showCursor: false,
        disableLengthCheck: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        initialCountryCode: 'EG',
        disableAutoFillHints: true,
      ),
    );
  }
}
