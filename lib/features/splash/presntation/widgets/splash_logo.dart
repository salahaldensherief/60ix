import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/art_core/extensions/media_query.dart';
import '../../../../art_core/utils/assets_data.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return  Center(
      child: SvgPicture.asset(width: context.width * 0.4, AssetsData.logo),
    );
  }
}
