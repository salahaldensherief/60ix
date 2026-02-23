import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/utils/assets_data.dart';

class ProfileAnimatedFlip extends StatefulWidget {
  const ProfileAnimatedFlip({
    super.key,
    required this.imagePath,
    required this.rank,
    required this.size,
  });
  final String imagePath;
  final String rank;
  final double size;
  @override
  State<ProfileAnimatedFlip> createState() => _ProfileAnimatedFlipState();
}

class _ProfileAnimatedFlipState extends State<ProfileAnimatedFlip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _startAutoFlip();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAutoFlip() async {
    while (mounted) {
      await _controller.forward();
      await Future.delayed(const Duration(seconds: 2));
      await _controller.reverse();
      await Future.delayed(const Duration(seconds: 3));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final angle = _controller.value * pi;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle),
          child: angle < pi / 2
              ? _frontAvatar()
              : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: _backRank(),
                ),
        );
      },
    );
  }

  Widget _frontAvatar() {
    return CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(widget.imagePath),
    );
  }

  Widget? _backRank() {
    return Image.asset(widget.rank, width: 36.5.w);
  }
}
