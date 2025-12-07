part of '../shared_app_widgets.dart';

class AppLogo extends StatelessWidget {
  final double? height, width;
  const AppLogo({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppThemes.isDarkMode()
            ? "assets/images/logo_dark_mode.png"
            : "assets/images/logo_light_mode.png",
        height: height ?? 200.0.h,
        width: width ?? 200.0.w,
      ),
    );
  }
}
