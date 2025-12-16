import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/extensions/padding.dart';
import '../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../art_core/utils/app_colors.dart';
import '../../../../../art_core/utils/app_strings.dart';
import '../../../../../art_core/utils/font_styles.dart';
import '../../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../../core/router/router.dart';
import '../../widgets/have_account_hint.dart';
import '../../widgets/social_login_buttons.dart';
import 'forget_password_btn.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return  Column(
      children: [
        ForgetPasswordBtn().padOnly(top: 10),
        CustomButton(
          onPressed: () {},
          text: AppStrings.signIn.tr(),
          color: AppTextButtonStyles.primaryColor(context),
          colorSide: AppColors.primaryBtnColor,
          textStyle: TextStyles.font16SemiBold.copyWith(
            color: AppColors.whiteColor,
          ),
        ).padOnly(top: 10),
        CustomButton(
          onPressed: () {},
          text: AppStrings.guestLogin.tr(),
          color: AppTextButtonStyles.secondaryColor(context),
          textStyle: theme.headlineLarge!,
        ).padOnly(top: 20),
        SocialLoginButtons(),
        HaveAccountHint(
          title: AppStrings.dontHaveAccount.tr(),
          actionTitle: AppStrings.signUp.tr(),
          onTap: () {
            ///TODO
            Navigator.of(context).pushNamed(NavigatorKeys.signUp);
          },
        ).padSymmetric(vertical: 24),
      ],
    );
  }
}
