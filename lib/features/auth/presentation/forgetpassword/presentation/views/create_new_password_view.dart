import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/features/auth/presentation/widgets/passwoed_field.dart';
import 'package:ix/features/auth/presentation/login/login_view.dart';

import '../../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../../art_core/utils/app_colors.dart';
import '../../../../../../art_core/utils/font_styles.dart';
import '../../../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../../../art_core/widgets/custom_app_bar.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///TODO
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TODO

            CustomAppBar(
              title: AppStrings.createNewAccount.tr(),
              subtitle:
                  AppStrings.appBarCreateNewPasswordHint.tr(),
              showBack: true,
            ),
            PasswordField(hintText: AppStrings.newPassword.tr()),
            ///TODO

            SizedBox(height: 20.h),
            PasswordField(hintText: AppStrings.confirmPassword.tr()),
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
