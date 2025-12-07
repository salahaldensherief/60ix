import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';

import '../text/app_text.dart';


class CustomExpansionWidget extends StatefulWidget {
  final String title;
  final String? titleWhenExpansionWidgetCollapse;
  final Widget body;
  final Widget? leadingWidget;
  final Widget? headerWidget;
  final bool? showExpansion;
  final double horizontalPadding;
  final double verticalPadding;
  final List<Widget> actions;
  final Color? bodyColor , headerColor;

  const CustomExpansionWidget({
    super.key,
    required this.title,
    required this.body,
    this.titleWhenExpansionWidgetCollapse,
    this.leadingWidget,
    this.showExpansion = true,
    this.headerWidget,
    this.horizontalPadding = 16.0,
    this.actions = const [],
    this.verticalPadding = 0.0,
    this.bodyColor,
    this.headerColor,
  });

  @override
  State<CustomExpansionWidget> createState() => _CustomExpansionWidgetState();
}

class _CustomExpansionWidgetState extends State<CustomExpansionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _iconTurns;

  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _iconTurns = Tween<double>(begin: 0.0, end: 0.5).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showExpansion == true) {
      return _buildExpansionWidget();
    } else {
      return _buildNormalContainer();
    }
  }

  Widget _buildExpansionWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _toggleExpansion,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: widget.horizontalPadding,
              ),
              decoration: BoxDecoration(
                color: widget.headerColor ?? AppColors.cardBackground,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: widget.headerWidget ??
                        Row(
                          children: [
                            AppText(
                              text: widget.title,
                              fontWeight: FontWeight.w400,
                            ),
                            const SizedBox(width: 20.0),
                            if (widget.titleWhenExpansionWidgetCollapse != null &&
                                widget.titleWhenExpansionWidgetCollapse!.isNotEmpty &&
                                !_expanded)
                              AnimatedSize(
                                duration: const Duration(milliseconds: 250),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppColors.borderColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: AppText(
                                    text: widget.titleWhenExpansionWidgetCollapse!,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                          ],
                        ),
                  ),


                  Row(
                    children: [
                      if (widget.actions.isNotEmpty) ...[
                        ...widget.actions,
                        const SizedBox(width: 20),
                      ],
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _animationController.value * 3.14,
                            child: Icon(
                              Icons.arrow_drop_down_outlined,
                              color: AppColors.customColor(lightColor: AppColors.grey.shade200),
                              size: 30,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizeTransition(
            sizeFactor: _animationController.drive(
              CurveTween(curve: Curves.fastOutSlowIn),
            ),
            axisAlignment: 1.0,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: widget.verticalPadding,
                horizontal: widget.horizontalPadding,
              ) ,
              margin: REdgeInsets.only(top: 10,bottom: 5,right: 2,left: 2),
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.bodyColor ?? Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: widget.body,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNormalContainer() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontalPadding,
        vertical: widget.horizontalPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.headerWidget ??
                  AppText(text: widget.title, fontWeight: FontWeight.w400),
              if (widget.leadingWidget != null) widget.leadingWidget!,
              if (widget.actions.isNotEmpty) ...[
                const Spacer(),
                ...widget.actions,
                const SizedBox(width: 20),
              ],
            ],
          ),
          const SizedBox(height: 8),
          widget.body,
        ],
      ),
    );
  }

  void _toggleExpansion() {
    setState(() {
      _expanded = !_expanded;
    });
    if (_expanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

