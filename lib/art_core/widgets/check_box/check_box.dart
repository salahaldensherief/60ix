import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';

part 'custom_check_box.dart';

class ExCheckBox extends StatelessWidget {
  const ExCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCheckBox(
          isChecked: true, // Initially checked
          onChanged: (newValue) {
            print("Checkbox toggled to: $newValue");
          },
          labelText: "Accept Terms",
          fontSize: 14.0,
          labelColor: AppColors.blue,
          primaryColor: AppColors.primary.shade400,
        ),
      ],
    );
  }
}
