import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/utils/app_strings.dart';

import '../../../../art_core/utils/app_colors.dart';

class BuyAndSellWidget extends StatelessWidget {
  const BuyAndSellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      width: 60.w,
      height: 20.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.orangeShade100,
      ),
      child: Center(
        child: Text(
          AppStrings.buyAndSell.tr(),
          style: theme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
