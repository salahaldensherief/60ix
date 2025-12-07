import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../art_core.dart';

class CustomEmptyViewList extends StatelessWidget {
  final String? title;

  const CustomEmptyViewList({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 50, color: AppColors.blue.shade400),
          const SizedBox(height: 10),
          AppText(text: title ??AppString.anErrorOccurred.tr()),
        ],
      ),
    );
  }
}
