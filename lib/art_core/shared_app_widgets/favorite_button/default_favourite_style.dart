import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_config.dart';
import '../../resources/app_styles.dart';
import '../../theme/themes.dart';
import 'base_favourite_style.dart';

class DefaultFavoriteStyle extends BaseFavoriteStyle {
  @override
  Widget build({required bool isFav, required int count}) {
    return Container(
      height: 36.h,
      width: 36.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            AppConfig.isDarkMode
                ? AppColors.lightBlueGrey
                : AppColors.white.withOpacity(0.85),
        border: Border.all(
          color:
              AppConfig.isDarkMode
                  ? AppColors.lightBlueGrey
                  : (isFav ? AppColors.primary.shade50 : AppColors.stroke),
          width: 2.0,
        ),
        boxShadow: [AppStyles.shadowMedium],
      ),
      child: Center(
        child: AnimatedContainer(
          height: isFav ? 21.w : null,
          width: isFav ? 21.w : null,
          padding: isFav ? EdgeInsets.zero : REdgeInsets.all(3),
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isFav ? AppColors.primary : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            size: isFav ? 14.sp : 18.sp,
            color:
                AppConfig.isDarkMode
                    ? (isFav ? AppColors.white : AppColors.grey.shade50)
                    : (isFav ? AppColors.white : AppColors.blue),
          ),
        ),
      ),
    );
  }
}
