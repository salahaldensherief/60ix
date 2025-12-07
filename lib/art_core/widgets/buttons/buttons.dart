import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/art_core/resources/fonts_manager.dart';

import '../../../core/constants/app_config.dart';

part 'app_button.dart';
part 'res/button_animator.dart';
part 'res/button_behavior.dart';
part 'res/button_content.dart';
part 'res/button_style_config.dart';

class ExButtons extends StatelessWidget {
  const ExButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(), // Default filled button
        const SizedBox(height: 20),
        AppButton(
          buttonConfig: ButtonConfig(),
          behavior: TapBehavior(
            onTap: () => print('Tapped'),
            checkLogin: true,
          ),
          content: const ButtonContent(
            label: 'Tap Me',
            icon: Icon(Icons.touch_app, color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        AppButton(
          buttonConfig: ButtonConfig.secondary(),
          behavior: TapBehavior(onTap: () {}),
          content: const ButtonContent(label: 'Reset / Secondary'),
        ),
        const SizedBox(height: 20),
        AppButton(
          buttonConfig: ButtonConfig.outlined(),
          behavior: TapBehavior(onTap: () => print('Outlined Tapped')),
          content: const ButtonContent(
            label: 'Outlined',
            icon: Icon(Icons.border_outer, color: AppColors.primary),
          ),
        ),
        const SizedBox(height: 20),
        AppButton(
          buttonConfig: ButtonConfig(backgroundColor: AppColors.red),
          behavior: ConfirmBehavior(
            onConfirm: () => print('Confirmed'),
            message: "Are you sure?",
          ),
          content: const ButtonContent(
            label: 'Remove',
            icon: Icon(Icons.delete, color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        AppButton(
          buttonConfig: ButtonConfig(),
          behavior: const TapBehavior(isEnabled: false),
          content: const ButtonContent(label: 'Disabled'),
        ),
      ],
    );
  }
}
