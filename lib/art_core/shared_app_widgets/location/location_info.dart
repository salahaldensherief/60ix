part of '../shared_app_widgets.dart';

class LocationInfo extends StatelessWidget {
  final String? cityName, distance;
  final LatLng? location;

  const LocationInfo({
    super.key,
    required this.cityName,
    required this.distance,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [AppStyles.shadowVLarge],
      ),
      child: Column(
        children: [
          _buildInfoRow(
            icon: AssetsManager.location,
            iconColor: AppColors.primary,
            key: translate(AppString.location),
            value: cityName ?? AppString.notAvailable.tr(),
          ),
          _buildInfoRow(
            icon: AssetsManager.distance,
            key: translate(AppString.distanceFromYou),
            value: distance ?? "0 km",
          ),
          SizedBox(height: 10.0),
          LocationOnMapWidget(location: location),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required String icon,
    required String key,
    required String value,
    Color? iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SvgIconWidget(
            path: icon,
            height: 24.h,
            width: 24.w,
            color: iconColor,
          ),
          SizedBox(width: 5.w),
          AppText(
            text: key,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.centerEnd,

              child: AppText(
                text: value,
                fontSize: 13.sp,
                color: AppColors.grey.shade300,
                maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
