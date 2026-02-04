import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/features/auth/presentation/signup/verify_otp_cubit.dart';
import 'otp_pin_widget.dart';

class PasswordRecoveryForm extends StatelessWidget {
  const PasswordRecoveryForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyOtpCubit>();
    return Form(
      key: cubit.otpFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          OtpPinWidget(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter the OTP";
              }
              if (value.length < 4) {
                return "OTP must be 4 digits";
              }
              return null;
            },
            controller: cubit.otpCode,
          ).padOnly(bottom: 10),
        ],
      ),
    );
  }
}
