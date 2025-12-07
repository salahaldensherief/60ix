part of '../shared_app_widgets.dart';

class ServicesListHorizontal extends StatelessWidget {
  final List<ServiceModel> services;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  const ServicesListHorizontal({
    super.key,
    required this.services,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 267.h,
      child: ListView.separated(
        shrinkWrap: shrinkWrap,
        scrollDirection: Axis.horizontal,
        physics: physics ?? const AlwaysScrollableScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
        separatorBuilder: (_, _) => SizedBox(width: 12.w),
        itemCount: services.length,
        itemBuilder: (_, i) => SizedBox(width: 166.w, child: ServiceCard(model: services[i])),
      ),
    );
  }
}
