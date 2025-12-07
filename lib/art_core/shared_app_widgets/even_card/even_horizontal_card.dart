part of '../shared_app_widgets.dart';

class EvenHorizontalCard extends StatelessWidget {
  final EventModel model;
  const EvenHorizontalCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(
          NavigatorKeys.EVENTS_KEY + NavigatorKeys.EVENT_DETAILS_PAGE,
          arguments: model,
        );
      },
      child: Container(
        height: 130.h,
        padding: REdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusLarge),
          boxShadow: [AppStyles.shadowMedium],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.w,
          children: [

            Hero(
              tag: model.id,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  AppImage(
                    urlImg: model.image?.path ?? "",
                    height: 120.h,
                    width: 150.w,
                    fit: BoxFit.cover,
                    borderRadius: AppStyles.borderRadiusLarge,
                    errorImagePath: 'assets/images/fake_event_image.png',
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: REdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        boxShadow: [AppStyles.shadowSmall],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppStyles.borderRadiusLarge),
                          bottomRight: Radius.circular(AppStyles.borderRadiusLarge),
                        ),
                      ),
                      child: AppText(
                        text: model.category?.name ?? "",
                        fontSize: 9.5.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppText(
                    text: model.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: AppColors.blue.shade500,
                  ),
                  AppText(
                    text: model.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: AppColors.blue.shade500,
                  ),
                  Row(
                    spacing: 4.w,
                    children: [
                      SvgIconWidget(
                        path: AssetsManager.calendar,
                        height: 12.h,
                        width: 12.h,
                      ),
                      Flexible(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "From ",
                                style: TextStyle(
                                  fontSize: 9.sp,
                                  color: AppColors.blue.shade500,
                                ),
                              ),
                              TextSpan(
                                text: model.startAt.formatedDate,
                                style: TextStyle(
                                  fontSize: 9.sp,
                                  color: AppColors.blue.shade500,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: " to ",
                                style: TextStyle(
                                  fontSize: 9.sp,
                                  color: AppColors.blue.shade500,
                                ),
                              ),
                              TextSpan(
                                text: model.endAt.formatedDate,
                                style: TextStyle(
                                  fontSize: 9.sp,
                                  color: AppColors.blue.shade500,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (model.address != null) ...[
                    Row(
                      spacing: 4.w,
                      children: [
                        SvgIconWidget(
                          path: AssetsManager.location,
                          height: 12.h,
                          width: 12.h,
                        ),
                        AppText(
                          text: model.address?.city?.country?.name ?? model.address?.city?.name ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: AppColors.blue.shade500,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
