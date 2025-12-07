part of '../shared_app_widgets.dart';

class CommentCard extends StatelessWidget {
  final CommentModel model;

    CommentCard({super.key, required this.model});
  final _cubit = Modular.get<PostDetailsCubit>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0.h, horizontal: 8.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColors.getBorderColor(context)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              AppImage(
                urlImg: model.creatorModel?.profile?.path ?? "",
                nameIfError: model.creatorModel?.name,
                useFirstNameIfError: true,
                height: 40.h,
                width: 40.w,
                borderRadius: 40.r,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 12.w),
              // Comment body
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Username
                   Row(
                     mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                     children: [
                       AppText(
                      text: model.creatorModel?.name ?? "",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),

                  if(!model.creatorModel!.isMyComment)...[
                    GestureDetector(
                      onTap: () {
                        context.showReportBottomSheet(
                          reportableType: ReportableType.comment,
                          postId: _cubit.state.post!.id,
                          onReport: (reasonId, additionalText) {
                            // Handle report
                          },
                        );
                      },
                      child: Icon(
                        Icons.more_horiz_rounded,
                        color: AppColors.grey.shade200,
                      ),
                    )
                  ]

                     ],
                   ),
                    // Comment
                    AppText(
                      text: model.comment ?? "",
                      fontSize: 12,
                      showAllTextOnTap: true,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor,
                      maxLines: 3,
                    ),

                    if (model.image?.path?.isNotEmpty == true) ...[
                      SizedBox(height: 4.h),
                      AppImage(
                        enableZoom: true,
                        urlImg: model.image!.path!,
                        height: 100.h,
                        width: 100.w,
                        fit: BoxFit.cover,
                      ),
                    ],
                    SizedBox(height: 4.h),
                    // Time and Like
                    Row(
                      children: [
                        AppText(
                          text:
                              model.createdAt?.timeAgoFromString(context) ?? "",
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                        SizedBox(width: 16.w),
                        FavoriteButton(
                          type: MainTypesEnum.comment,
                          modelId: model.id!,
                          showToast: false,
                          initialValue: model.isFavourite,
                          style: CommentFavoriteStyle(),
                        ),
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: AppText(
                        //     text: "Like",
                        //     fontSize: 10,
                        //     fontWeight: FontWeight.w500,
                        //     color: AppColors.grey.shade300,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
