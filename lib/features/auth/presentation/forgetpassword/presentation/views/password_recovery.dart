import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/create_new_password_view.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/otp_pin_widget.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/resend_code_widget.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/time_count_widget.dart';

import '../../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../../art_core/utils/app_colors.dart';
import '../../../../../../art_core/utils/app_strings.dart';
import '../../../../../../art_core/utils/font_styles.dart';
import '../../../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../../../art_core/widgets/custom_app_bar.dart';
///PasswordRecovery what?
///TODO: always add the widget type or identifier to its name
///exp: PasswordRecovery(View) , UserInfo(Card) , requests(List),anyName(bottomSheet)
class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///TODO: you can add appBarWidget here
     // appBar:
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TODO
        CustomAppBar(
              // phoneNumber: '01002658542',
              showBack: true,
              title:AppStrings.passwordRecovery.tr(),
              subtitle: AppStrings.otpAppBarHint.tr(),
            ),
            ///TODO:
            SizedBox(height: 4.h),
            OtpPinWidget(),
            SizedBox(height: 20.h),
            CustomButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateNewPasswordView(),
                  ),
                );
              },
              text: AppStrings.verify.tr(),
              color:AppTextButtonStyles.primaryColor(context),
              colorSide: AppColors.primaryBtnColor,
              textStyle: TextStyles.font16SemiBold.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 20.h),
            TimeCountWidget(),
            SizedBox(height: 10.h),
            ResendCodeWidget(),
          ],
        ),
      ),
    );
  }
}
