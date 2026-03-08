import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/art_core/utils/app_strings.dart';

import '../../../../art_core/extensions/padding.dart';
import '../../../../art_core/utils/app_colors.dart';
import '../../../../art_core/utils/assets_data.dart';
import '../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../art_core/widgets/icons/comment_widget.dart';
import '../../../../art_core/widgets/icons/fav_icon_widget.dart';
import 'buy_and_sell_widget.dart';
import 'discount_container_widget.dart';

class ServiceCard extends StatelessWidget {
  final Axis direction;
  final String serviceTitle;
  final String centerName;
  final String image;
  final String serviceLogo;
  final String price;
  final String oldPrice;
  final String rating;

  final VoidCallback? onTap;
  final VoidCallback? onFavorite;

  const ServiceCard({
    super.key,
    required this.direction,
    required this.serviceTitle,
    required this.centerName,
    required this.image,
    required this.serviceLogo,
    required this.price,
    required this.oldPrice,
    required this.rating,
    this.onTap,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: direction == Axis.vertical
          ? _buildVertical(theme)
          : _buildHorizontal(theme),
    );
  }

  Widget _buildVertical(TextTheme theme) {
    return Column(
      children: [
        Expanded(child: _buildImageSection()),
        _buildDetails(theme),
      ],
    );
  }

  Widget _buildHorizontal(TextTheme theme) {
    return Row(
      children: [
        SizedBox(width: 140.w, child: _buildImageSection()),
        Expanded(child: _buildDetails(theme)),
      ],
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Image.asset(image, width: double.infinity, fit: BoxFit.fill),
          ),
        ),
        Positioned(
          top: 8.h,
          right: 8.w,
          child: LoveIconWidget(onTap: onFavorite ?? () {}),
        ),
        Positioned(bottom: 8.h, left: 8.w, child: BuyAndSellWidget()),
      ],
    );
  }

  Widget _buildDetails(TextTheme theme) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 4.h),

          _buildTitleAndRate(theme),

          _buildCenterNameRow(theme),
          SizedBox(height: 4),

          _buildPriceRow(theme),
          SizedBox(height: 2),

          _buildActionRow(theme),
        ],
      ),
    );
  }

  Widget _buildTitleAndRate(TextTheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text(
            serviceTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.displayMedium?.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: [
            Text(rating),
            SvgPicture.asset(AssetsData.starIcon)

          ],
        )
      ],
    );
  }

  Widget _buildCenterNameRow(TextTheme theme) {
    return Row(
      children: [
        Image.asset(serviceLogo, width: 18.w),
        SizedBox(width: 4.w),
        Text(
          centerName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.headlineMedium?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(TextTheme theme) {
    return Row(
      children: [
        Text(
          '$price SAR',
          style: theme.labelMedium?.copyWith(color: AppColors.primaryColor),
        ),
        SizedBox(width: 4.w),
        Text(
          '$oldPrice SAR',
          style: theme.titleMedium?.copyWith(
            decoration: TextDecoration.lineThrough,
          ),
        ),


        DiscountContainerWidget(theme: theme,),
      ],
    );
  }

  Widget _buildActionRow(TextTheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomButton(
            onPressed: onTap,
            text: AppStrings.getDiscount.tr(),
            textStyle: theme.titleSmall?.copyWith(color: AppColors.whiteColor),
            radius: BorderRadius.circular(20.r),
            color: AppColors.primaryColor,
            size: const Size(double.infinity, 30),
          ),
        ),
        SizedBox(width: 2.w),
        CommentWidget(
          padding: 7,
          width: 30.w,
          height: 30.h,
        ),
      ],
    );
  }
}

