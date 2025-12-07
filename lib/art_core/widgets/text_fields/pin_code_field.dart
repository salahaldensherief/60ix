import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../theme/themes.dart';

class PinCodeField extends StatelessWidget {
  final int length;
  final bool obscureText;
  final Color activeColor;
  final Color selectedColor;
  final Color inactiveColor;
  final double fieldHeight;
  final double fieldWidth;
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  final Function(String)? onChanged;

  const PinCodeField({
    super.key,
    required this.length,
    this.obscureText = false,
    this.activeColor = AppColors.primary,
    this.selectedColor = AppColors.primary,
    this.inactiveColor = AppColors.white,
    this.fieldHeight = 55,
    this.fieldWidth = 55,
    this.controller,
    this.onCompleted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        backgroundColor: AppColors.transparent,
        appContext: context,
        length: length,

        controller: controller,
        obscureText: obscureText,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: fieldHeight,
          fieldWidth: fieldWidth,
          activeFillColor: AppColors.transparent,
          selectedFillColor: AppColors.customColor(lightColor: AppColors.grey[50]! , darkColor: AppColors.cardBackground),
          inactiveFillColor: AppColors.customColor(lightColor: AppColors.grey[50]! , darkColor: AppColors.cardBackground),
          inactiveColor: inactiveColor,
          inActiveBoxShadow: const <BoxShadow>[],
          activeBoxShadow: const <BoxShadow>[],
          selectedColor: selectedColor,
          activeColor: activeColor,
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        useExternalAutoFillGroup: true,
        onCompleted: onCompleted,
        onChanged: onChanged,
      ),
    );
  }
}
