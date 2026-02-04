import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ix/art_core/utils/constants.dart';
import 'package:ix/core/router/router.dart';
import 'package:ix/core/shared_preferences_singleton.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/set_password_cubit.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/set_password_state.dart';

import '../../../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../../../art_core/utils/app_colors.dart';
import '../../../../../../../art_core/utils/app_strings.dart';
import '../../../../../../../art_core/utils/font_styles.dart';
import '../../../../../../../art_core/widgets/buttons/custom_button.dart';

class CreateNewAccountAction extends StatelessWidget {
  const CreateNewAccountAction({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetPasswordCubit>();

    return BlocConsumer<SetPasswordCubit, SetPasswordState>(
      listener: (context, state) {
        if (state.status == SetPasswordStatus.success) {
          Navigator.of(context).pushNamed(NavigatorKeys.signIn);
        } else if (state.status == SetPasswordStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? "Error".tr()),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final mobile = Prefs.getString(ConstStrings.mobileNumber);
        final code = Prefs.getString(ConstStrings.mobileCode);
        return CustomButton(
          onPressed: state.status == SetPasswordStatus.loading
              ? null
              : () {
                  cubit.createNewPassword(
                    mobileNumber: mobile,
                    mobileCode: code,
                    password: cubit.passwordController.text,
                    confirmedPassword: cubit.confirmedPasswordController.text,
                  );
                },
          text: state.status == SetPasswordStatus.loading
              ? AppStrings.loading.tr()
              : AppStrings.continueText.tr(),
          color: AppTextButtonStyles.primaryColor(context),
          colorSide: AppColors.primaryBtnColor,
          textStyle: TextStyles.font16SemiBold.copyWith(
            color: AppColors.whiteColor,
          ),
        );
      },
    );
  }
}
