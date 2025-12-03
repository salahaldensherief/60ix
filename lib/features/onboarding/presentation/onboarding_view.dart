import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/core/utils/app_colors.dart';
import 'package:ix/core/utils/font_styles.dart';
import 'package:ix/core/widgets/custom_button.dart';
import 'package:ix/features/auth/presentation/login/views/login_view.dart';
import 'package:ix/features/onboarding/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:ix/features/auth/presentation/views/login_view.dart';
import 'package:ix/features/onboarding/presentation/widgets/custom_carousel_slider.dart';

import '../../../../core/utils/assets_data.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Center(child: SvgPicture.asset(width: 90.w, AssetsData.logo)),
            SizedBox(height: 40.h),
            Expanded(child: CustomCarouselSlider()),
            Text(
              'Care services, quality products,\n and a loving community all in one\n app',
              style: TextStyles.font20SemiBoldBlue,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            CustomButton(
              onPressed: () {},
              textStyle: TextStyles.font14SemiBold,
              text: 'Create A New Account',
              color: AppColors.primaryColor,
              colorSide: AppColors.primaryColor,
              fontColor: AppColors.whiteColor,
            ),
            SizedBox(height: 16.h),
            CustomButton(
              textStyle: TextStyles.font14SemiBoldOrange,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginView(),));
              },
              text: 'Guest Login',
              color: AppColors.lightOrangeColor,
              colorSide: AppColors.lightOrangeColor,
              fontColor: AppColors.primaryColor,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
