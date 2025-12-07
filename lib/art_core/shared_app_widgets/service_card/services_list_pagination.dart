part of '../shared_app_widgets.dart';

class ServicesListHorizontalPagination extends StatelessWidget {
  final PaginatedCubit<ServiceModel> cubit;
  final void Function(bool isFav, int count)? onToggleFavorite;

  const ServicesListHorizontalPagination({
    super.key,
    required this.cubit,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      height: 267.h,

      child: PaginatedListView(
        scrollDirection: Axis.horizontal,
        cubit: cubit,
        itemBuilder: (context, model, index) {
          return ServiceCard(model: model, onToggleFavorite: onToggleFavorite);
        },
        loadingWidget: ServiceShimmerHelper.buildListHorizontal(),
      ),
    );
  }
}

class ServicesSliverListVerticalPagination extends StatelessWidget {
  final PaginatedCubit<ServiceModel> cubit;
  final void Function(bool isFav, int count)? onToggleFavorite;

  const ServicesSliverListVerticalPagination({
    super.key,
    required this.cubit,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return PaginatedSliverList(
      padding: EdgeInsets.all(12.0),
      cubit: cubit,
      emptyWidget: EmptyWidget(),
      itemBuilder: (context, model, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ServiceCard(model: model, onToggleFavorite: onToggleFavorite),
        );
      },
      loadingWidget: ServiceShimmerHelper.buildListVertical(),
    );
  }
}

class ServicesListVerticalPagination extends StatelessWidget {
  final PaginatedCubit<ServiceModel> cubit;
  final void Function(bool isFav, int count)? onToggleFavorite;
  final ScrollPhysics? physics;
  final bool? shrinkWrap;
  final ScrollController? scrollController;

  const ServicesListVerticalPagination({
    super.key,
    required this.cubit,
    this.onToggleFavorite,
    this.physics,
    this.shrinkWrap = false,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return PaginatedListView(
      scrollController: scrollController,
      cubit: cubit,
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemBuilder: (context, model, index) {
        return ServiceCard(model: model, onToggleFavorite: onToggleFavorite);
      },
      loadingWidget: ServiceShimmerHelper.buildListVertical(),
    );
  }
}

class ServicesGridViewPagination extends StatelessWidget {
  final PaginatedCubit<ServiceModel> cubit;
  final void Function(bool isFav, int count)? onToggleFavorite;
  final ScrollPhysics? physics;
  final bool? shrinkWrap;

  const ServicesGridViewPagination({
    super.key,
    required this.cubit,
    this.onToggleFavorite,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return PaginatedGridView(
      cubit: cubit,

      emptyWidget: EmptyWidget(),

      physics: physics,
      shrinkWrap: shrinkWrap,

      itemBuilder: (context, model, index) {
        return ServiceCard(model: model, onToggleFavorite: onToggleFavorite);
      },
      loadingWidget: ServiceShimmerHelper.buildGrid(),
    );
  }
}

class ServicesSliverGridPagination extends StatelessWidget {
  final PaginatedCubit<ServiceModel> cubit;
  final void Function(bool isFav, int count)? onToggleFavorite;

  const ServicesSliverGridPagination({
    super.key,
    required this.cubit,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return PaginatedSliverGrid(
      padding: EdgeInsets.all(8.0),
      cubit: cubit,
      emptyWidget: const EmptyWidget(),
      loadingWidget: ServiceShimmerHelper.buildGrid(isShrinkWrap: true),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.77,
      ),

      itemBuilder: (context, model, index) {
        return ServiceCard(model: model, onToggleFavorite: onToggleFavorite);
      },
    );
  }
}



