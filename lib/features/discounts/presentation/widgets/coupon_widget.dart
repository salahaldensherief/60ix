// lib/widgets/coupon_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/art_core/utils/app_colors.dart';
import 'package:ix/art_core/utils/assets_data.dart';
import 'package:ix/art_core/widgets/text_fields/custom_text_field.dart';

class CouponWidget extends StatefulWidget {
  const CouponWidget({super.key});

  @override
  State<CouponWidget> createState() => _CouponWidgetState();
}

class _CouponWidgetState extends State<CouponWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Do You Have Coupon Code?',
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xFF1A1A2E),
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'View More Coupons',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 10.h),
    CustomTextFormField(
      fillColor: AppColors.transparent,

      radius: BorderRadius.circular(32),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SvgPicture.asset(AssetsData.couponIcon),
      ),
      text: 'Enter coupon code here ...',
      suffixIcon: SizedBox(
        width: 90,
        height: 36,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 5),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.colorBtnSecondaryLabel,
              padding: EdgeInsets.zero,
              shape: const StadiumBorder(),
            ),
            child: const Text('Apply'),
          ),
        ),
      ),
    )
      ],
    );
  }
}
