import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/extensions/padding.dart';

import '../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../art_core/utils/app_colors.dart';
import '../../../../../art_core/utils/app_strings.dart';
import '../../../../../art_core/utils/font_styles.dart';
import '../../../../../art_core/widgets/buttons/custom_button.dart';
import '../../login/login_view.dart';

class CreatePasswordAction extends StatelessWidget {
  const CreatePasswordAction({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => LoginView()));
      },
      text: AppStrings.continueText.tr(),
      color: AppTextButtonStyles.primaryColor(context),
      colorSide: AppColors.primaryBtnColor,
      textStyle: TextStyles.font16SemiBold.copyWith(color: AppColors.whiteColor),
    ).padOnly(top: 10);
  }
}
