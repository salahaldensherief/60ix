import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../../art_core/utils/app_colors.dart';

class OtpPinWidget extends StatelessWidget {
  const OtpPinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return PinCodeTextField(
      appContext: context,
      length: 6,
      keyboardType: TextInputType.number,
      cursorColor: AppColors.textColorLightPrimary,
      animationType: AnimationType.fade,
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      pinTheme: PinTheme(
        disabledColor: AppColors.textFieldLightBorderColor,
        borderRadius: BorderRadius.circular(8.r),
        shape: PinCodeFieldShape.box,
        fieldHeight: 50,
        fieldWidth: 55,
        activeFillColor: isDark
            ? AppColors.textFieldDarkFillColor
            : AppColors.whiteColor,
        inactiveFillColor: isDark
            ? AppColors.textFieldDarkFillColor
            : AppColors.textFieldLightFillColor,
        selectedFillColor: isDark
            ? AppColors.textFieldDarkFillColor
            : AppColors.textFieldLightFillColor,
        activeColor: AppColors.primaryBtnColor,
        inactiveColor: isDark
        ///TODO: do not use deprecated extension '.withOpacity(.2)' , because it means it will be removed soon
            ? AppColors.textFieldDarkBorderColor.withOpacity(.2)
            : AppColors.textFieldLightBorderColor,
        selectedColor: AppColors.primaryBtnColor,
        borderWidth: .3,
        activeBorderWidth: .8,
        disabledBorderWidth: .8,
        inactiveBorderWidth: isDark ? .4 : .8,
        selectedBorderWidth: .8,
      ),

      enableActiveFill: true,
      onChanged: (_) {},
    );
  }
}
