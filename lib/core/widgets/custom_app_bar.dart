import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/core/utils/app_colors.dart';
import 'package:ix/core/utils/assets_data.dart';
import '../utils/font_styles.dart';

class CustomAppBar extends StatelessWidget{
  final String title;
  final String subtitle;
  final bool showBack;
  final VoidCallback? onBack;
  final bool centerTitle;
  final Color? BackgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.onBack,
    this.centerTitle = true,
    this.BackgroundColor, required this.subtitle,
  });


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if(showBack)
                GestureDetector(
                  onTap: onBack ?? () {
                    Navigator.of(context).pop();
                  },
                  child:  SvgPicture.asset(AssetsData.backIcon),
                ),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: showBack == true ? 12.w : 0),
                child: Text(
                    title,
                    style: TextStyles.font16SemiBold
                  ),
              ),
            ],
          ),
          SizedBox(height: 8.h,),
          Text(
              subtitle,
              style: TextStyles.font14mediumRegular.copyWith(
    color:AppColors.textColorSecondary

              )
    ),
        ],
      ),
    );
  }
}
