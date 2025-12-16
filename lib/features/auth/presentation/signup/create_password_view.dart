import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/features/auth/presentation/signup/signup_verify_view.dart';
import 'package:ix/features/auth/presentation/signup/widgets/terms_and_conditions.dart';

import '../../../../art_core/theme/text_botton_theme.dart';
import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/app_strings.dart';
import '../../../../art_core/utils/font_styles.dart';
import '../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../art_core/widgets/custom_app_bar.dart';
import '../login/login_view.dart';
import '../widgets/passwoed_field.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: AppStrings.createPassword.tr(),
              subtitle:
              AppStrings.createPasswordSubTitle.tr(),
              showBack: true,
            ),
            PasswordField(hintText: AppStrings.newPassword.tr()),
            SizedBox(height: 20.h),
            PasswordField(hintText: AppStrings.confirmPassword.tr()),
            SizedBox(height: 20.h),
            TermsAndConditions(onChanged: (value) => null,),
            SizedBox(height: 20.h),
            ///TODO

            CustomButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => LoginView()));
              },
              text: AppStrings.continueText.tr(),
              color: AppTextButtonStyles.primaryColor(context),
              colorSide: AppColors.primaryBtnColor,
              textStyle: TextStyles.font16SemiBold.copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
