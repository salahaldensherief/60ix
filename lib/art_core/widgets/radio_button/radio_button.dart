import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/themes.dart';

part 'custom_radio_button.dart';
part 'custom_radio_group.dart';

class EXRadioButton extends StatelessWidget {
  const EXRadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        //Todo :: CustomRadioButton
        CustomRadioButton<String>(
          value: "option1",
          selectedValue: "option1", // Selected if matches
          onChanged: (newValue) {
            print("Selected: $newValue");
          },
          labelText: "Option 1",
        ),

        //Todo :: CustomRadioButtonGroup
        CustomRadioButtonGroup<String>(
          values: ["option1", "option2", "option3"],
          initialValue: "option1",
          onChanged: (newValue) {
            print("Group selected: $newValue");
          },
          labels: ["Option 1", "Option 2", "Option 3"],
          direction: Axis.vertical, // Optional: horizontal layout
        ),
      ],
    );
  }
}
