part of '../shared_app_widgets.dart';


class FilterFooter extends StatelessWidget{
  final VoidCallback onApply;
  final VoidCallback onReset;
  const FilterFooter({super.key, required this.onApply, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom:  0,
      child: Container(
        padding: REdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          boxShadow: [
            BoxShadow(
              color: AppColors.blue.shade500.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Row(
              spacing: 10.w,
              children: [
                Expanded(
                  child: AppButton(
                    behavior: TapBehavior(onTap: onReset),
                    buttonConfig: ButtonConfig.secondary(),
                    content: ButtonContent(label: AppString.reset.tr()),
                  ),
                ),
                Expanded(
                  child: AppButton(
                    behavior: TapBehavior(onTap: onApply),
                    buttonConfig: ButtonConfig(),
                    content: ButtonContent(label: AppString.apply.tr()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
