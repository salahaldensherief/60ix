part of '../request_ui_helper.dart';

class ErrorWidget extends StatelessWidget {
  final String? errorMessage;
  final bool noInternet;

  const ErrorWidget({super.key, this.errorMessage, this.noInternet = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: REdgeInsets.symmetric(horizontal: AppStyles.paddingLarge),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 1.sh * 0.3),
            if (noInternet) ...[
              Icon(
                Icons.signal_wifi_statusbar_connected_no_internet_4_outlined,
                size: 80.sp,
                color: AppColors.red,
              ),
            ] else ...[
              SvgIconWidget(
                path: AssetsManager.about,
                color: AppColors.red,
                width: 80.sp,
                height: 80.sp,
              ),
            ],

            SizedBox(height: 10.h),
            AppText(
              text:
                  errorMessage ??
                  (noInternet
                      ? AppString.noInternetConnection.tr()
                      : AppString.anErrorOccurred.tr()),
              fontSize: 13.5.sp,
              textAlign: TextAlign.center,
              color: AppColors.red,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
