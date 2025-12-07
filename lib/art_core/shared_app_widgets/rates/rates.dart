part of '../shared_app_widgets.dart';

class Rates extends StatelessWidget {
  final double rateAvg , rateCount;

  const Rates({super.key, this.rateCount = 0.0, this.rateAvg = 0.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarWidget(rating: rateAvg, itemSize: 16.sp),
        SizedBox(width: 7.0.w),
        AppText(
          text: "($rateCount ${translate(AppString.of)} 5)",
          fontWeight: FontWeight.w500,
          color: AppColors.grey.shade300,
          fontSize: 14.sp,
        ),
      ],
    );
  }
}
