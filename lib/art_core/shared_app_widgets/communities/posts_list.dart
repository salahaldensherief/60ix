part of '../shared_app_widgets.dart';

class PostsListVertical extends StatelessWidget {
  final List<PostModel> posts;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const PostsListVertical({
    super.key,
    required this.posts,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: posts.length,
      separatorBuilder: (_, __) => SizedBox(height: 10.h),
      itemBuilder: (_, index) => PostCommunityCard(post: posts[index]),
    );
  }
}
