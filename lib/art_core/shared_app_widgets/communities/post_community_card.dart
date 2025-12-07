part of '../shared_app_widgets.dart';

class PostCommunityCard extends StatelessWidget {
  final PostModel post;
  final bool forDetailsPage;
  final void Function()? onClickEditPost;
  final void Function()? onClickDetailsPost;

  const PostCommunityCard({
    super.key,
    required this.post,
    this.forDetailsPage = false,
    this.onClickEditPost,
    this.onClickDetailsPost,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onClickDetailsPost ??
          () {
            if (!forDetailsPage) {
              Modular.to.pushNamed(
                NavigatorKeys.COMMUNITY_KEY +
                    NavigatorKeys.COMMUNITY_POST_DETAILS_PAGE,
                arguments: post,
              );
            }
          },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: forDetailsPage ? null : Border.all(color: AppColors.stroke),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image
                GestureDetector(
                  onTap: () {
                    if (post.isMyPost) {
                      // should navigate to my Communities page
                      Modular.to.pushNamed(
                        NavigatorKeys.ACCOUNT_KEY +
                            NavigatorKeys.EDIT_INFO_PAGE,
                        arguments: post.createdBy!.id,
                      );
                    } else {
                      // log("post.isShowProfile ${post.isShowProfile} type ${post.type}");
                      if (post.isShowProfile!) {
                        Modular.to.pushNamed(
                          NavigatorKeys.VENDOR_KEY +
                              NavigatorKeys.VENDOR_PROFILE_PAGE,
                          arguments: post.createdBy!.id,
                        );
                      }
                    }
                  },
                  child: AppImage(
                    urlImg: post.createdBy?.profileImage?.path ?? '',
                    height: 45.h,
                    width: 45.w,
                    fit: BoxFit.fill,
                    borderRadius: 55.r,
                    useFirstNameIfError: true,
                    nameIfError: post.createdBy?.name,
                  ),
                ),

                SizedBox(width: 8.w),

                // name  - hashtag - time
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: post.createdBy?.name ?? '',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                      AppText(
                        // text: '@norhanali15 . ${post.createdAt?.timeAgoFromString(context) ?? ''}',
                        text: post.createdAt?.timeAgoFromString(context) ?? '',
                        fontWeight: FontWeight.w400,

                        color: AppColors.grey.shade200,
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    if (post.createdBy?.isAdmin == true ||
                        post.createdBy?.isVendor == true) ...[
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: AppText(
                          text: post.createdBy?.typeLabel?.toUpperCase() ?? '',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: post.createdBy?.isAdmin == true
                              ? AppColors.primary
                              : AppColors.green,
                        ),
                      ),
                    ],

                    GestureDetector(
                      onTap: () {
                        CustomBottomSheet.show(
                          enabledFiledButton: false,
                          enabledOutlinedButton: false,
                          backgroundColor: AppColors.cardBackground,
                          content: CommunityOptionsBottomSheetContent(
                            isMyPost: post.isMyPost,
                            isAdmin: post.createdBy?.isAdmin == true,
                            onCopyLink: () async {
                              Modular.to.pop();
                              ShareHelper.share(
                                type: DLType.post,
                                id: post.id.toString(),
                                description: "${post.content}",
                              );
                            },
                            onDeletePost: () {
                              DeletePostDialog.show(
                                context,
                                postId: post.id,
                                forDetailsPage: forDetailsPage,
                              );
                            },
                            onEditPost:
                                onClickEditPost ??
                                () {
                                  Modular.to.pop();
                                  Modular.to.pushNamed(
                                    NavigatorKeys.COMMUNITY_KEY +
                                        NavigatorKeys.COMMUNITY_EDIT_POST_PAGE,
                                    arguments: post,
                                  );
                                },
                            onReportPost: () {
                              Modular.to.pop();
                              context.showReportBottomSheet(
                                reportableType: ReportableType.post,
                                postId: post.id,
                                onReport: (reasonId, additionalText) {
                                  // Handle report
                                },
                              );
                            },
                          ),
                        );
                      },
                      child: Icon(
                        Icons.more_horiz_rounded,
                        color: AppColors.grey.shade200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),

            /// Content
            AppText(
              text: post.content ?? '',
              fontWeight: FontWeight.w400,

              // color: AppColors.grey.shade300,
              fontSize: 12.sp,
              maxLines: forDetailsPage ? null : 3,
              overflow: forDetailsPage
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              showAllTextOnTap: forDetailsPage ? false : true,
            ),

            if (post.hashtags != null && post.hashtags.isNotNullOrEmptyX) ...[
              Wrap(
                spacing: 10.w,
                children: List.generate(
                  post.hashtags?.length ?? 0,
                  (index) => AppText(
                    text: '#${post.hashtags?[index].name}'.trim(),
                    color: AppColors.primary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],

            SizedBox(height: post.images.isNotEmpty ? 12.h : 0),

            ListGalleryImages(
              images: post.images.map((e) => e.path ?? '').toList(),
            ),

            const SizedBox(height: 12),

            /// Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FavoriteButton(
                  type: MainTypesEnum.post,
                  modelId: post.id,
                  showToast: false,
                  initialValue: post.isFavourite,
                  initialCount: post.favouritesCount,
                  style: PostFavoriteStyle(),
                ),

                _iconWithLabel(
                  icon: AssetsManager.commentIcon,
                  label:
                      "${post.commentsCount} ${AppString.comments.tr()}", //'4 Comment',
                ),
                _iconWithLabel(
                  icon: AssetsManager.shareIcon,
                  label: AppString.share.tr(),
                  onTap: () {
                    ShareHelper.share(
                      type: DLType.post,
                      id: post.id.toString(),
                      description: "${post.content}",
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconWithLabel({
    required String icon,
    String? label,
    Color? color,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgIconWidget(path: icon),
          if (label != null) ...[
            SizedBox(width: 4.w),
            AppText(
              text: label,
              color: color ?? AppColors.textColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
            ),
          ],
        ],
      ),
    );
  }
}
