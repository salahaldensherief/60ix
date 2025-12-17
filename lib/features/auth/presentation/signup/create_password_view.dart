import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/features/auth/presentation/signup/widgets/create_password_action.dart';
import 'package:ix/features/auth/presentation/signup/widgets/create_password_form.dart';
import '../../../../art_core/utils/app_strings.dart';
import '../../../../art_core/widgets/custom_app_bar.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  CustomAppBar(
        title: AppStrings.createPassword.tr(),
        subtitle:
        AppStrings.createPasswordSubTitle.tr(),
        showBack: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CreatePasswordForm(),
          ///TODO
          CreatePasswordAction(),
        ],
      ).padSymmetric( horizontal: 18.w),
    );
  }
}

