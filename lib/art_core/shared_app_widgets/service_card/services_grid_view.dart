part of '../shared_app_widgets.dart';

class ServicesGridView extends StatelessWidget {
  final List<ServiceModel> services;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const ServicesGridView({
    super.key,
    this.services = const [],
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: physics ?? const AlwaysScrollableScrollPhysics(),
      shrinkWrap: shrinkWrap,
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: (1.sw / 2 - 24.w) / 238.h,
      ),
      itemCount: services.length,
      itemBuilder: (_, i) => ServiceCard(model: services[i]),
    );
  }
}
