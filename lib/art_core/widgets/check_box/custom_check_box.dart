part of 'check_box.dart';

class CustomCheckBox extends StatefulWidget {
  final bool isChecked;
  final bool isLoading;
  final ValueChanged<bool> onChanged;
  final String? labelText;
  final double? fontSize;
  final Color? labelColor;
  final Color primaryColor;

  CustomCheckBox({
    super.key,
    required this.isChecked,
    this.isLoading = false,
    required this.onChanged,
    this.labelText,
    this.fontSize = 13.5,
    this.labelColor = AppColors.blue,
    Color? primaryColor,
  }) : primaryColor = primaryColor ?? AppColors.primary;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fillAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _fillAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.isChecked) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isChecked != oldWidget.isChecked) {
      if (widget.isChecked) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => widget.onChanged(!widget.isChecked),
          child: AnimatedBuilder(
            animation: _fillAnimation,
            builder: (context, child) {
              return widget.isLoading == true
                  ? LoadingView(radius: 8.0,)
                  : Container(
                    width: 18.0.h,
                    height: 18.0.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: widget.primaryColor,
                        width: 1.5,
                      ),
                      color:
                          widget.isChecked
                              ? widget.primaryColor.withValues(
                                alpha: _fillAnimation.value,
                              )
                              : Colors.transparent,
                    ),
                    child:
                        widget.isChecked
                            ? Center(
                              child: Icon(
                                Icons.check,
                                size: 13.0.sp,
                                color: Colors.white.withValues(
                                  alpha: _fillAnimation.value,
                                ),
                              ),
                            )
                            : null,
                  );
            },
          ),
        ),
        if (widget.labelText != null) ...[
          SizedBox(width: 4.0.w),
          AppText(
            text: widget.labelText!,
            fontSize: widget.fontSize,
            color: widget.labelColor,
          ),
        ],
      ],
    );
  }
}
