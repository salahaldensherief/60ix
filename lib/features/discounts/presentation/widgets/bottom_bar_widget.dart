
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/utils/app_colors.dart';
import 'package:ix/art_core/widgets/icons/comment_widget.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:AppColors.borderColor,
            blurRadius: 0,
            offset: Offset(0, -1), // ← للأعلى لأنه bottom bar
          ),
        ],
        color: Colors.white,),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(


                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Get Discount',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white.withOpacity(.7),
                          ),
                        ).padOnly(right: 5),

                        Text(
                          '285 EGP',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ).padSymmetric(horizontal: 16),
              ),
            ),
          ),

          SizedBox(width: 10.w),

          CommentWidget(
            width: 50.w,
            height: 50.h,
            padding: 12,
          )


        ],
      ),
    );
  }
}
