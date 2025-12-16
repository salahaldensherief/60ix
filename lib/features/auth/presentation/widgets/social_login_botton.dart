import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/features/auth/presentation/widgets/url_links.dart';
import 'package:ix/features/auth/presentation/widgets/social_icon_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../art_core/utils/assets_data.dart';

///TODO

class SocialLoginBotton extends StatelessWidget {
  SocialLoginBotton({super.key});
  final Uri google = Uri.parse(UrlLinks.google);
  final Uri facebook = Uri.parse(UrlLinks.facebook);
  final Uri apple = Uri.parse(UrlLinks.apple);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ///TODO : try List.generate

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
          image:  isDark ? AssetsData.appleLogoDark : AssetsData.appleLogo,
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
