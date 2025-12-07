import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/themes.dart';

class AppStyles {
  // Border Radius
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;

  // Paddings
  static const double paddingSmall =  8.0;
  static const double paddingMedium = 12.0;
  static const double paddingLarge = 16.0;
  static EdgeInsets defaultPaddingH = REdgeInsets.symmetric(horizontal: paddingLarge);
  static EdgeInsets defaultPaddingV = REdgeInsets.symmetric(vertical: paddingLarge);
  static EdgeInsets defaultPadding = REdgeInsets.all(paddingLarge);

  // Elevation
  static const double cardElevation = 4.0;

  // Opacity
  static const double disabledOpacity = 0.5;


  // Debounce duration
  static const Duration debounceDuration = Duration(milliseconds: 300);

  // BoxShadow
  // Subtle shadow for light elevation (e.g., small components, avatars)
  static BoxShadow get shadowSmall => BoxShadow(
    color: AppColors.blue.shade900.withValues(alpha: 0.08),
    offset: const Offset(0, 3),
    blurRadius: 16,
  );

  // Medium shadow for moderate elevation (e.g., cards, containers)
  static BoxShadow get shadowMedium => BoxShadow(
    color: Color(0x1A000000), // 10% opacity black
    offset: const Offset(-3, 3),
    blurRadius: 9.6,
  );
  // Large shadow for strong elevation (e.g., modals, dialogs, text fields)
  static BoxShadow get shadowLarge => BoxShadow(
    color: Color(0x1A000000), // 10% opacity black
    offset: const Offset(0, 3),
    blurRadius: 12.0,
  );

  //box-shadow: 0px 4px 25px 0px #0000001A;
  static BoxShadow get shadowVLarge => BoxShadow(
    color: Color(0x1A000000), // 10% opacity black
    offset: const Offset(0, 4),
    blurRadius: 25.0,
  );

}