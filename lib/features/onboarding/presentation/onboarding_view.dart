import 'package:flutter/material.dart';
import 'package:ix/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:ix/features/onboarding/presentation/widgets/onboarding_actions.dart';
import 'package:ix/features/onboarding/presentation/widgets/onboarding_logo.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {

    ///TODO: try dividing the screen into 3 sections : header/ top , body , footer/ bottom
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ///top
            ///TODO: using SizedBox as space holder her is not the best thing to do , try using padding
            ///note : you can add new extension for padding
            /// exp:
            OnboardingLogo(),

            ///body
            OnboardingBody(),

            ///bottom
            OnboardingActions(),
          ],
        ),
      ),
    );
  }
}
