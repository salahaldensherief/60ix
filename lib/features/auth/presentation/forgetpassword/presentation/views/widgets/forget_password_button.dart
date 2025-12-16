import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../../../art_core/utils/app_colors.dart';
import '../../../../../../../art_core/utils/app_strings.dart';
import '../../../../../../../art_core/utils/font_styles.dart';
import '../../../../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../../../../core/router/router.dart';

class ForgetPasswordButton extends StatelessWidget
{
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        Navigator.of(context).pushNamed(NavigatorKeys.passwordRecovery
        );
      },
      text: AppStrings.next.tr(),
      color: AppTextButtonStyles.primaryColor(context),
      colorSide: AppColors.primaryBtnColor,
      textStyle: TextStyles.font16SemiBold.copyWith(
        color: AppColors.whiteColor,
      ),
    );
  }
}
