import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/core/utils/assets_data.dart';
import 'package:ix/features/onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
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