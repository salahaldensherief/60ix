part of '../shared_app_widgets.dart';

class LocationOnMapWidget extends StatelessWidget {
  final LatLng? location;

  const LocationOnMapWidget({super.key, this.location});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (location != null) LaunchHelper.openMap(location!);
        Log.error("LocationOnMap : Location is $location");
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.customColor(
            lightColor: AppColors.borderInputField,
            darkColor: AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: translate(AppString.locationOnMap),
                color: AppColors.textColor,
              ),
              SvgIconWidget(path: AssetsManager.marker),
            ],
          ),
        ),
      ),
    );
  }
}
