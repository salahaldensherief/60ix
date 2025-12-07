part of 'dropdown.dart';

class CustomMultiDropdown<T> extends StatefulWidget {
  final String? floatingLabelText;
  final String? hintText;
  final List<T> items;
  final List<T> selectedValues;
  final ValueChanged<List<T>>? onChanged;
  final Color? textColor;
  final String Function(T)? itemToString;
  final bool isLoading;

  const CustomMultiDropdown({
    super.key,
    required this.items,
    required this.selectedValues,
    this.onChanged,
    this.floatingLabelText,
    this.hintText,
    this.textColor,
    this.itemToString,
    this.isLoading = false,
  });

  @override
  State<CustomMultiDropdown<T>> createState() => _CustomMultiDropdownState<T>();
}

class _CustomMultiDropdownState<T> extends State<CustomMultiDropdown<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool isOpen = false;
  late List<T> _tempSelectedValues;

  @override
  void initState() {
    super.initState();
    _tempSelectedValues = List<T>.from(widget.selectedValues);
  }

  void _toggleDropdown() {
    if (isOpen) {
      _closeDropdown();
    } else {
      _tempSelectedValues = List<T>.from(
        widget.selectedValues,
      ); // sync with parent
      _openDropdown();
    }
  }

  void _openDropdown() {
    if (_overlayEntry != null) return;
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      isOpen = true;
    });
  }

  void _closeDropdown() {
    if (!mounted) return;
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) {
      setState(() {
        isOpen = false;
      });
    }
  }

  void _rebuildOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            // Tap-outside layer
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _closeDropdown,
              ),
            ),
            // Dropdown positioned under the widget
            Positioned(
              width: size.width,
              left: offset.dx,
              top: offset.dy + size.height,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, size.height + 8.h),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8.r),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 250.h),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children:
                          widget.items.map((item) {
                            final isSelected = _tempSelectedValues.contains(
                              item,
                            );
                            final label =
                                widget.itemToString?.call(item) ??
                                item.toString();
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    _tempSelectedValues.remove(item);
                                  } else {
                                    _tempSelectedValues.add(item);
                                  }
                                  widget.onChanged?.call(_tempSelectedValues);
                                  _rebuildOverlay(); // to update UI
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                child: Row(
                                  children: [
                                    CustomCheckBox(
                                      isChecked: isSelected,
                                      onChanged: (checked) {
                                        setState(() {
                                          if (checked) {
                                            _tempSelectedValues.add(item);
                                          } else {
                                            _tempSelectedValues.remove(item);
                                          }
                                          widget.onChanged?.call(
                                            _tempSelectedValues,
                                          );
                                          _rebuildOverlay();
                                        });
                                      },
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(child: AppText(text: label)),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget.isLoading) {
      true => DropDownShimmer(),
      false => CompositedTransformTarget(
        link: _layerLink,
        child: GestureDetector(
          onTap: _toggleDropdown,
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: widget.floatingLabelText,
              filled: true,
              fillColor: AppColors.cardBackground,
              contentPadding: REdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              border: border,
              enabledBorder: border,
              focusedBorder: border,
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppText(
                    text:
                        widget.selectedValues.isEmpty
                            ? (widget.hintText ?? 'Select options')
                            : widget.selectedValues
                                .map(
                                  (e) =>
                                      widget.itemToString?.call(e) ??
                                      e.toString(),
                                )
                                .join(', '),
                    color:
                        widget.selectedValues.isEmpty
                            ? AppColors.grey.shade300
                            : widget.textColor ?? Colors.black,
                    fontSize: 14.sp,
                    maxLines: 1,
                  ),
                ),
                Icon(
                  isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    };
  }

  InputBorder get border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(7.r),
    borderSide:  BorderSide(color: AppColors.borderColor),
  );
}
