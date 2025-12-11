import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/features/onboarding/presentation/onboarding_view.dart';

import '../../../../art_core/utils/assets_data.dart';

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
    ///TODO: instead of this try
    ///extension ContextExtensions on BuildContext {
    /// double get width => MediaQuery.of(this).size.width;
    ///   double get height => MediaQuery.of(this).size.height;
    ///   double get topPadding => MediaQuery.of(this).padding.top;
    ///   double get bottomPadding => MediaQuery.of(this).padding.bottom;
    /// }

    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: Center(
        child:
        SvgPicture.asset(
          /// width: context.width * 0.4,
            width: width / 2.5,
            AssetsData.logo),

      ),
    );
  }
  ///TODO: keep correct spelling in mind
  void excuteNavigation() async {
    ///TODO: this way is not the best option .
    ///try using Timer
    Future.delayed(const Duration(seconds: 3), () {
///TODO: try to ues pushNamed .
      /// note: you will need to create a file for routes
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnboardingView(),));

    });
  }
}