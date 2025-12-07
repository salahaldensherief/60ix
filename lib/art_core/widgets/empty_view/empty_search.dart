import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/core/translate/translate.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RSizedBox(height: 30.0,),
          Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: AppColors.customColor(
                lightColor: AppColors.grey.shade50,
                darkColor: AppColors.grey.shade200,
              ),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgIconWidget(
                path: AssetsManager.noSearch,
                color: AppColors.customColor(
                  lightColor: AppColors.primary,
                  darkColor: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          AppText(
            text: translate(AppString.noResult),
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          AppText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            text: translate(AppString.noSearchDes),
          ),
        ],
      ),
    );
  }
}
