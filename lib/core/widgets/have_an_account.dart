import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/login/views/login_view.dart';
import '../utils/app_colors.dart';
import '../utils/font_styles.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Already Have Account?  ',
              style: TextStyles.font14lightRegular,
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
              text: 'SIGN IN',
              style: TextStyles.font14BoldOrange.copyWith(fontFamily: 'mulish'),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
