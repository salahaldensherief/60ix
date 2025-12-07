part of 'radio_button.dart';

class CustomRadioButton<T> extends StatefulWidget {
  final T value;
  final T? selectedValue;
  final ValueChanged<T> onChanged;
  final String? labelText;
  final double? fontSize;
  final Color? labelColor;
  final Color primaryColor;

  CustomRadioButton({
    super.key,
    required this.value,
    this.selectedValue,
    required this.onChanged,
    this.labelText,
    this.fontSize = 16,
    Color? labelColor,
    Color? primaryColor,
  }) : labelColor = labelColor ?? AppColors.blue.shade900,
       primaryColor = primaryColor ?? AppColors.primary;

  @override
  State<CustomRadioButton<T>> createState() => _CustomRadioButtonState<T>();
}

class _CustomRadioButtonState<T> extends State<CustomRadioButton<T>>
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

    if (widget.value == widget.selectedValue) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(CustomRadioButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedValue != oldWidget.selectedValue) {
      if (widget.value == widget.selectedValue) {
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
    final isSelected = widget.value == widget.selectedValue;

    return GestureDetector(
      onTap: () => widget.onChanged(widget.value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _fillAnimation,
            builder: (context, child) {
              return Container(
                width: 22.0.h,
                height: 22.0.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: widget.primaryColor, width: 2.2),
                ),
                child: Center(
                  child:
                      isSelected
                          ? Container(
                            width: 16.5.h,
                            height: 16.5.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.primaryColor.withValues(
                                alpha: _fillAnimation.value,
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                          )
                          : null,
                ),
              );
            },
          ),
          if (widget.labelText != null) ...[
            SizedBox(width: 12.0.w),
            Text(
              widget.labelText!,
              style: TextStyle(
                fontSize: widget.fontSize,
                color: widget.labelColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
