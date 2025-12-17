import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/features/auth/presentation/signup/widgets/resend_code_section.dart';

import '../../../../art_core/theme/text_botton_theme.dart';
import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/app_strings.dart';
import '../../../../art_core/utils/font_styles.dart';
import '../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../art_core/widgets/custom_app_bar.dart';
import '../../../../core/router/router.dart';
import '../forgetpassword/presentation/views/widgets/otp_pin_widget.dart';

class SignupVerify extends StatelessWidget {
  const SignupVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // phoneNumber: '01002658542',
        showBack: true,
        title: AppStrings.verifyYourPhone.tr(),
        subtitle: AppStrings.otpAppBarHint.tr(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.h),
          OtpPinWidget(),
          SizedBox(height: 20.h),
          CustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed(NavigatorKeys.createPasswordView);
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
          ResendCodeSection(),
        ],
      ).padSymmetric(horizontal: 18.w),
    );
  }
}
