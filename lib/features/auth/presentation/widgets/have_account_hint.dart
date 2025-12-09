import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/utils/app_colors.dart';

import '../../../../art_core/utils/font_styles.dart';
import '../login/login_view.dart';

class HaveAccountHint extends StatelessWidget {
  const HaveAccountHint({super.key, required this.title, required this.actionTitle, this.onTap});
final String title;
final String actionTitle;
final  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$title ',
              style: TextStyles.font14lightRegular.copyWith(
                color:  AppColors.textColorLightSecondary
              ),

            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = onTap,
              text: actionTitle,
              style: TextStyles.font14BoldOrange.copyWith(fontFamily: 'mulish'),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
