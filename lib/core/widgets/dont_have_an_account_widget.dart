import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
              text: 'Dont Have an acount?  ',
              style: TextStyles.font14SemiBoldGray
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap= (){
                // Navigator.pushNamed(context, SignupView.routeName);
              },
              text: 'SignUp',style: TextStyles.font14BoldOrange,),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
