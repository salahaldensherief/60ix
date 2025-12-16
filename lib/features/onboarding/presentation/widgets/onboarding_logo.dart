import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/art_core/extensions/padding.dart';

import '../../../../art_core/utils/assets_data.dart';

class OnboardingLogo extends StatelessWidget {
  const OnboardingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: SvgPicture.asset(width: 90.w, AssetsData.logo)).padOnly(bottom: 52,top: 50);
  }
}
