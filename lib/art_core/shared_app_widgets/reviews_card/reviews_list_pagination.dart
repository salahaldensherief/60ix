part of '../shared_app_widgets.dart';


class ReviewsSliverListVerticalPagination extends StatelessWidget {
  final PaginatedCubit<ReviewsModel> cubit;


  const ReviewsSliverListVerticalPagination({
    super.key,
    required this.cubit,


  });

  @override
  Widget build(BuildContext context) {
    return PaginatedSliverList(
      padding: EdgeInsets.all(12.0),

      cubit: cubit,

      itemBuilder: (context, model, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ReviewsCard(model: model),
        );
      },
      loadingWidget: ServiceShimmerHelper.buildListVertical(),
    );
  }
}