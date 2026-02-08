import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../../../art_core/utils/app_colors.dart';
import '../../../../../../../art_core/utils/app_strings.dart';
import '../../../../../../../art_core/utils/font_styles.dart';
import '../../../../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../../../../core/router/router.dart';
import '../../forget_password_cubit.dart';
import '../../forget_password_state.dart';

class ForgetPasswordAction extends StatelessWidget {
  const ForgetPasswordAction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Something went wrong'),
            ),
          );
        }
        if (state.status.isSuccess) {
          Navigator.of(context).pushNamed(NavigatorKeys.passwordRecovery);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ForgetPasswordCubit>();
        return CustomButton(
          onPressed: state.status.isLoading
              ? null
              : () {
                  if (cubit.forgetPasswordFormKey.currentState?.validate() ??
                      false) {
                    cubit.forgetPassword(
                      mobileNumber: cubit.mobileNumber.text,
                      mobileCode: cubit.mobileCode.text,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please fill all required fields".tr()),
                      ),
                    );
                  }
                },
          text: state.status.isLoading
              ? AppStrings.loading.tr()
              : AppStrings.next.tr(),
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
