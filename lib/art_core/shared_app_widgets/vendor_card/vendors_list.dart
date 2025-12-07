part of '../shared_app_widgets.dart';


class VendorsList extends StatelessWidget {
  final List<VendorModel> vendors;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  const VendorsList({
    super.key,
    required this.vendors,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      itemCount: vendors.length,
      physics: physics ?? const AlwaysScrollableScrollPhysics(),
      padding: AppStyles.defaultPadding,
      separatorBuilder: (_, _) => SizedBox(height: 10.h),
      itemBuilder: (_, index) => VendorCard(vendor:vendors[index]),
    );
  }
}
