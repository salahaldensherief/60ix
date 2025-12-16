import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/extensions/padding.dart';
import '../../../../art_core/utils/app_strings.dart';
import 'custom_carousel_slider.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        children: [
          Expanded(child: CustomCarouselSlider()),
          Text(
            AppStrings.onboardingTitle.tr(),
            style: theme.displayMedium,
            textAlign: TextAlign.center,
          ).padOnly(bottom: 80),
        ],
      ),
    );
  }
}