import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/art_core/theme/text_theme.dart';
import 'package:ix/art_core/theme/text_theme_toggle.dart';
import 'package:ix/art_core/theme/theme.dart';
import '../utils/app_colors.dart';
import '../utils/assets_data.dart';
import '../utils/font_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showBack;
  final VoidCallback? onBack;
  final bool centerTitle;
  final Color? BackgroundColor;
  // final String? phoneNumber;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.onBack,
    this.centerTitle = true,
    this.BackgroundColor,
    required this.subtitle,// this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;


    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              if (showBack)
                GestureDetector(
                  onTap:
                      onBack ??
                      () {
                        Navigator.of(context).pop();
                      },
                  child: SvgPicture.asset(AssetsData.backIcon,color: isDark ? AppColors.appBarDarkColor : null ,),
                ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: showBack == true ? 12.w : 0,
                ),
                child: Text(title, style:TextThemeToggle.textTheme(context).headlineLarge,
                )
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: TextStyles.font14mediumRegular.copyWith(

            ),
          ),
          // Text(phoneNumber! ,style: TextStyles.font12Medium.copyWith(
          //   color: Colors.black
          // )
          // ),

        ],
      ),
    );
  }
}
