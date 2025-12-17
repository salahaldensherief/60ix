import 'package:flutter/material.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/utils/url_links.dart';
import 'package:ix/features/auth/presentation/widgets/social_icon_widget.dart';
import 'package:ix/features/auth/presentation/widgets/social_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../art_core/utils/assets_data.dart';
import 'auth_or_divider_widget.dart';

///TODO

class SocialLoginButtons extends StatelessWidget {
  SocialLoginButtons({super.key});
  final Uri google = Uri.parse(UrlLinks.google);
  final Uri facebook = Uri.parse(UrlLinks.facebook);
  final Uri apple = Uri.parse(UrlLinks.apple);

  late final List<SocialModel> socialData = [
    SocialModel(image: AssetsData.googleLogo, onPressed: _googleLaunchUrl),
    SocialModel(image: AssetsData.facebookLogo, onPressed: _facebookLaunchUrl),
    SocialModel(image: AssetsData.appleLogo, onPressed: _appleLaunchUrl),
  ];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        AuthOrDividerWidget().padOnly(top: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            socialData.length,
            (index) => SocialIconWidget(
              onPressed: socialData[index].onPressed,
              image: socialData[index].image,
            ),
          ),
        ).padOnly(top: 30),
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
