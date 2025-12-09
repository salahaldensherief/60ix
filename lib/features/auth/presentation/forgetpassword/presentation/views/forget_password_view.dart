import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/password_recovery.dart';
import 'package:ix/features/auth/presentation/widgets/phone_number_widget.dart';

import '../../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../../art_core/utils/app_colors.dart';
import '../../../../../../art_core/utils/font_styles.dart';
import '../../../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../../../art_core/widgets/custom_app_bar.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              showBack: true,
              title: AppStrings.forgotPassword.tr(),
              subtitle: AppStrings.verifyYourPhone.tr(),
            ),
            SizedBox(height: 10.h),
            PhoneNumberWidget(
              textFieldHint: AppStrings.appBarForgetPasswordHint.tr(),

            ),
            SizedBox(height: 20.h),
            CustomButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PasswordRecovery(),));
              },
              text: AppStrings.next.tr(),
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
