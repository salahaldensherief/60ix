import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.textInputType,
    this.onSaved,
    this.controller,
    this.obscureText = false,
    this.validator,
  });

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: textInputType,
          onSaved: onSaved,
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.h,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),

              borderSide: BorderSide(color: AppColors.white20),
            ),
            focusColor: AppColors.white10,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),

              borderSide: BorderSide(color: AppColors.white20),
            ),
            isDense: true,
            filled: true,
            fillColor: AppColors.white10,
            hintText: hintText,
            hintStyle: TextStyle(),
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.black54,
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),

              borderSide: BorderSide(color: AppColors.white20),
            ),
          ),
        ),
      ],
    );
  }
}
