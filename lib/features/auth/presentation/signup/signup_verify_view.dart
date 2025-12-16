import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/features/auth/presentation/signup/create_password_view.dart';

import '../../../../art_core/theme/text_botton_theme.dart';
import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/app_strings.dart';
import '../../../../art_core/utils/font_styles.dart';
import '../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../art_core/widgets/custom_app_bar.dart';
import '../forgetpassword/presentation/views/widgets/otp_pin_widget.dart';
import '../forgetpassword/presentation/views/widgets/resend_code_hint.dart';
import '../forgetpassword/presentation/views/widgets/time_count_widget.dart';

class SignupVerify extends StatelessWidget {
  const SignupVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              // phoneNumber: '01002658542',
              showBack: true,
              title: AppStrings.verifyYourPhone.tr(),
              subtitle: AppStrings.otpAppBarHint.tr(),
            ),
            SizedBox(height: 4.h),
            OtpPinWidget(),
            SizedBox(height: 20.h),
            CustomButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreatePasswordView()),
                );
              },
              text: AppStrings.verify.tr(),
              color: AppTextButtonStyles.primaryColor(context),
              colorSide: AppColors.primaryBtnColor,
              textStyle: TextStyles.font16SemiBold.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 20.h),
            ///TODO: you can make it as one widget
           //[ TimeCountWidget(),
            // SizedBox(height: 10.h),
            // ResendCodeWidget()],
            TimeCountWidget(),
            SizedBox(height: 10.h),
            ResendCodeHint(),
          ],
        ),
      ),
    );
  }
}
