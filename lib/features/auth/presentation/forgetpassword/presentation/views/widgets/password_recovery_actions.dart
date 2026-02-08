import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/core/router/router.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/resend_code_hint.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/time_count_widget.dart';
import 'package:ix/features/auth/presentation/signup/verify_otp_cubit.dart';
import 'package:ix/features/auth/presentation/signup/verify_otp_state.dart';

import '../../../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../../../art_core/utils/app_colors.dart';
import '../../../../../../../art_core/utils/app_strings.dart';
import '../../../../../../../art_core/utils/constants.dart';
import '../../../../../../../art_core/utils/font_styles.dart';
import '../../../../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../../../../core/local/shared_preferences_singleton.dart';

class PasswordRecoveryActions extends StatelessWidget {
  const PasswordRecoveryActions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyOtpCubit>();
    final mobile = Prefs.getString(ConstStrings.mobileNumber);
    final code = Prefs.getString(ConstStrings.mobileCode);

    return BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        if (state.status == VerifyOtpStatus.success) {
          Navigator.of(context).pushNamed(NavigatorKeys.createNewPasswordView);
        } else if (state.status == VerifyOtpStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? "Invalid OTP".tr()),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomButton(
              onPressed: state.status == VerifyOtpStatus.loading
                  ? null
                  : () {
                cubit.verifyOtp(
                  code: cubit.otpCode.text,
                  mobileNumber: mobile,
                  mobileCode: code,
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
      },
    );
  }
}
