import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/forget_password_button.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/forget_password_form.dart';

import '../../../../../../art_core/widgets/custom_app_bar.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///TODO
          CustomAppBar(
            showBack: true,
            title: AppStrings.forgotPassword.tr(),
            subtitle: AppStrings.verifyYourPhone.tr(),
          ),
          ///TODO
          ForgetPasswordForm().padOnly(top: 10),
          ForgetPasswordButton().padOnly(top: 24),
        ],
      ).padSymmetric(vertical: 20, horizontal: 18),
    );
  }
}

