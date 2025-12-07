import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/themes.dart';


class LoadingView extends StatelessWidget {
  final bool isButton;
  final Color? color;
  final double radius;

  const LoadingView({
    super.key,
    this.isButton = false,
    this.color,
    this.radius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isButton ? Colors.transparent : null,
      child: Center(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
              color == null ? AppColors.primary : color!,
              BlendMode.srcIn),
          child: CupertinoActivityIndicator(radius: radius),
        ),
      ),
    );
  }
}
