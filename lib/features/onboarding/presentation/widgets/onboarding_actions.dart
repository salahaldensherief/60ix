import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/core/router/router.dart';
import '../../../../art_core/theme/text_botton_theme.dart';
import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/app_strings.dart';
import '../../../../art_core/utils/font_styles.dart';
import '../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../auth/presentation/login/login_view.dart';
import '../../../auth/presentation/signup/signup_view_body.dart';
class OnboardingActions extends StatelessWidget {
  const OnboardingActions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      children: [
        CustomButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(NavigatorKeys.signUp
            );
          },
          textStyle: TextStyles.font16SemiBold.copyWith(
            color: AppColors.whiteColor,
          ),
          text: AppStrings.createNewAccount.tr(),
          color: AppTextButtonStyles.primaryColor(context),
        ).padOnly(bottom: 12),
        CustomButton(
          textStyle: theme.headlineLarge!,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(NavigatorKeys.signIn
            );
          },
          text: AppStrings.guestLogin.tr(),
          color: AppTextButtonStyles.secondaryColor(context),
        ).padOnly(bottom: 12),
      ],
    );
  }
}
