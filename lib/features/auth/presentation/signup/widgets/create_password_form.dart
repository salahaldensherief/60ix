import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/core/router/router.dart';
import 'package:ix/features/auth/presentation/signup/register_state.dart';
import 'package:ix/features/auth/presentation/signup/widgets/terms_and_conditions.dart';
import '../../../../../art_core/utils/app_strings.dart';
import '../../widgets/password_text_field.dart';
import '../register_cubit.dart';

class CreatePasswordForm extends StatelessWidget {
  const CreatePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Error')),
          );
        } else if (state.status == RegisterStatus.success) {
          Navigator.pushNamed(context, NavigatorKeys.signupVerify);
        }
      }, builder: (BuildContext context, RegisterState state) {
        return Column(
          children: [
            PasswordTextField(
              controller: cubit.passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.passwordRequired.tr();
                }
                if (value.length < 6) {
                  return AppStrings.passwordTooShort.tr();
                }
                return null;
              },
              hintText: AppStrings.newPassword.tr(),
            ).padOnly(bottom: 12),
            PasswordTextField(
              controller: cubit.passwordConfirmationController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.passwordRequired.tr();
                }
                if (value != cubit.passwordController.text) {
                  return AppStrings.passwordsDoNotMatch.tr();
                }
                return null;
              },
              hintText: AppStrings.confirmPassword.tr(),
            ).padOnly(bottom: 12),
            TermsAndConditions(
              onChanged: (value) {},
            ).padOnly(bottom: 16),
          ],
        );
      },
    );
  }
}
