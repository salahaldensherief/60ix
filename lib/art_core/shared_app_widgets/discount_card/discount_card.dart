part of '../shared_app_widgets.dart';

class DiscountCard extends StatelessWidget {
  final DiscountModel model;

  const DiscountCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final isRtl = AppConfig.isArabic;
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(
          NavigatorKeys.SERVICES_KEY + NavigatorKeys.DISCOUNT_DETAILS_PAGE,
          arguments: model.id,
        );
      },
      borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: REdgeInsets.symmetric(horizontal: 14,vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.getCardBackground(context),
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium),
          boxShadow: [AppStyles.shadowMedium],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.h,
          children: [
            Row(
              children: [
                SvgIconWidget(
                  path: AssetsManager.location,
                  color: AppColors.primary,
                  width: 14.w,
                  height: 14.h,
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: AppText(
                    text: "${model.service?.vendor?.name}",
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 15.w),

                Container(
                  padding: REdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  margin: REdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    color: model.status.color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: AppText(
                    text: model.status.title,
                    fontSize: 8.sp,
                    color: model.status.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Container(height: 1, width: 1.sw, color: AppColors.stroke),
            Row(
              spacing: 10.w,
              children: [
                Expanded(
                  child: AppText(
                    text: "${model.service?.name}",
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: AppText(
                    text: "${model.service?.discountValueText}",
                    fontSize: 10.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                AppText(
                  text: "${model.service?.price} ${model.service?.currency}",
                  fontSize: 12.sp,
                  color: AppColors.grey.shade300,
                  textDecoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w500,
                ),
                Spacer(),
                AppText(
                  text: "${model.service?.netPrice} ${model.service?.currency}",
                  fontSize: 12.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),

            Row(
              children: [
                if (model.status.isUsed) ...[
                  AppText(
                    text: "${AppString.usedOn.tr()} ${model.discountedAt?.formatedDateWithMonth}",
                    fontSize: 12.sp,
                    color: AppColors.grey.shade300,
                    fontWeight: FontWeight.w500,
                  ),
                  Spacer(),
                ],
                if (model.status.isCanceled) ...[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: AppString.reason.tr(),
                          fontSize: 12.sp,
                          color: AppColors.grey.shade300,
                          fontWeight: FontWeight.w500,
                        ),
                        AppText(
                          text: model.reason ?? AppString.noReasonProvided.tr(),
                          fontSize: 10.sp,
                          color: AppColors.grey.shade300,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
                TextButton.icon(
                  style: TextButton.styleFrom(
                    padding: REdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    alignment: isRtl ? Alignment.centerRight : Alignment.centerLeft,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  onPressed: () {
                    Modular.to.pushNamed(
                      NavigatorKeys.SERVICES_KEY + NavigatorKeys.SERVICES_DETAILS_PAGE,
                      arguments: model.service?.id,
                    );
                  },
                  label: AppText(
                    text: "${AppString.service.tr()} ${AppString.details.tr()}",
                    color: AppColors.grey.shade300,
                    fontSize: 12.sp,
                  ),
                  icon: Transform(
                    transform: Matrix4.rotationY(isRtl ? 3.1416 : 0),
                    child: SvgIconWidget(
                      path: AssetsManager.arrowRight,
                      color: AppColors.grey.shade300,
                      matchTextDirection: false,
                      width: 5.w,
                      height: 10.h,
                    ),
                  ),
                ),
              ],
            ),

            if (model.status.isNew) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      ViewFullImage.openPage(
                        context,
                        imageUrl: model.qrCode?.path ?? "",
                      );
                    },
                    child: Container(
                      padding: REdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(color: AppColors.blue),
                      ),
                      child: Row(
                        children: [
                          SvgIconWidget(
                            path: AssetsManager.qr,
                            color: AppColors.textColor,
                            height: 16.sp,
                            width: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          AppText(
                            text: AppString.viewQRCode.tr(),
                            fontSize: 10.sp,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: model.code ?? ""));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppString.copiedToClipboard.tr()),
                        ),
                      );
                    },
                    child: Container(
                      padding: REdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(color: AppColors.blue),
                      ),
                      child: Row(
                        children: [
                          SvgIconWidget(
                            path: AssetsManager.copy,
                            color: AppColors.textColor,
                            height: 16.sp,
                            width: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          AppText(
                            text: AppString.copyID.tr(),
                            fontSize: 10.sp,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
