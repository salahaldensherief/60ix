// lib/widgets/title_price_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/utils/app_colors.dart';
import 'package:ix/art_core/utils/assets_data.dart';
import 'package:ix/art_core/widgets/icons/fav_icon_widget.dart';
import 'package:ix/features/discounts/presentation/widgets/buy_and_sell_widget.dart';

import 'discount_container_widget.dart';

class TitlePriceWidget extends StatefulWidget {
  const TitlePriceWidget({super.key});

  @override
  State<TitlePriceWidget> createState() => _TitlePriceWidgetState();
}

class _TitlePriceWidgetState extends State<TitlePriceWidget> {
  bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Veterinary Care',
                style: theme.displayMedium?.copyWith(fontSize: 18.sp),
              ),
            ),
            BuyAndSellWidget(),
          ],
        ),

        Text(
          'My focus is on building trust and skill in every horse work with,\n Contact me for expert training services!',
          style: theme.titleLarge?.copyWith(color: AppColors.gray300Color),
        ),

        SizedBox(height: 6.h),
        _buildPriceRow(theme),
      ],
    ).padSymmetric(vertical: 10);
  }
}

Widget _buildPriceRow(TextTheme theme) {
  return Row(
    children: [
      Text(
        '120.000 SAR',
        style: theme.labelMedium?.copyWith(color: AppColors.primaryColor),
      ),
      SizedBox(width: 8.w),
      Text(
        '150.00 SAR',
        style: theme.titleMedium?.copyWith(
          decoration: TextDecoration.lineThrough,
        ),
      ),
      SizedBox(width: 4.w),

      DiscountContainerWidget(theme: theme),
      const Spacer(),
      SvgPicture.asset(AssetsData.starIcon, width: 16.w, height: 16.w),

      Text(
        '4.5',
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1A1A2E),
        ),
      ),
      SizedBox(width: 4.w),
      Text(
        '(1,274 ratings)',
        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
      ),
    ],
  );
}
