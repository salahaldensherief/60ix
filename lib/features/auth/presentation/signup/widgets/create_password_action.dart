import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ix/art_core/widgets/buttons/custom_button.dart';
import 'package:ix/art_core/utils/app_colors.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/art_core/theme/text_botton_theme.dart';
import 'package:ix/features/auth/presentation/signup/signup_cubit.dart';

import '../../../../../art_core/extensions/padding.dart';

class CreatePasswordAction extends StatelessWidget {
  const CreatePasswordAction({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return CustomButton(
      onPressed: () {
        cubit.savePassword(
          cubit.passwordController.text,
          cubit.passwordConfirmationController.text,
        );
        cubit.register();
      },
      text: AppStrings.signUp.tr(),
      color: AppTextButtonStyles.primaryColor(context),
      colorSide: AppColors.primaryBtnColor,
      textStyle: const TextStyle(color: Colors.white),
    ).padOnly(top: 10);
  }
}
