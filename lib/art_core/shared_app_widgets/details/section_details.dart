part of '../shared_app_widgets.dart';


class SectionDetails extends StatelessWidget {
  final String title;
  final String value;

  const SectionDetails({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Row(
          spacing: 6.w,
          children: [
            SvgIconWidget(path: AssetsManager.pet, height: 18.h, width: 18.w),
            AppText(
              text: title,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blue.shade500,
            ),
          ],
        ),
        AppText(
          text: value,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.blue.shade500,
          height: 1.4,
        ),
      ],
    );
  }
}

