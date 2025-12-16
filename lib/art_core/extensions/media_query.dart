import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
 double get width => MediaQuery.of(this).size.width;
   double get height => MediaQuery.of(this).size.height;
   double get topPadding => MediaQuery.of(this).padding.top;
   double get bottomPadding => MediaQuery.of(this).padding.bottom;
 }