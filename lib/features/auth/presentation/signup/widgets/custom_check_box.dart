// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/art_core/utils/assets_data.dart';

import '../../../../../art_core/utils/app_colors.dart';

// Project imports:

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });
  final bool isChecked;
  final ValueChanged<bool> onChecked;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 22,
        height: 22,
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          border: Border.all(
            color: isChecked ? AppColors.greenColor : AppColors.textFieldLightBorderColor,
            width: 1,
          ),

          color: isChecked ? AppColors.greenColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: isChecked
            ? Padding(
              padding:  EdgeInsets.all(3),
              child: SvgPicture.asset( AssetsData.trueIcon),
            )
            : const SizedBox(),
      ),
    );
  }
}
