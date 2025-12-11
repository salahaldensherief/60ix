import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/art_core/theme/text_botton_theme.dart';
///TODO: remove unused imports
///always keep files clean
import 'package:ix/art_core/theme/theme.dart';
import 'package:ix/art_core/utils/app_strings.dart';
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
    final theme = Theme.of(context).textTheme;
    ///TODO: try dividing the screen into 3 sections : header/ top , body , footer/ bottom
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ///top
            ///TODO: using SizedBox as space holder her is not the best thing to do , try using padding
            ///note : you can add new extension for padding
            /// exp: extension PaddingExtensions on Widget {
            ///   // All padding
            ///   Widget padAll(double value) => Padding(
            ///         padding: EdgeInsets.all(value.w),
            ///         child: this,
            ///       );
            ///
            ///   // Horizontal + Vertical
            ///   Widget padSymmetric({double horizontal = 0, double vertical = 0}) => Padding(
            ///         padding: EdgeInsets.symmetric(
            ///           horizontal: horizontal.w,
            ///           vertical: vertical.h,
            ///         ),
            ///         child: this,
            ///       );
            ///
            ///   // Only specific sides
            ///   Widget padOnly({double left = 0, double top = 0, double right = 0, double bottom = 0}) =>
            ///       Padding(
            ///         padding: EdgeInsets.only(
            ///           left: left.w,
            ///           top: top.h,
            ///           right: right.w,
            ///           bottom: bottom.h,
            ///         ),
            ///         child: this,
            ///       );
            /// }
            SizedBox(height: 40.h),
            Center(child: SvgPicture.asset(width: 90.w, AssetsData.logo)),
            SizedBox(height: 40.h),
            ///body
            Expanded(child: CustomCarouselSlider()),
            Text(
              AppStrings.onboardingTitle.tr(),

              style: theme.displayMedium,
              // TextStyles.font18MediumGray.copyWith(
              //   color: AppColors.blue500
              // ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80.h),
            ///bottom
            CustomButton(
              onPressed: () {
                ///TODO
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignupView()),
                );
              },
              textStyle: theme.headlineLarge!,
              // TextStyles.font16SemiBold.copyWith(
              //   color: AppColors.whiteColor,
              // ),
              text: AppStrings.createNewAccount.tr(),
              color:AppTextButtonStyles.primaryColor(context),
            ),
            SizedBox(height: 16.h),
            CustomButton(

              textStyle: theme.headlineLarge!,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              text: AppStrings.guestLogin.tr(),
              color: AppTextButtonStyles.secondaryColor(context),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
