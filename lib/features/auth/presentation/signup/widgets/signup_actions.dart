import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';

import '../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../art_core/utils/app_colors.dart';
import '../../../../../art_core/utils/app_strings.dart';
import '../../../../../art_core/utils/font_styles.dart';
import '../../../../../art_core/widgets/buttons/custom_button.dart';
import '../../login/login_view.dart';
import '../../widgets/have_account_hint.dart';
import '../../widgets/social_login_buttons.dart';
import '../signup_verify_view.dart';

class SignupActions extends StatelessWidget {
  const SignupActions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return  Column(
      children: [
        CustomButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SignupVerify()),
            );
          },
          text: AppStrings.next.tr(),
          color: AppTextButtonStyles.primaryColor(context),
          colorSide: AppColors.primaryBtnColor,
          textStyle: TextStyles.font16SemiBold.copyWith(
            color: AppColors.whiteColor,
          ),
        ).padOnly(bottom: 12),
        CustomButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginView()),
            );
          },
          text: AppStrings.guestLogin.tr(),
          color: AppTextButtonStyles.secondaryColor(context),
          textStyle: theme.headlineLarge!,
        ),

        SocialLoginButtons().padOnly(bottom: 24),
        HaveAccountHint(
          title: AppStrings.alreadyHaveAccount.tr(),
          actionTitle: AppStrings.signIn.tr(),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginView()),
            );
          },
        ),
      ],
    );
  }
}
