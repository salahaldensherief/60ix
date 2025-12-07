part of '../shared_app_widgets.dart';

class PostsListVerticalPagination extends StatelessWidget {
  final PaginatedCubit<PostModel> cubit;
  final void Function(bool isFav, int count)? onToggleFavorite;

    PostsListVerticalPagination({
    super.key,
    required this.cubit,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return PaginatedListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.zero,

      cubit: cubit,
      itemBuilder: (context, model, index) {
        return PostCommunityCard(
          onClickDetailsPost: ()
          {
            //PostModel
            Modular.to.pushNamed(
              NavigatorKeys.COMMUNITY_KEY +
                  NavigatorKeys.COMMUNITY_POST_DETAILS_PAGE,
              arguments: model,
            ).then((value) {
              Modular.get<CommunityCubit>().refreshPosts();
            });
          },
            post: model);
      },
      loadingWidget: PostShimmerHelper.buildPostDetailsShimmerList(),
    );
  }
}


class PostsSliverListVerticalPagination extends StatelessWidget {
  final PaginatedCubit<PostModel> cubit;


  const PostsSliverListVerticalPagination({
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
          child: PostCommunityCard(post: model, forDetailsPage: false,),
        );
      },
      loadingWidget: ServiceShimmerHelper.buildListVertical(),
    );
  }
}
