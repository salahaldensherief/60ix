import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/set_password_cubit.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/create_new_password_button.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/create_new_password_form.dart';

import '../../../../../../art_core/widgets/custom_app_bar.dart';
import '../../../../../../core/di/service_locator.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.createNewAccount.tr(),
        subtitle: AppStrings.appBarCreateNewPasswordHint.tr(),
        showBack: true,
      ),

      ///TODO
      body: BlocProvider(
        create: (context) => SetPasswordCubit(sl()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TODO
            CreateNewPasswordForm(),

            ///TODO
            CreateNewAccountAction().padOnly(top: 24),
          ],
        ),
      ).padSymmetric(horizontal: 18.w),
    );
  }
}
