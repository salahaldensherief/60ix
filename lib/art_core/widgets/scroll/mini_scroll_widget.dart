import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';

/// A mini scrollbar that shows the actual scroll position with a moving thumb
/// Similar to the design in the reference image
///
/// Features:
/// - Track width: 80.w, height: 4.h
/// - Thumb moves based on scroll position
/// - Minimum thumb width: 22.w
/// - Active color (thumb): primary
/// - Inactive color (track): getBgLColor
/// - Border radius: 4.r
///
/// Example usage:
/// dart
/// final ScrollController _scrollController = ScrollController();
///
/// Column(
///   children: [
///     SizedBox(
///       height: 200.h,
///       child: ListView.builder(
///         controller: _scrollController,
///         scrollDirection: Axis.horizontal,
///         itemCount: items.length,
///         itemBuilder: (context, index) => ItemCard(),
///       ),
///     ),
///     SizedBox(height: 8.h), // Spacing between cards and scrollbar
///     MiniScrollbar(controller: _scrollController),
///   ],
/// )
///
class MiniScrollbar extends StatefulWidget {
  final ScrollController controller;
  final double? trackWidth;
  final double? trackHeight;
  final double? minThumbWidth;
  final double? borderRadius;
  final Color? thumbColor;
  final Color? trackColor;

  const MiniScrollbar({
    super.key,
    required this.controller,
    this.trackWidth,
    this.trackHeight,
    this.minThumbWidth,
    this.borderRadius,
    this.thumbColor,
    this.trackColor,
  });

  @override
  State<MiniScrollbar> createState() => _MiniScrollbarState();
}

class _MiniScrollbarState extends State<MiniScrollbar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(MiniScrollbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onScroll);
      widget.controller.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final double trackWidth = widget.trackWidth ?? 50.w;
    final double trackHeight = widget.trackHeight ?? 4.h;
    final double minThumb = widget.minThumbWidth ?? 10.w;
    final double radius = widget.borderRadius ?? 4.r;

    // Build scrollbar with thumb (always show active thumb)
    Widget buildScrollbar({
      required double thumbWidth,
      required double thumbPosition,
    }) {
      return SizedBox(
        height: trackHeight,
        child: Center(
          child: Container(
            width: trackWidth,
            height: trackHeight,
            decoration: BoxDecoration(
              color: widget.trackColor ?? AppColors.textFieldLightBorderColor,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Stack(
              children: [
                PositionedDirectional(
                  top: 0,
                  bottom: 0,
                  start: thumbPosition,
                  child: Container(
                    width: thumbWidth,
                    decoration: BoxDecoration(
                      color: widget.thumbColor ?? AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Check if controller is attached and has valid position
    if (!widget.controller.hasClients) {
      // Show active scrollbar at start position
      return buildScrollbar(thumbWidth: minThumb, thumbPosition: 0);
    }

    // Try to get metrics safely
    try {
      final metrics = widget.controller.position;
      final viewport = metrics.viewportDimension;
      final maxScrollExtent = metrics.maxScrollExtent;

      // Check if viewport is valid
      if (viewport <= 0) {
        // Show active scrollbar at start position
        return buildScrollbar(thumbWidth: minThumb, thumbPosition: 0);
      }

      final double totalExtent = viewport + maxScrollExtent;

      // Calculate thumb width based on viewport ratio
      final double thumbWidth = totalExtent > 0
          ? (trackWidth * (viewport / totalExtent) * 0.6).clamp(
              minThumb,
              trackWidth,
            )
          : trackWidth;
      // Calculate scroll position fraction
      final double scrollFraction = maxScrollExtent > 0
          ? (widget.controller.offset / maxScrollExtent).clamp(0.0, 1.0)
          : 0.0;

      // Calculate thumb position
      final double freeSpace = trackWidth - thumbWidth;
      final double thumbPosition = freeSpace * scrollFraction;

      return buildScrollbar(
        thumbWidth: thumbWidth,
        thumbPosition: thumbPosition,
      );
    } catch (e) {
      // If any error occurs, show active scrollbar at start position
      return buildScrollbar(thumbWidth: minThumb, thumbPosition: 0);
    }
  }
}

/// Wrapper widget that combines a horizontal scrollable list with the mini scrollbar
/// Automatically adds spacing between the content and the scrollbar
///
/// Example usage:
/// dart
/// HorizontalScrollbarWrapper(
///   itemCount: items.length,
///   spacing: 10.h, // Spacing between cards and scrollbar
///   child: ListView.builder(
///     scrollDirection: Axis.horizontal,
///     itemCount: items.length,
///     itemBuilder: (context, index) => ItemCard(),
///   ),
/// )
///
class HorizontalScrollbarWrapper extends StatefulWidget {
  final Widget child;
  final int? itemCount;
  final int minItemsToShowScrollbar;
  final double? spacing;
  final ScrollController? externalController;

  const HorizontalScrollbarWrapper({
    super.key,
    required this.child,
    this.itemCount,
    this.minItemsToShowScrollbar = 2,
    this.spacing,
    this.externalController,
  });

  @override
  State<HorizontalScrollbarWrapper> createState() =>
      _HorizontalScrollbarWrapperState();
}

class _HorizontalScrollbarWrapperState
    extends State<HorizontalScrollbarWrapper> {
  late ScrollController _internalController;
  bool _isInternalController = false;

  @override
  void initState() {
    super.initState();
    if (widget.externalController == null) {
      _internalController = ScrollController();
      _isInternalController = true;
    } else {
      _internalController = widget.externalController!;
    }
  }

  @override
  void didUpdateWidget(HorizontalScrollbarWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.externalController != widget.externalController) {
      if (_isInternalController && oldWidget.externalController == null) {
        _internalController.dispose();
      }

      if (widget.externalController == null) {
        _internalController = ScrollController();
        _isInternalController = true;
      } else {
        _internalController = widget.externalController!;
        _isInternalController = false;
      }
    }
  }

  @override
  void dispose() {
    if (_isInternalController) {
      _internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shouldShowScrollbar =
        widget.itemCount == null ||
        widget.itemCount! > widget.minItemsToShowScrollbar;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: widget.child),
        if (shouldShowScrollbar) ...[
          SizedBox(height: widget.spacing ?? 8.h),
          MiniScrollbar(controller: _internalController),
        ],
      ],
    );
  }
}
