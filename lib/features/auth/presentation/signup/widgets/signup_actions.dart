import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/widgets/buttons/custom_button.dart';
import 'package:ix/features/auth/presentation/signup/create_password_view.dart';
import 'package:ix/features/auth/presentation/signup/register_cubit.dart';
import '../../../../../art_core/utils/app_colors.dart';
import '../../../../../art_core/utils/app_strings.dart';
import '../../../../../art_core/theme/text_botton_theme.dart';
import '../../widgets/have_account_hint.dart';
import '../../widgets/social_login_buttons.dart';
import '../../../../../core/router/router.dart';
import '../register_state.dart';

class SignupActions extends StatelessWidget {
  const SignupActions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();

        return Column(
          children: [
            CustomButton(
              onPressed: state.status == RegisterStatus.loading
                  ? null
                  : () {
                cubit.saveStepOneData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: cubit,
                      child: const CreatePasswordView(),
                    ),
                  ),
                );
              },
              text: AppStrings.next.tr(),
              color: AppTextButtonStyles.primaryColor(context),
              colorSide: AppColors.primaryBtnColor,
              textStyle: const TextStyle(color: Colors.white),
            ).padOnly(bottom: 12),
            CustomButton(
              onPressed: () {},
              text: AppStrings.guestLogin.tr(),
              color: AppTextButtonStyles.secondaryColor(context),
              textStyle: theme.headlineLarge!,
            ).padOnly(bottom: 12),
            SocialLoginButtons().padOnly(bottom: 24),
            HaveAccountHint(

              title: AppStrings.alreadyHaveAccount.tr(),
              actionTitle: AppStrings.signIn.tr(),
              onTap: () {
                Navigator.of(context).pushNamed(NavigatorKeys.signIn);
              },
            ),
          ],
        );
      },
    );
  }
}
