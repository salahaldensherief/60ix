import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/text_field_theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/font_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.readOnly = false,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.textInputType,
    this.onSaved,
    this.text,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.onTap,
  });

  final String? hintText;
  final String? text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final TextEditingController? controller;
  final bool obscureText;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hintText != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(hintText!, style: TextStyles.font14mediumRegular),
          ),
        ],
        TextFormField(
          onTap: onTap,
          readOnly: readOnly,
          controller: controller,
          obscureText: obscureText,
          keyboardType: textInputType,
          onSaved: onSaved,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
          decoration: InputDecoration(

            hintText: text,
            hintStyle: TextStyles.font12Small.copyWith(
              color: AppTextFieldTheme.textFieldColor(context),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 12.w,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),

              borderSide: BorderSide(color: AppColors.textFieldLightBorderColor),
            ),
            focusColor: AppTextFieldTheme.textFieldColor(context),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),

              borderSide: BorderSide(
              width: isDark ? 0.1 : 1,
              color: isDark
              ? AppColors.textFieldDarkBorderColor.withOpacity(.5)
                  : AppColors.textFieldLightBorderColor,
              ),
            ),
            isDense: true,
            filled: true,
            fillColor: AppTextFieldTheme.textFieldColor(context),
            prefixIcon: prefixIcon,
            prefixIconColor: AppColors.textFieldLightBorderColor,
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),

              borderSide: BorderSide(
                  width: .8.w,
                  color: AppColors.primaryBtnColor),
            ),
          ),
        ),
      ],
    );
  }
}
