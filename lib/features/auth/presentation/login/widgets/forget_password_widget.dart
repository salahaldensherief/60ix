import 'package:flutter/material.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/forget_password_view.dart';

import '../../../../../art_core/utils/app_colors.dart';
import '../../../../../art_core/utils/font_styles.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPasswordView(),));
        },
        child: Text('Forget Password?', style: TextStyles.font14mediumRegular.copyWith(
          color: AppColors.primaryColor
        )),
      ),
    );
  }
}
