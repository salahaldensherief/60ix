import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/features/auth/presentation/widgets/passwoed_field.dart';
import 'package:ix/features/auth/presentation/login/login_view.dart';

import '../../../../../../art_core/utils/app_colors.dart';
import '../../../../../../art_core/utils/font_styles.dart';
import '../../../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../../../art_core/widgets/custom_app_bar.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'Create New Password',
              subtitle:
                  'Create a strong, unique password to enhance the security of your account.',
              showBack: true,
            ),
            PasswordField(hintText: 'New Password'),
            SizedBox(height: 20.h),
            PasswordField(hintText: 'Confirm Password'),
            SizedBox(height: 20.h),

            CustomButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => LoginView()));
              },
              text: 'Continue',
              color: AppColors.primaryColor,
              colorSide: AppColors.primaryColor,
              textStyle: TextStyles.font16SemiBold.copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
