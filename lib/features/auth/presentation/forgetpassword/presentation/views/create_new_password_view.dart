import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/create_new_password_button.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/create_new_password_form.dart';

import '../../../../../../art_core/widgets/custom_app_bar.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: AppStrings.createNewAccount.tr(),
        subtitle: AppStrings.appBarCreateNewPasswordHint.tr(),
        showBack: true,
      ),
      ///TODO
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///TODO


      CreateNewPasswordForm(),
          ///TODO
          CreateNewAccountButton().padOnly(top: 24),
        ],
      ).padSymmetric( horizontal: 18.w),
    );
  }
}

