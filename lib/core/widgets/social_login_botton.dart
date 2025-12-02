import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/core/utils/app_colors.dart';
import 'package:ix/core/utils/assets_data.dart';
import 'package:ix/core/widgets/social_icon_widget.dart';

import '../utils/font_styles.dart';

// Project imports:

class SocialLoginBotton extends StatelessWidget {
  const SocialLoginBotton({super.key,});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIconWidget(onPressed: (){}, image: AssetsData.facebookLogo),
        SizedBox(width: 16.w),
        SocialIconWidget(onPressed: (){}, image: AssetsData.googleLogo),
        SizedBox(width: 16.w),
        SocialIconWidget(onPressed: (){}, image:AssetsData.appleLogo ),
      ],
    );
  }
}

