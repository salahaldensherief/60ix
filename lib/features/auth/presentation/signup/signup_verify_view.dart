import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/utils/constants.dart';
import 'package:ix/core/flutter_secure_storage.dart';
import 'package:ix/core/shared_preferences_singleton.dart';
import 'package:ix/features/auth/presentation/signup/signup_cubit.dart';
import 'package:ix/features/auth/presentation/signup/verify_otp_cubit.dart';
import 'package:ix/features/auth/presentation/signup/verify_otp_state.dart';
import 'package:ix/features/auth/presentation/signup/widgets/resend_code_section.dart';

import '../../../../art_core/theme/text_botton_theme.dart';
import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/app_strings.dart';
import '../../../../art_core/utils/font_styles.dart';
import '../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../art_core/widgets/custom_app_bar.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/router/router.dart';
import '../forgetpassword/presentation/views/widgets/otp_pin_widget.dart';

class SignupVerify extends StatelessWidget {
  const SignupVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyOtpCubit(authRepo: sl()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<VerifyOtpCubit>();
          return Scaffold(
            appBar: CustomAppBar(
              showBack: true,
              title: AppStrings.verifyYourPhone.tr(),
              subtitle: AppStrings.otpAppBarHint.tr(),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.h),
                OtpPinWidget(controller: cubit.otpCode),

                SizedBox(height: 20.h),

                BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
                  listener: (context, state) {
                    if (state.status.isFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.errorMessage ?? 'Something went wrong',
                          ),
                        ),
                      );
                    }
                    if (state.status.isSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Otp verify success'),
                        ),
                      );
                      Navigator.pushNamed(context, NavigatorKeys.signIn);

                    }
                  },
                  builder: (context, state) {
                    final mobile = Prefs.getString(ConstStrings.mobileNumber);
                    final code = Prefs.getString(ConstStrings.mobileCode);
                    return CustomButton(
                      onPressed: () {
                        cubit.verifyOtp(
                          mobileNumber: mobile.toString(),
                          mobileCode: code.toString(),
                          code: cubit.otpCode.text,
                        );
                      },
                      text: AppStrings.verify.tr(),
                      color: AppTextButtonStyles.primaryColor(context),
                      colorSide: AppColors.primaryBtnColor,
                      textStyle: TextStyles.font16SemiBold.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    );
                  },
                ),

                SizedBox(height: 20.h),

                const ResendCodeSection(),
              ],
            ).padSymmetric(horizontal: 18.w),
          );
        },
      ),
    );
  }
}
