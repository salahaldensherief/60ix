import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/features/auth/presentation/login/widgets/login_actions.dart';
import 'package:ix/features/auth/presentation/login/widgets/login_form.dart';
import '../../../../art_core/utils/app_strings.dart';
import '../../../../art_core/widgets/appbar/custom_app_bar.dart';
import '../../../../core/di/service_locator.dart';
import 'login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        subtitle: AppStrings.loginToContinueAccount.tr(),
        title: AppStrings.letsSignIn.tr(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: BlocProvider(
          create: (context) => LoginCubit(authRepo: sl()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///TODO
              LoginForm(),
              LoginActions(),
            ],
          ),
        ),
      ).padSymmetric(horizontal: 18.w),
    );
  }
}
