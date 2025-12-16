import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/extensions/padding.dart';

import '../../../../../../../art_core/utils/app_strings.dart';
import '../../../../widgets/password_text_field.dart';

class CreateNewPasswordForm extends StatelessWidget {
  const CreateNewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        PasswordTextField(hintText: AppStrings.newPassword.tr()),
        ///TODO
        PasswordTextField(hintText: AppStrings.confirmPassword.tr()).padSymmetric(vertical: 8),
      ],
    );
  }
}
