import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';

import '../../../../../../../art_core/utils/app_colors.dart';

class TimeCountWidget extends StatelessWidget {
  const TimeCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('00:',style: TextStyle(color: AppColors.textColorLightPrimary),
        ),

        CountDownText(
          longDateName: true,
          due: DateTime.now().add(
              const Duration(
                  seconds: 30)),
          ///TODO: this is the reason why it show 00:00:00 when finished
          finishedText: "00:00",
          style: TextStyle(color: AppColors.textColorLightPrimary),
        ),
      ],
    );
  }
}
