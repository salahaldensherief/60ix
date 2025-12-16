import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'otp_pin_widget.dart';

class PasswordRecoveryForm extends StatelessWidget {
  const PasswordRecoveryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        OtpPinWidget(),
        SizedBox(height: 20.h),
      ],
    );
  }
}
