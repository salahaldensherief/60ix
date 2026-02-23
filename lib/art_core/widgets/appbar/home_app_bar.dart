import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';

import '../../../features/discounts/presentation/widgets/app_bar_icons_widget.dart';
import '../../../features/discounts/presentation/widgets/app_bar_user_headline.dart';
import '../../../features/discounts/presentation/widgets/profile_animated_flip.dart';
import '../../utils/assets_data.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          ProfileAnimatedFlip(
            imagePath: AssetsData.person,
            rank: AssetsData.rank,
            size: 40,
          ),
          SizedBox(width: 10.w),
          AppBarUserHeadline(),
          Spacer(),
          Row(
            children: [
              AppBarIconsWidget(icon: AssetsData.cartIcon, onTap: () {}),
              SizedBox(width: 8.w),
              AppBarIconsWidget(
                icon: AssetsData.messagesIcon,
                onTap: () {},
              ),
              SizedBox(width: 8.w),
      
              AppBarIconsWidget(
                icon: AssetsData.notificationsIcon,
                onTap: () {},
              ),
            ],
          ),
        ],
      ).padSymmetric(horizontal: 18)
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
