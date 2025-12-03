import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/assets_data.dart';
import '../../onboarding/presentation/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {  @override
void initState() {
  excuteNavigation();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: Center(
        child:
        SvgPicture.asset(
            width: width / 2.5,
            AssetsData.logo),

      ),
    );
  }

void excuteNavigation() async {
  Future.delayed(const Duration(seconds: 3), () {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnboardingView(),));

  });
}
}

