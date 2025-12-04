import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../../core/utils/app_colors.dart';

class OtpPinWidget extends StatelessWidget {
  const OtpPinWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      keyboardType: TextInputType.number,
      cursorColor: AppColors.textColorPrimary,
      animationType: AnimationType.fade,
      textStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      pinTheme: PinTheme(

        disabledColor: AppColors.white20,
        borderRadius: BorderRadius.circular(8.r),
        shape: PinCodeFieldShape.box,
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: AppColors.whiteColor,
        inactiveFillColor: AppColors.white10,
        selectedFillColor: AppColors.white10,
        activeColor: AppColors.primaryColor,
        inactiveColor: AppColors.whiteColor,
        selectedColor: AppColors.primaryColor,
        borderWidth: .3,
         activeBorderWidth: 1,
        disabledBorderWidth: 1,
        inactiveBorderWidth: 1,
        selectedBorderWidth: 1
      ),
      enableActiveFill: true,
      onChanged: (_) {},
    );
  }
}
