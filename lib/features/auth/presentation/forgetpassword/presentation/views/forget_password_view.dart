import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar:  CustomAppBar(
        showBack: true,
        title: AppStrings.forgotPassword.tr(),
        subtitle: AppStrings.verifyYourPhone.tr(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///TODO

          ///TODO
          ForgetPasswordForm().padOnly(top: 10),
          ForgetPasswordButton().padOnly(top: 24),
        ],
      ).padSymmetric( horizontal: 18.w),
    );
  }
}

