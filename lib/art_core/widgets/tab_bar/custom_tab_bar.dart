import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/core/constants/app_config.dart';

class CustomTabBar extends StatelessWidget {
  final String text;
  final bool isSelected;
  final EdgeInsetsGeometry? padding;
  const CustomTabBar({super.key, required this.text, this.isSelected = false, this.padding});


  Color get backgroundColor {
    if(AppConfig.isDarkMode){
      return isSelected ? AppColors.primary : AppColors.darkBlue;
    }else{
      return isSelected ? AppColors.primary : AppColors.lightBlue;
    }
  }
 
  Color get textColor {
    if(AppConfig.isDarkMode){
      return isSelected ? AppColors.white : AppColors.grey.shade50;
    }else{
      return isSelected ? AppColors.white : AppColors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.zero,
      padding: padding ?? REdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
      constraints: BoxConstraints(
        minWidth: 90.w,
        minHeight: 30.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.0.r),
      ),
      child: Center(
        child: FittedBox(
          child: AppText(
            textAlign: TextAlign.center,
            text: text.tr(),
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
