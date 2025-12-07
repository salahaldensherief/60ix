// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sixty_ix/modules/art_core/art_core.dart';
//
// import '../../core/constants/app_config.dart';
//
// class CustomCardShimmer extends StatelessWidget {
//   final double? width, height, radius;
//
//   final bool hasLeadingWidget, hasText, hasSearchIcon;
//
//   final String ? text;
//   const CustomCardShimmer({
//     super.key,
//     this.width,
//     this.height,
//     this.radius,
//     this.hasLeadingWidget = false,
//     this.hasText = false,
//     this.hasSearchIcon = false,
//     this.text,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final baseColor =
//         AppConfig.isDarkModeWithContext(context)
//             ? AppColors.grey.shade200
//             : AppColors.grey.shade100;
//     final highlightColor =
//         AppConfig.isDarkModeWithContext(context)
//             ? AppColors.white
//             : AppColors.grey.shade50;
//
//     return Stack(
//       children: [
//         Shimmer.fromColors(
//           baseColor: baseColor,
//           highlightColor: highlightColor,
//           child: Container(
//             width: width,
//             height: height,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(radius ?? 12.r),
//             ),
//           ),
//         ),
//         if(hasText)...[
//           PositionedDirectional(
//             top: 20,
//             end: 70,
//             child: Shimmer.fromColors(
//               baseColor: highlightColor,
//               highlightColor: baseColor,
//               child: AppText(text:  text ?? AppString.searchForServices.tr()),
//             ),
//           ),
//         ] ,
//
//
//         if(hasSearchIcon)...[
//           PositionedDirectional(
//             top: 20,
//             start: 10,
//             child: Shimmer.fromColors(
//               baseColor: highlightColor,
//               highlightColor: baseColor,
//               child: SvgIconWidget(path: AssetsManager.search),
//             ),
//           ),
//         ] ,
//
//
//
//         if(hasLeadingWidget)...[
//           PositionedDirectional(
//             top: 10,
//             end: 10,
//             child: Shimmer.fromColors(
//               baseColor: highlightColor,
//               highlightColor: baseColor,
//               child: Container(
//                 width:   40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(radius ?? 12.r),
//                 ),
//               ),
//             ),
//           ),
//         ]
//       ],
//     );
//   }
// }
