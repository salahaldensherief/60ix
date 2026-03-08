import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/features/auth/presentation/signup/signup_cubit.dart';
import 'package:ix/features/auth/presentation/signup/widgets/signup_actions.dart';
import 'package:ix/features/auth/presentation/signup/widgets/signup_form.dart';
import '../../../../art_core/widgets/appbar/custom_app_bar.dart';
import '../../../../core/di/service_locator.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          size: 60,
          subtitle: AppStrings.createAccountToContinueCourses.tr(),
          title: AppStrings.gettingStarted.tr(),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocProvider(
            create: (context) => SignupCubit(authRepo: sl()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SignupForm().padOnly(bottom: 24), SignupActions()],
            ),
          ).padSymmetric(horizontal: 18.w),
        ),
      ),
    );
  }
}
