import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/resources/app_strings.dart';

import '../../theme/themes.dart';
import '../../widgets/text/app_text.dart';
import 'base_favourite_style.dart';

class CommentFavoriteStyle extends BaseFavoriteStyle {
  @override
  Widget build({required bool isFav, required int count}) {
    return AppText(
      text: AppString.love.tr(),
      color: isFav ? AppColors.primary : null,
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
    );
  }
}
