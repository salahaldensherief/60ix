import 'package:flutter/material.dart';

import '../../../../../core/utils/font_styles.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Forget Password',
          style: TextStyles.font14SemiBoldBlue
          ),
        ),

    );
  }
}
