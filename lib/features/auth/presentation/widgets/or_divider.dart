import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/utils/app_strings.dart';

import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/font_styles.dart';
///TODO: name

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
          AppStrings.orContinueWith.tr(),
          style: TextStyles.font12Regular,
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
