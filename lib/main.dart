import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/theme/theme.dart';
import 'package:ix/art_core/utils/assets_data.dart';
import 'package:ix/core/router/router.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/password_recovery_view.dart';
import 'package:ix/features/auth/presentation/login/login_view.dart';
import 'package:ix/features/splash/presntation/splash_view.dart';
import 'features/auth/presentation/signup/signup_view_body.dart';
import 'features/onboarding/presentation/onboarding_view.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en')],
      path: AssetsData.translations,
      fallbackLocale: Locale('en'),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MyApp(),
      ),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: MaterialApp(
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: NavigatorKeys.splash,
        routes: <String, WidgetBuilder>{
          NavigatorKeys.splash: (BuildContext context) => SplashView(),
          NavigatorKeys.onBoardingPage: (BuildContext context) =>
              OnboardingView(),
          NavigatorKeys.signIn: (BuildContext context) => LoginView(),
          NavigatorKeys.signUp: (BuildContext context) => SignupView(),
          NavigatorKeys.passwordRecovery: (BuildContext context) =>
              PasswordRecoveryView(),
        },
      ),
    );
  }
}
