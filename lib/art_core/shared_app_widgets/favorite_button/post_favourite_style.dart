import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/app_strings.dart';
import '../../resources/assets_manager.dart';
import '../../theme/themes.dart';
import '../../widgets/svg_icon/svg_icon_widget.dart';
import '../../widgets/text/app_text.dart';
import 'base_favourite_style.dart';

class PostFavoriteStyle extends BaseFavoriteStyle {
  @override
  Widget build({required bool isFav, required int count}) {
    return Row(
      children: [
        SvgIconWidget(
          path: isFav ? AssetsManager.fillLoveIcon : AssetsManager.loveIcon,
        ),
        if (count != null) ...[
          SizedBox(width: 4.w),
          AppText(
            text: '$count  ${AppString.love.tr()}',
            color: isFav ? AppColors.primary : null,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
          ),
        ],
      ],
    );
  }
}
