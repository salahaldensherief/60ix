import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/core/widgets/custom_button.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/create_new_password_view.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/otp_pin_widget.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/resend_code_widget.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/time_count_widget.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/font_styles.dart';
import '../../../../../../core/widgets/custom_app_bar.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20).w,
        child: Column(
          children: [
            const CustomAppBar(
              showBack: true,
              title: 'Password Recovery',
              subtitle: 'Please enter your email to recover your password',
            ),
            SizedBox(height: 20.h),
            OtpPinWidget(),
            SizedBox(height: 20.h),
            CustomButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewPasswordView(),));
            }, text: 'Verify', color: AppColors.primaryColor, colorSide: AppColors.primaryColor,  textStyle: TextStyles.font14SemiBold),
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


