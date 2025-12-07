import 'package:flutter/material.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/core/translate/translate.dart';

class CommunityOptionsBottomSheetContent extends StatelessWidget {
  final bool isMyPost;
  final bool isAdmin;

  final VoidCallback? onCopyLink;
  final VoidCallback? onReportPost;
  final VoidCallback? onEditPost;
  final VoidCallback? onDeletePost;

  const CommunityOptionsBottomSheetContent({
    super.key,
    required this.isMyPost,
    required this.isAdmin,
    this.onCopyLink,
    this.onReportPost,
    this.onEditPost,
    this.onDeletePost,
  });

  @override
  Widget build(BuildContext context) {
    final options = <_OptionItem>[
      _OptionItem(
        icon: AssetsManager.copyLink,
        title: translate(AppString.copyLink),
        onTap: onCopyLink,
      ),
      if (!isMyPost && !isAdmin)
        _OptionItem(
          icon: AssetsManager.reportPost,
          title: translate(AppString.reportPost),
          onTap: onReportPost,
        ),
      if (isMyPost) ...[
        _OptionItem(
          icon: AssetsManager.editPost,
          title: translate(AppString.editPost),
          onTap: onEditPost,
        ),
        _OptionItem(
          icon: AssetsManager.deletePost,
          title: translate(AppString.deletePost),
          onTap: onDeletePost,
        ),
      ],
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: List.generate(options.length * 2 - 1, (index) {
          if (index.isOdd) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(color: AppColors.grey.shade50),
            );
          }

          final item = options[index ~/ 2];
          return _buildItem(
            icon: item.icon,
            title: item.title,
            onTap: item.onTap,
          );
        }),
      ),
    );
  }

  Widget _buildItem({
    required String icon,
    required String title,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Row(
        children: [
          SvgIconWidget(path: icon),
          const SizedBox(width: 6.0),
          AppText(text: title),
        ],
      ),
    );
  }
}

class _OptionItem {
  final String icon;
  final String title;
  final void Function()? onTap;

  _OptionItem({
    required this.icon,
    required this.title,
    this.onTap,
  });
}
