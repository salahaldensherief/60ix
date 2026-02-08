import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/set_password_cubit.dart';
import '../../../../../../../art_core/utils/app_strings.dart';
import '../../../../widgets/password_text_field.dart';

class CreateNewPasswordForm extends StatelessWidget {
  const CreateNewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetPasswordCubit>();
    return Form(
      key: cubit.setPasswordFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          PasswordTextField(
            controller: cubit.passwordController,

            hintText: AppStrings.newPassword.tr(),
          ),

          ///TODO
          PasswordTextField(
            controller: cubit.confirmedPasswordController,

            hintText: AppStrings.confirmPassword.tr(),
          ).padSymmetric(vertical: 8),
        ],
      ),
    );
  }
}
