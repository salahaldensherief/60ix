import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../art_core/theme/text_field_theme.dart';
import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/font_styles.dart';
///TODO name

class IntlPhoneWidget extends StatelessWidget {
  const IntlPhoneWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: AppTextFieldTheme.textFieldColor(context),
        borderRadius: BorderRadius.circular(8.r),
        border: BoxBorder.all(
          width: isDark ? 0.1 : 1,
          color: isDark
              ? AppColors.textFieldDarkBorderColor
              : AppColors.textFieldLightBorderColor,
        ),
      ),
      // I have done everything in my power to find a solution to this problem.
      child: IntlPhoneField(
        flagsButtonPadding: EdgeInsets.only(left: 2),
        dropdownTextStyle: TextStyles.font12bold,
        dropdownIconPosition: IconPosition.trailing,
        dropdownIcon: Icon(
          size: 16.sp,
          Icons.arrow_drop_down,
          color: AppColors.textColorLightPrimary,
        ),
        readOnly: true,
        showCursor: false,
        showDropdownIcon: true,
        disableLengthCheck: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        initialCountryCode: 'EG',
        disableAutoFillHints: true,
        onChanged: (phone) {},
      ),
    );
  }
}
