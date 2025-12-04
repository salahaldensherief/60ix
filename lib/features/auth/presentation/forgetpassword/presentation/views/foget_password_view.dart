import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/core/utils/app_colors.dart';
import 'package:ix/core/utils/font_styles.dart';
import 'package:ix/core/widgets/custom_app_bar.dart';
import 'package:ix/core/widgets/custom_button.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/password_recovery.dart';
import 'package:ix/features/auth/presentation/widgets/phone_number_widget.dart';

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
              title: 'Forgot Password',
              subtitle: 'Please Verify your phone number',
            ),
            SizedBox(height: 10.h),
            PhoneNumberWidget(
              textFieldHint: 'Enter your phone number ...',

            ),
            SizedBox(height: 20.h),
            CustomButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PasswordRecovery(),));
              },
              text: 'Next',
              color: AppColors.primaryColor,
              colorSide: AppColors.primaryColor,
              textStyle: TextStyles.font14SemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
