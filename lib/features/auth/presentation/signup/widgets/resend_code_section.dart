import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../forgetpassword/presentation/views/widgets/resend_code_hint.dart';
import '../../forgetpassword/presentation/views/widgets/time_count_widget.dart';

class ResendCodeSection extends StatelessWidget {
  const ResendCodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TimeCountWidget(),
        SizedBox(height: 10.h),
        ResendCodeHint(),
      ],
    );
  }
}
