import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/core/utils/font_styles.dart';

import '../utils/app_colors.dart';

class DropDownMenuWidget<T> extends StatelessWidget {
  final String? hintText;
  final String? text;
  List<DropdownMenuEntry<T>> dropdownMenuEntries;
  DropDownMenuWidget({
    super.key,
    this.hintText,
    required this.dropdownMenuEntries,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hintText != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(hintText!, style: TextStyles.font14MediumGray),
          ),
        ],
        DropdownMenu(
          menuStyle: MenuStyle(
            elevation: WidgetStatePropertyAll(.2),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            ),
            alignment: Alignment.bottomLeft,
            fixedSize: MaterialStateProperty.all<Size>(Size(width / 2, 100.h)),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: AppColors.white10,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.white20),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.white10),
            ),
          ),
          width: width,
          textStyle: TextStyles.font12Small,
          hintText: text,

          dropdownMenuEntries: dropdownMenuEntries,
        ),
      ],
    );
  }
}
