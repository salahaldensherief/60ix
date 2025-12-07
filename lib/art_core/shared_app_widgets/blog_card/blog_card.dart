// part of '../shared_app_widgets.dart';
//
// class BlogCard extends StatelessWidget {
//   final BlogModel model;
//
//   const BlogCard({super.key, required this.model});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Modular.to.pushNamed(
//           NavigatorKeys.BLOGS_KEY + NavigatorKeys.BLOG_DETAILS_PAGE,
//           arguments: model,
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(AppStyles.borderRadiusLarge),
//           boxShadow: [AppStyles.shadowMedium],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           spacing: 2.h,
//           children: [
//             Padding(
//               padding: REdgeInsets.all(5),
//               child: Hero(
//                 tag: model.id,
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     AppImage(
//                       urlImg: model.image?.path ?? "",
//                       width: double.infinity,
//                       height: 150.h,
//                       fit: BoxFit.cover,
//                       borderRadius: AppStyles.borderRadiusLarge,
//                     ),
//                     Positioned(
//                       bottom: -12.h,
//                       right: 8.w,
//                       child: Container(
//                         height: 33.w,
//                         width: 33.w,
//                         padding: REdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: AppColors.white,
//                           shape: BoxShape.circle,
//                           boxShadow: [AppStyles.shadowSmall],
//                         ),
//                         child: Icon(
//                           model.isFavorite
//                               ? Icons.favorite
//                               : Icons.favorite_border,
//                           size: 16.sp,
//                           color:
//                               model.isFavorite
//                                   ? AppColors.red
//                                   : AppColors.blue.shade500,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 0,
//                       left: 0,
//                       child: Container(
//                         padding: REdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: AppColors.blue,
//                           boxShadow: [AppStyles.shadowSmall],
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(AppStyles.borderRadiusLarge),
//                             bottomRight: Radius.circular(AppStyles.borderRadiusLarge),
//                           ),
//                         ),
//                         child: AppText(
//                           text: model.category?.name ?? "",
//                           fontSize: 10.sp,
//                           color: AppColors.white,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             Expanded(
//               child: Padding(
//                 padding: REdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     AppText(
//                       text: model.title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 14.sp,
//                       color: AppColors.blue.shade500,
//                     ),
//                     AppText(
//                       text: model.content,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       fontSize: 12.sp,
//                       color: AppColors.blue.shade500,
//                       fontWeight: FontWeight.w400,
//                       height: 1.2,
//                     ),
//                     Row(
//                       children: [
//                         Flexible(
//                           child: AppText(
//                             text: "Read more...",
//                             overflow: TextOverflow.ellipsis,
//                             fontSize: 10.sp,
//                             fontWeight: FontWeight.w700,
//                             color: AppColors.blue,
//                           ),
//                         ),
//                         SizedBox(width: 2.w),
//                         Icon(
//                           Icons.arrow_forward_ios,
//                           size: 8.sp,
//                           color: AppColors.blue,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
