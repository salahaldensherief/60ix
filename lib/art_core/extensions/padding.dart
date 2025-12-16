import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtensions on Widget {
  // All padding
  Widget padAll(double value) =>
      Padding(padding: EdgeInsets.all(value.w), child: this);

  // Horizontal + Vertical
  Widget padSymmetric({double horizontal = 0, double vertical = 0}) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: horizontal.w,
      vertical: vertical.h,
    ),
    child: this,
  );

  // Only specific sides
  Widget padOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      top: top,
      right: right.w,
      bottom: bottom.h,
    ),
    child: this,
  );
}
