import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/font_styles.dart';

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Didn’t receive a code?  ',
            style: TextStyles.font14MediumGray,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () async {},
            text: 'Resend code',
            style: TextStyles.font14BoldOrange.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
