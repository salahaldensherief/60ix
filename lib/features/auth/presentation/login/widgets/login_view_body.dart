import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/core/utils/app_colors.dart';
import 'package:ix/core/utils/assets_data.dart';
import 'package:ix/core/widgets/custom_app_bar.dart';
import 'package:ix/core/widgets/custom_button.dart';
import 'package:ix/core/widgets/custom_text_field.dart';
import 'package:ix/features/auth/presentation/widgets/have_account_hint.dart';
import 'package:ix/features/auth/presentation/widgets/or_divider.dart';
import 'package:ix/features/auth/presentation/widgets/passwoed_field.dart';
import 'package:ix/features/auth/presentation/signup/signup_view.dart';

import '../../../../../../core/utils/font_styles.dart';
import '../../widgets/phone_number_widget.dart';
import '../../widgets/social_login_botton.dart';
import 'forget_password_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                subtitle: 'Login to Continue your account',
                title: 'Let’s Sign In.!',
              ),
              PhoneNumberWidget(
                textFieldHint: 'Enter your phone number ...',

              ),
              SizedBox(height: 12.h),
              PasswordField(hintText: 'Password'),
              SizedBox(height: 12.h),
              ForgetPasswordWidget(),
              SizedBox(height: 10.h),

              CustomButton(
                onPressed: () {},
                text: 'Sign In',
                color: AppColors.primaryColor,
                colorSide: AppColors.primaryColor,
                textStyle: TextStyles.font16SemiBold.copyWith(color: AppColors.whiteColor),
              ),
              SizedBox(height: 16.h),

              CustomButton(
                onPressed: () {},
                text: 'Guest Login',
                color: AppColors.lightOrangeColor,
                colorSide: AppColors.lightOrangeColor,
                textStyle: TextStyles.font16SemiBold,
              ),
              SizedBox(height: 32.h),
              OrDivider(),
              SizedBox(height: 32.h),
              SocialLoginBotton(),
              SizedBox(height: 32.h),
HaveAccountHint(title: 'Don’t have an Account?', actionTitle: 'SIGN UP', onTap: () {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupView(),));
              },),
            ],
          ),
        ),
      ),
    );
  }
}
