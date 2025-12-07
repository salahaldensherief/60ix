import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/features/auth/presentation/login/login_view.dart';
import 'package:ix/features/auth/presentation/signup/signup_view.dart';
import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/assets_data.dart';
import '../../../../art_core/utils/font_styles.dart';
import '../../../../art_core/widgets/buttons/custom_button.dart';
import 'custom_carousel_slider.dart';
class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});
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
              'Care services, quality products, and a loving \n community all in one app',
              style: TextStyles.font18MediumGray.copyWith(
                color: AppColors.blue500
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80.h),
            CustomButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignupView(),));
              },
              textStyle: TextStyles.font16SemiBold.copyWith(
                color: AppColors.whiteColor
              ),
              text: 'Create A New Account',
              color: AppColors.primaryColor,
              colorSide: AppColors.primaryColor,
            ),
            SizedBox(height: 16.h),
            CustomButton(
              textStyle: TextStyles.font16SemiBold,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginView(),));
              },
              text: 'Guest Login',
              color: AppColors.lightOrangeColor,
              colorSide: AppColors.lightOrangeColor,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
