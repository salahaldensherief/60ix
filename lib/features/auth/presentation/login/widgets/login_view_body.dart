import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/features/auth/presentation/widgets/have_account_hint.dart';
import 'package:ix/features/auth/presentation/widgets/or_divider.dart';
import 'package:ix/features/auth/presentation/widgets/passwoed_field.dart';
import 'package:ix/features/auth/presentation/signup/signup_view.dart';

import '../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../art_core/utils/app_colors.dart';
import '../../../../../art_core/utils/app_strings.dart';
import '../../../../../art_core/utils/font_styles.dart';
import '../../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../../art_core/widgets/custom_app_bar.dart';
import '../../widgets/phone_number_widget.dart';
import '../../widgets/social_login_botton.dart';
import 'forget_password_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CustomAppBar(
                subtitle: AppStrings.loginToContinueAccount.tr(),
                title: AppStrings.letsSignIn.tr(),
              ),
              PhoneNumberWidget(textFieldHint: AppStrings.phoneNumberHint.tr()),
              SizedBox(height: 12.h),
              PasswordField(hintText: AppStrings.password.tr()),
              SizedBox(height: 12.h),
              ForgetPasswordWidget(),
              SizedBox(height: 10.h),
              CustomButton(
                onPressed: () {},
                text: AppStrings.signIn.tr(),
                color:AppTextButtonStyles.primaryColor(context),
                colorSide: AppColors.primaryBtnColor,
                textStyle: TextStyles.font16SemiBold.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              SizedBox(height: 16.h),
              CustomButton(
                onPressed: () {},
                text: AppStrings.guestLogin.tr(),
                color: AppTextButtonStyles.secondaryColor(context),
                textStyle: theme.headlineLarge!,
              ),
              SizedBox(height: 32.h),
              OrDivider(),
              SizedBox(height: 32.h),
              SocialLoginBotton(),
              SizedBox(height: 32.h),
              HaveAccountHint(
                title: AppStrings.dontHaveAccount.tr(),
                actionTitle: AppStrings.signUp.tr(),
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => SignupView()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
