import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:ix/features/auth/presentation/login/cubit/login_state.dart';
import '../../../../../art_core/utils/app_strings.dart';
import '../../widgets/password_text_field.dart';
import '../../widgets/phone_number_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.signInFormKey,
      child: Column(
        children: [
          PhoneNumberTextField(
            textFieldHint: AppStrings.phoneNumberHint.tr(),
          ).padOnly(bottom: 10),
          PasswordTextField(
            controller: cubit.signInPassword,
            hintText: AppStrings.password.tr(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.passwordRequired.tr();
              }
              if (value.length < 6) {
                return AppStrings.passwordTooShort.tr();
              }
              return null;
            },
          ),

        ],
      ),
    );
  }
}
