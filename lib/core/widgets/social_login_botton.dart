import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/core/utils/app_colors.dart';
import 'package:ix/core/utils/assets_data.dart';
import 'package:ix/core/utils/helper.dart';
import 'package:ix/core/widgets/social_icon_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/font_styles.dart';

class SocialLoginBotton extends StatelessWidget {
  SocialLoginBotton({super.key});
  final Uri google = Uri.parse(UrlLinks.google);
  final Uri facebook = Uri.parse(UrlLinks.facebook);
  final Uri apple = Uri.parse(UrlLinks.apple);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIconWidget(
          onPressed: () {
            _googleLaunchUrl();
          },
          image: AssetsData.googleLogo,
        ),
        SizedBox(width: 16.w),
        SocialIconWidget(
          onPressed: () {
            _facebookLaunchUrl();
          },
          image: AssetsData.facebookLogo,
        ),
        SizedBox(width: 16.w),
        SocialIconWidget(
          onPressed: () {
            _appleLaunchUrl();
          },
          image: AssetsData.appleLogo,
        ),
      ],
    );
  }
  // There is another solution to this problem that I will do it is much better, but it will take some time for me to think.
  // hint: polymorphism / abstraction
  Future<void> _googleLaunchUrl() async {
    if (!await launchUrl(google)) {
      throw Exception('Could not launch $google');
    }
  }

  Future<void> _facebookLaunchUrl() async {
    if (!await launchUrl(facebook)) {
      throw Exception('Could not launch $facebook');
    }
  }

  Future<void> _appleLaunchUrl() async {
    if (!await launchUrl(apple)) {
      throw Exception('Could not launch $apple');
    }
  }
}
