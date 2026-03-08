import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../extensions/padding.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_data.dart';

class CommentWidget extends StatelessWidget {
  final double width;
  final double height;
  final double padding;
  const CommentWidget({
    super.key, required this.width, required this.height, required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.textColorDarkPrimary,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(AssetsData.commentIcon).padAll(padding),
    );
  }
}
