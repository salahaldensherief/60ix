import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/utils/app_strings.dart';

import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/widgets/text_fields/custom_text_field.dart';
///TODO: try PasswordTextField

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.onSaved,
     this.hintText,
    this.controller,
    this.validator,
  });

  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          text: AppStrings.passwordHint.tr(),
          controller: widget.controller,
          obscureText: obscureText,
          onSaved: widget.onSaved,
          hintText: widget.hintText?? '',
          validator:
          widget.validator ??
                  (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
          textInputType: TextInputType.visiblePassword,
          suffixIcon: IconButton(
            splashColor:  AppColors.transparent,
            icon: Icon(
              size: 20.sp,
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },

          ),
        ),
      ],
    );
  }
}
