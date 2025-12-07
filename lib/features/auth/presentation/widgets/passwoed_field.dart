import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/widgets/custom_text_field.dart';
import '../../../../core/utils/font_styles.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
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
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          text: 'Enter your password',
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
