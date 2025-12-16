import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ix/features/splash/presntation/widgets/splash_logo.dart';
import '../../../core/router/router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    timerNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SplashLogo(),
    );
  }

  ///TODO: keep correct spelling in mind
  void timerNavigation() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(
        context,
      ).pushReplacementNamed(NavigatorKeys.onBoardingPage),

      ///TODO: this way is not the best option .
      ///try using Timer
      ///TODO: try to ues pushNamed .
      /// note: you will need to create a file for routes
    );
  }
}
