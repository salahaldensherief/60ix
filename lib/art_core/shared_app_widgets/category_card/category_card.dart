part of '../shared_app_widgets.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88.w,
      child: InkWell(
        onTap: () {
          Modular.to.pushNamed(
            NavigatorKeys.SERVICES_KEY + NavigatorKeys.SERVICES_CATEGORY_PAGE,
            arguments: ServicesListParams(
              categoryId: category.id,
              categoryName: category.name,
            ),
          );
        },
        borderRadius: BorderRadius.circular(12.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 88.w,
              height: 88.h,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.stroke),
                boxShadow: [AppStyles.shadowVLarge],
              ),
              child: AppImage(
                urlImg: category.image?.path ?? "",
                width: 88.w,
                height: 88.h,
                fit: BoxFit.fill,
                backgroundColor: AppColors.white,
              ),
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: AppText(
                text: category.name,
                fontSize: 12.sp,
                maxLines: 2,
                height: 1.2.h,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
