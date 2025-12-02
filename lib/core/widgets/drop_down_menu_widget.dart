// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ix/core/utils/font_styles.dart';
//
// import '../utils/app_colors.dart';
//
// class DropDownMenuWidget extends StatelessWidget {
//   final String? hintText;
//   final List<DropdownMenuEntry<T>> dropdownMenuEntries;
//   DropDownMenuWidget({
//     super.key, this.hintText, required this.dropdownMenuEntries,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (hintText != null) ...[
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: Text(hintText!, style: TextStyles.font14MediumGray),
//           ),
//         ],
//         DropdownMenu(
//             width: double.infinity,
//             inputDecorationTheme: InputDecorationTheme(
//               fillColor: AppColors.white10,
//               filled: true,
//
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.r),
//                 borderSide: BorderSide(
//                   color: AppColors.white20,
//                 ),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.r),
//                 borderSide: BorderSide(
//                   color: AppColors.white20,
//                 ),
//               ),
//             ),
//             menuStyle: MenuStyle(
//                 fixedSize: WidgetStatePropertyAll(Size(400.w, 40.h))
//             ),
//             dropdownMenuEntries: dropdownMenuEntries),
//       ],
//     );
//   }
// }
