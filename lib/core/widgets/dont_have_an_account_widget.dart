import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/signup/signup_view.dart';
import '../utils/app_colors.dart';
import '../utils/font_styles.dart';



class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Don’t have an Account?  ',
              style: TextStyles.font14lightRegular
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap= (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SignupView(),));
              },
              text: 'SIGN UP',style: TextStyles.font14BoldOrange.copyWith(
              fontFamily: 'mulish'
            ),),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
