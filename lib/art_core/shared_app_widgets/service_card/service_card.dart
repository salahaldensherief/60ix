part of '../shared_app_widgets.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel model;
  final void Function(bool isFav, int count)? onToggleFavorite;

  const ServiceCard({super.key, required this.model, this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    final bool isGuestUser = AppConfig.isGuestUser;

    return InkWell(
      onTap: () {
        Modular.to.pushNamed(
          NavigatorKeys.SERVICES_KEY + NavigatorKeys.SERVICES_DETAILS_PAGE,
          arguments: model.id,
        );
      },
      borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: AppColors.getCardBackground(context),
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium),
          boxShadow: [AppStyles.shadowMedium],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Favorite Icon
            Stack(
              clipBehavior: Clip.none,
              children: [
                _ServiceSlider(model: model),
                PositionedDirectional(
                  top: 6.h,
                  end: 6.w,
                  child: FavoriteButton(
                    type: MainTypesEnum.service,
                    modelId: model.id,
                    initialValue: model.isFavorite,
                    onToggle: onToggleFavorite,
                  ),
                ),
              ],
            ),
            // Content
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 10, vertical: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppText(
                          text: model.name ?? "",
                          maxLines: 1,
                          fontSize: 12.sp,
                          height: 1.3.h,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      SizedBox(width: 4.w),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 55.w,
                        ),
                        padding: REdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.getBorderColor(context),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: AppText(
                          text: model.category?.name ?? "",
                          fontSize: 8.sp,
                          height: 1.3.h,

                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    spacing: 6.w,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (model.vendor != null) ...[
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              AppImage(
                                urlImg: model.vendor?.vendorLogo?.path ?? "",
                                width: 12.w,
                                height: 12.h,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 4.w),
                              Expanded(
                                child: AppText(
                                  text: model.vendor?.name ?? "",
                                  maxLines: 1,
                                  fontSize: 12.sp,
                                  height: 1.3.h,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey.shade300,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      FittedBox(
                        child: Row(
                          children: [
                            SvgIconWidget(
                              path: AssetsManager.star,
                              width: 11.w,
                              height: 11.h,
                            ),
                            SizedBox(width: 2.w),
                            AppText(
                              text: "(${model.ratesAvgValue})",
                              fontSize: 10.sp,
                              height: 1.3.h,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey.shade300,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (model.isHasDiscount) ...[
                        Flexible(
                          flex: 3,
                          child: FittedBox(
                            child: Row(
                              spacing: 2.w,
                              children: [
                                AppText(
                                  text: "${model.currency} ${model.netPrice}",
                                  maxLines: 1,
                                  fontSize: 10.sp,
                                  color: AppColors.primary,
                                  height: 1.3.h,
                                  fontWeight: FontWeight.w700,
                                ),
                                AppText(
                                  text: "${model.price}",
                                  maxLines: 1,
                                  fontSize: 8.sp,
                                  height: 1.3.h,
                                  textDecoration: TextDecoration.lineThrough,
                                  color: AppColors.grey.shade300,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ] else ...[
                        Expanded(
                          flex: 3,
                          child: AppText(
                            text: "${model.currency} ${model.netPrice}",
                            maxLines: 1,
                            fontSize: 10.sp,
                            color: AppColors.primary,
                            height: 1.3.h,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                      if (model.vendor?.mainBranch?.distance != null) ...[
                        Flexible(
                          flex: 2,
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgIconWidget(
                                  path: AssetsManager.location,
                                  width: 14.w,
                                  height: 14.h,
                                ),
                                SizedBox(width: 2.w),
                                AppText(
                                  text:
                                      "${model.vendor?.mainBranch?.address?.location}",
                                  fontSize: 9.sp,
                                  height: 1.3.h,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey.shade300,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 10.h),
                    AppButton(
                      content: ButtonContent(label:model.hasClaim? AppString.showClaim.tr(): AppString.getDiscount.tr()),
                      behavior: ButtonBehavior.tap(
                        checkLogin: isGuestUser,
                        onTap: () {
                          if (!Modular.get<PreferenceManager>().isSubscribed) {
                            CheckSubscriptionDialog.show();
                            return;
                          }
                          if(model.hasClaim && model.discount != null){
                            Modular.to.pushNamed(
                                NavigatorKeys.SERVICES_KEY + NavigatorKeys.DISCOUNT_DETAILS_PAGE,
                                arguments: model.discount?.id
                            );
                          }else{
                            Modular.to.pushNamed(
                              NavigatorKeys.SERVICES_KEY + NavigatorKeys.SERVICES_DETAILS_PAGE,
                              arguments: model.id,
                            );
                          }
                        },
                      ),
                      buttonConfig: ButtonConfig(
                        height: 30.h,
                        borderRadius: 4.r,
                        backgroundColor:model.hasClaim ?AppColors.green: AppColors.primary,
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontsManager.fontFamily,
                        ),
                      ),
                    ),
                  ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceSlider extends StatefulWidget {
  final ServiceModel model;

  const _ServiceSlider({required this.model});

  @override
  State<_ServiceSlider> createState() => _ServiceSliderState();
}

class _ServiceSliderState extends State<_ServiceSlider> {
  int _currentIndex = 0;

  bool get isEmptyOrOneImage =>
      widget.model.gallery.isEmpty || widget.model.gallery.length == 1;

  String get _imgPath {
    if (widget.model.gallery.isNotEmpty) {
      return widget.model.gallery.first.path ?? "";
    } else {
      return widget.model.image?.path ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (isEmptyOrOneImage) ...[
            AppImage(
              urlImg: _imgPath,
              width: double.infinity,
              // height: 110.0,
              fit: BoxFit.fill,
            ),
          ] else ...[
            CarouselSlider(
              options: CarouselOptions(
                height: 110.0.h,
                autoPlay: widget.model.gallery.length > 1,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 20),
                autoPlayAnimationDuration: const Duration(seconds: 8),
                autoPlayCurve: Curves.easeInOutQuart,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, _) {
                  setState(() => _currentIndex = index);
                },
              ),
              items:
                  widget.model.gallery
                      .map(
                        (url) => AppImage(
                          urlImg: url.path ?? "",
                          width: double.infinity,
                          // height: 110.0,
                          fit: BoxFit.fill,
                        ),
                      )
                      .toList(),
            ),
            Positioned(
              bottom: 8.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.model.gallery.length, (index) {
                  bool isActive = _currentIndex == index;
                  return GestureDetector(
                    child: Container(
                      margin: REdgeInsetsDirectional.only(end: 5),
                      width: isActive ? 7.sp : 6.sp,
                      height: 6.sp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isActive
                                ? AppColors.primary
                                : AppColors.primary.shade100,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
