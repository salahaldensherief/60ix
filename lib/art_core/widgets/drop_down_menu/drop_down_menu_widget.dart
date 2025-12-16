import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/text_field_theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/font_styles.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hintText != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(hintText!, style: TextStyles.font14mediumRegular),
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
            fillColor:  AppTextFieldTheme.textFieldColor(context),
            enabledBorder: OutlineInputBorder(

              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.textFieldLightBorderColor.withOpacity(.2),width: .3),
            ),
            border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.textFieldLightFillColor,width: .3),
            ),
          ),
          width: width,
          textStyle: TextStyles.font12Small,
          hintText: text,

          dropdownMenuEntries: dropdownMenuEntries,
          trailingIcon: Icon(
            Icons.arrow_drop_down_sharp,
            color:  isDark ? AppColors.textColorDarkSecondary:  AppColors.colorBtnSecondaryLabel,
          ),
        ),

      ],
    );
  }
}
