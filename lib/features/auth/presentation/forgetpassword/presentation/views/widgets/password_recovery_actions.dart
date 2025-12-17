import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/core/router/router.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/resend_code_hint.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/time_count_widget.dart';

import '../../../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../../../art_core/utils/app_colors.dart';
import '../../../../../../../art_core/utils/app_strings.dart';
import '../../../../../../../art_core/utils/font_styles.dart';
import '../../../../../../../art_core/widgets/buttons/custom_button.dart';

class PasswordRecoveryActions extends StatelessWidget {
  const PasswordRecoveryActions({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomButton(
          onPressed: () {
            Navigator.of(context).pushNamed(NavigatorKeys.createNewPasswordView
            );
          },
          text: AppStrings.verify.tr(),
          color: AppTextButtonStyles.primaryColor(context),
          colorSide: AppColors.primaryBtnColor,
          textStyle: TextStyles.font16SemiBold.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(height: 20.h),
        TimeCountWidget(),
        SizedBox(height: 10.h),
        ResendCodeHint(),
      ],
    );
  }
}
