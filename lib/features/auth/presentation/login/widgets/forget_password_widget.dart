import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/forget_password_view.dart';

import '../../../../../art_core/theme/text_theme_toggle.dart';
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
        child: Text(AppStrings.forgotPassword.tr(), style:TextThemeToggle.textTheme(context).titleSmall  ),
      ),
    );
  }
}
