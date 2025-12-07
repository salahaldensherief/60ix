import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/core/constants/app_config.dart';

import '../../resources/app_strings.dart';
import '../../resources/assets_manager.dart';
import '../../theme/themes.dart';
import '../svg_icon/svg_icon_widget.dart';
import 'app_text.dart';

class SeeAllSection extends StatelessWidget {
  final String title;
  final bool shouldSeeAll;

  final VoidCallback? onTap;

  const SeeAllSection({
    super.key,
    required this.title,
    this.shouldSeeAll = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppText(
            text: title,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (shouldSeeAll) ...[
          TextButton.icon(
            onPressed: onTap,
            label: AppText(
              text: AppString.seeAll.tr(),
              color: AppColors.primary,
              fontSize: 12.sp,
            ),
            icon: Transform(
              transform: Matrix4.rotationY(0),

              child: SvgIconWidget(
                path: AssetsManager.arrowRight,
                width: 5.w,
                height: 8.h,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
