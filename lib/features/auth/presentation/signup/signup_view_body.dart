import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/features/auth/presentation/signup/widgets/signup_actions.dart';
import 'package:ix/features/auth/presentation/signup/widgets/signup_form.dart';
import '../../../../art_core/widgets/custom_app_bar.dart';
class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  subtitle: AppStrings.createAccountToContinueCourses.tr(),
                  title: AppStrings.gettingStarted.tr(),
                ),
                SignupForm().padOnly(bottom: 24),
                SignupActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
