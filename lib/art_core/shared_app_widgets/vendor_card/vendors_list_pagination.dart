
part of '../shared_app_widgets.dart' ;


class VendorsListHorizontalPagination extends StatelessWidget {
  final PaginatedCubit<VendorModel> cubit;
  final void Function(bool isFav, int count)? onToggleFavorite;

  const VendorsListHorizontalPagination({
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
          return VendorCard(vendor: model, onToggleFavorite: onToggleFavorite);
        },
        loadingWidget: VendorShimmerHelper.buildListHorizontal(),
      ),
    );
  }
}

class VendorsListVerticalPagination extends StatelessWidget {
  final PaginatedCubit<VendorModel> cubit;
  final void Function(bool isFav, int count)? onToggleFavorite;

  const VendorsListVerticalPagination({
    super.key,
    required this.cubit,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return PaginatedListView(
      cubit: cubit,
      itemBuilder: (context, model, index) {
        return VendorCard(vendor: model, onToggleFavorite: onToggleFavorite);
      },
      loadingWidget: VendorShimmerHelper.buildListVertical(),
    );
  }
}

class VendorsGridViewPagination extends StatelessWidget {
  final PaginatedCubit<VendorModel> cubit;
  final void Function(bool isFav, int count)? onToggleFavorite;

  const VendorsGridViewPagination({
    super.key,
    required this.cubit,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return PaginatedGridView(
      cubit: cubit,
      itemBuilder: (context, model, index) {
        return VendorCard(vendor: model, onToggleFavorite: onToggleFavorite);
      },
      loadingWidget: VendorShimmerHelper.buildGrid(),
    );
  }
}
