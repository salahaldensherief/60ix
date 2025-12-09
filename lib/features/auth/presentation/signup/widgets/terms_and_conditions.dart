// Flutter imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/utils/app_strings.dart';

// Project imports:

import '../../../../../art_core/utils/app_colors.dart';
import '../../../../../art_core/utils/font_styles.dart';
import 'custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {

  @override
  bool isTermsAccepted = false;
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            widget.onChanged(value);
            isTermsAccepted = value;
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: AppStrings.agree.tr(),
                  style: isDark ? TextStyles.font14SemiBold.copyWith(
                      color:  AppColors.textColorDarkSecondary
                  ): TextStyle(color: Colors.black),
                ),
                TextSpan(text: '  '),
                TextSpan(
                  text: AppStrings.terms.tr(),
                  style: TextStyles.font14SemiBold.copyWith(color: AppColors.primaryBtnColor)),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
