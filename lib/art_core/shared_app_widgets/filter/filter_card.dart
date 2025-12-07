part of '../shared_app_widgets.dart';

class FlitterCard extends StatelessWidget {
  final Widget child;
  const FlitterCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.white,
        boxShadow: [AppStyles.shadowSmall],
      ),
      child: child,
    );
  }
}
