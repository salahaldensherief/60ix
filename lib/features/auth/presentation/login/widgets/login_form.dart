import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/extensions/padding.dart';
import '../../../../../art_core/utils/app_strings.dart';
import '../../widgets/password_text_field.dart';
import '../../widgets/phone_number_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhoneNumberTextField(textFieldHint: AppStrings.phoneNumberHint.tr()).padOnly(bottom: 10),
        PasswordTextField(hintText: AppStrings.password.tr()),


      ],
    );
  }
}
