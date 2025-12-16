import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/utils/app_strings.dart';

import '../../../../../../../art_core/utils/app_colors.dart';
import '../../../../../../../art_core/utils/font_styles.dart';

///TODO: try name it ResendCodeHint
class ResendCodeHint extends StatelessWidget {
  const ResendCodeHint({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              ///TODO:
              text: "${AppStrings.dontReceiveCode.tr()} ",
              style: TextStyles.font14lightRegular.copyWith(
                color: AppColors.textColorLightSecondary,
              ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () async {},
              text: AppStrings.resendCode.tr(),
              style: TextStyles.font14BoldOrange.copyWith(fontFamily: 'mulish'),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
