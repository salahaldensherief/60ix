import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/art_core/utils/assets_data.dart';

import '../../theme/text_field_theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/font_styles.dart';

class DropDownMenuWidget<T> extends StatelessWidget {
  final String? hintText;
  final String? text;
  final Radius? radius;
  final void Function(T?)? onSelected;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;

  const DropDownMenuWidget({
    super.key,
    this.hintText,
    this.radius,
    required this.dropdownMenuEntries,
    this.text,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    final borderRadius = radius ?? Radius.circular(8.r);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hintText != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(hintText!, style: TextStyles.font14mediumRegular),
          ),

        DropdownMenu<T>(
          onSelected: onSelected,

          menuStyle: MenuStyle(
            elevation: const WidgetStatePropertyAll(2),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(borderRadius),
              ),
            ),
            alignment: Alignment.bottomLeft,
          ),

          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: AppTextFieldTheme.textFieldColor(context),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(borderRadius),
              borderSide: BorderSide(
                color: AppColors.textFieldLightBorderColor.withOpacity(.2),
                width: .3,
              ),
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(borderRadius),
              borderSide: const BorderSide(width: .3),
            ),
          ),

          width: width,

          textStyle: TextStyles.font12Small,

          hintText: text,

          dropdownMenuEntries: dropdownMenuEntries,

          leadingIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              AssetsData.mapIcon,
            ),
          ),
          trailingIcon: Icon(
            Icons.arrow_drop_down_sharp,
            color: isDark
                ? AppColors.textColorDarkSecondary
                : AppColors.colorBtnSecondaryLabel,
          ),
        ),
      ],
    );
  }
}
