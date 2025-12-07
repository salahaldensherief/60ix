part of 'text_fields.dart';

class AppDropdownTextField<T> extends StatefulWidget {
  final T? initialValue;
  final ValueChanged<T?>? onChanged;
  final String? errorText;
  final String label;
  final String? hint;
  final TextStyle? hintStyle, textStyle, labelStyle;
  final bool readOnly;
  final String? Function(String?)? validator;
  final bool isRequired;
  final List<T> items;
  final String Function(T)? itemToString;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Color? fillColor;
  final bool filled;
  final bool enableBorder;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final bool? makeOnTap;


  const AppDropdownTextField({
    super.key,
    this.readOnly = false,
    this.onTap,
    this.hint,
    this.makeOnTap = false,
    required this.label,
    this.suffixIcon,
    this.prefixIcon,
    this.isRequired = false,
    this.validator,
    this.onChanged,
    this.errorText,
    this.initialValue,
    this.itemToString,
    this.hintStyle,
    this.fillColor,
    this.filled = true,
    this.enableBorder = true,
    this.contentPadding,
    this.textStyle,
    this.labelStyle,
    this.margin,
    required this.items,

  });

  @override
  State<AppDropdownTextField<T>> createState() =>
      _AppDropdownTextFieldState<T>();
}

class _AppDropdownTextFieldState<T> extends State<AppDropdownTextField<T>> {
  T? _selectedValue;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _fieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  void _toggleDropdown() {
    if (widget.makeOnTap == true) {
      widget.onTap?.call();
      return;
    }

    if (_overlayEntry != null) {
      _closeDropdown();
      return;
    }

    final RenderBox renderBox =
        _fieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 22.0),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    decoration: BoxDecoration(
                      color: AppColors.borderInputField,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      children:
                          widget.items.map<Widget>((T item) {
                            return ListTile(
                              title: Text(
                                widget.itemToString != null
                                    ? widget.itemToString!(item)
                                    : item.toString(),
                                style:
                                    widget.textStyle ??
                                    TextStyle(
                                      fontSize: 16,
                                      color: AppColors.grey[100],
                                    ),
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedValue = item;
                                });
                                widget.onChanged?.call(item);
                                _closeDropdown();
                              },
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _closeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      children: [
                        if (widget.prefixIcon != null)
                          Padding(
                            padding: REdgeInsets.only(right: 6.0),
                            child: Icon(
                              widget.prefixIcon,
                              color:  AppColors.iconColor,
                              size: 20,
                            ),
                          ),
                        Text(
                          widget.label,
                          style:
                              widget.labelStyle ??
                               TextStyle(
                                fontSize: 16,
                                color:  AppColors.textColor,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        if (widget.isRequired) ...[
                          const SizedBox(width: 5),
                          const Text(
                            "*",
                            style: TextStyle(color: AppColors.red),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                     GestureDetector(
                       onTap: widget.readOnly ? null : _toggleDropdown,
                       child: Container(
                         key: _fieldKey,
                         margin: widget.margin ?? EdgeInsets.zero,
                         padding: EdgeInsets.all(10),
                         decoration: BoxDecoration(
                           border: Border.all(color:  AppColors.shadowColor),
                           color: widget.fillColor ?? AppColors.borderInputField,
                           borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium.r),
                           boxShadow: [
                             BoxShadow(
                               color: const Color.fromRGBO(0, 0, 0, 0.05),
                               blurRadius: 8,
                               offset: const Offset(0, 1),
                             ),
                           ],
                           // border:
                           // widget.enableBorder && widget.errorText != null
                           //     ? Border.all(color: AppColors.red, width: 1.0)
                           //     : null,
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Padding(
                                  padding: REdgeInsets.only(
                                    left: (widget.prefixIcon != null) ? 25.0 : 0,
                                    top: 0,
                                    bottom: 4,
                                  ),
                                  child: Text(
                                    _selectedValue != null
                                        ? (widget.itemToString?.call(_selectedValue as T) ??
                                            _selectedValue.toString())
                                        : (widget.hint ?? translate(AppString.selectAnOption)),
                                    style:
                                        _selectedValue != null
                                            ? (widget.textStyle ??
                                                TextStyle(
                                                  fontSize: 16,
                                                  color:  AppColors.textColor,
                                                ))
                                            : (widget.hintStyle ??
                                                 TextStyle(
                                                  fontSize: 16,
                                                  color:  AppColors.textColor,
                                                  fontWeight: FontWeight.w300,
                                                )),
                                  ),
                                                       ),
                                 if (widget.suffixIcon != null)
                                   Padding(
                                     padding: REdgeInsets.only(top: 15, right: 5),
                                     child: widget.suffixIcon!,
                                   )
                                 else
                                   Padding(
                                     padding: REdgeInsets.only(top: 5, right: 5),
                                     child: Icon(Icons.arrow_drop_down, color:  AppColors.iconColor),
                                   ),
                               ],
                             ),
                             const SizedBox(height: 4),
                             if ( widget.errorText != null)
                               Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 5),
                                 child: Text(
                                   widget.errorText!,
                                   style: const TextStyle(
                                     fontSize: 12,
                                     color: AppColors.red,
                                   ),
                                 ),
                               ),
                           ],
                         ),
                       ),
                     ),
                ],
              ),
            ),

          ],
        ),
    );
  }
}
