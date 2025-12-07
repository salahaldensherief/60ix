part of '../request_ui_helper.dart';

class EmptyWidget extends StatelessWidget {
  final String? message;
  const EmptyWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(height: 1.sh * 0.3),
          RSizedBox(height: 30.0,),
          Icon(Icons.inbox, size: 80.sp, color: AppColors.red),
          SizedBox(height: 10.h),
          AppText(
            text: message ?? AppString.noDataAvailable.tr(),
            fontSize: 15.sp,
            textAlign: TextAlign.center,
            color: AppColors.customColor(lightColor: AppColors.blue ,darkColor: AppColors.white),
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
