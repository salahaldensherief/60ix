import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'categories_headline.dart';

enum Badge { required, optional }

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.badge,
    required this.name1,
    required this.name2, required this.icon,
  });

  final String name1;
  final String icon;
  final String name2;
  final Badge badge;

  @override
  Widget build(BuildContext context) {
    final isRequired = badge == Badge.required;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoriesHeadline(name1: name1, name2: name2,icon:icon, ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: isRequired ? Colors.red.shade50 : Colors.orange.shade50,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            isRequired ? "Required" : "Optional",
            style: TextStyle(
              fontSize: 11.sp,
              color: isRequired ? Colors.red : Colors.orange,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
