import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'otp_pin_widget.dart';

class PasswordRecoveryForm extends StatelessWidget {
  const PasswordRecoveryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        OtpPinWidget().padOnly(bottom: 10),
      ],
    );
  }
}
