import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/art_core/widgets/buttons/custom_button.dart';

import '../../../../../art_core/theme/text_theme_toggle.dart';
import '../../../../../core/router/router.dart';

class ForgetPasswordBtn extends StatelessWidget {
  const ForgetPasswordBtn({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomButton(
alignment: Alignment.centerRight,
      textStyle: TextThemeToggle.textTheme(context).titleSmall,
      text:AppStrings.forgotPassword.tr() ,
      onPressed: () {
        ///TODO

        Navigator.of(context).pushNamed(NavigatorKeys.forgetPasswordView);
      },
    );
  }
}
