import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          Text(
              title,
              style: TextStyles.font20SemiBoldBlue
            ),
          SizedBox(height: 16.h,),
          Text(
              subtitle,
              style: TextStyles.font14MediumGray
            ),
        ],
      ),
    );
  }
}
