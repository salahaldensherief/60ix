import 'package:flutter/material.dart';
import 'package:ix/core/utils/app_colors.dart';

import '../utils/font_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(
          color: AppColors.gray300Color.withOpacity(0.5),
          height: 1,
        )),
        SizedBox(width: 18),
        Text(
          textAlign: TextAlign.center,
          'Or Continue With',
          style: TextStyles.font14MediumGray,
        ),
        SizedBox(width: 18),

        Expanded(child: Divider(
          color: AppColors.gray300Color.withOpacity(0.5),
          height: 1,

        )),
      ],
    );
  }
}
