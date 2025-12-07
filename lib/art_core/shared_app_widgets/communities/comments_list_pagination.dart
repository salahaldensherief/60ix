part of '../shared_app_widgets.dart';

class CommentsListVerticalPagination extends StatelessWidget {
  final PaginatedCubit<CommentModel> cubit;
  final void Function(bool isFav, int count)? onToggleFavorite;

  const CommentsListVerticalPagination({
    super.key,
    required this.cubit,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return PaginatedListView(
      enableRefresh: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(right: 16.0,left: 16.0,bottom: 100.h),
      emptyWidget:  EmptyWidget(message: AppString.noCommentsYet.tr()),
      cubit: cubit,
      itemBuilder: (context, model, index) {
        return CommentCard(model: model);
      },
      loadingWidget: PostShimmerHelper.buildPostDetailsShimmerList(),
    );
  }
}


