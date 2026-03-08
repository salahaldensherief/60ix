import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/art_core/theme/text_theme_toggle.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_data.dart';
import '../../utils/font_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? size;
  final String? subtitle;
  final bool showBack;
  final VoidCallback? onBack;
  final bool centerTitle;
  final Color? backgroundColor;
  final bool showElevation;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.onBack,
    this.showElevation = false,
    this.centerTitle = false,
    this.backgroundColor,
    this.subtitle,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(

      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? AppColors.whiteColor,

      elevation: showElevation ? 0.2 : 0,

      centerTitle: centerTitle,

      leading: showBack
          ? GestureDetector(
        onTap: onBack ??
                () {
              Navigator.of(context).pop();
            },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: SvgPicture.asset(
            AssetsData.backIcon,
            color: isDark ? AppColors.appBarDarkColor : null,
          ),
        ),
      )
          : null,

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextThemeToggle.textTheme(context).headlineLarge,
          ),
          subtitle?.isNotEmpty == true
              ? Text(
            subtitle!,
            style: TextStyles.font14mediumRegular,
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size ?? 60);
}
// Text(phoneNumber! ,style: TextStyles.font12Medium.copyWith(
//   color: Colors.black
// )
// ),
