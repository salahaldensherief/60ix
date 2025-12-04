import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ix/core/utils/app_colors.dart';

import '../../../../../../../core/utils/font_styles.dart';

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(

          children: [
            TextSpan(
              text: 'Don’t receive the code  ',
              style: TextStyles.font14mediumRegular.copyWith(
                color: AppColors.textColorSecondary
              ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () async {},
              text: 'Resend Code',
              style: TextStyles.font14BoldOrange.copyWith(
                fontFamily: 'mulish',


              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
