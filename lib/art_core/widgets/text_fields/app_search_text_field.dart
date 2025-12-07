part of 'text_fields.dart';

class AppSearchTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? borderRadius;
  final BoxShadow? boxShadow;
  final EdgeInsets? padding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Duration debounceDuration;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onSubmitted;
  final VoidCallback? onTrailingIconPressed;
  final bool enabled;
  final bool autoFocus;
  final bool isFilterVisible;
  final VoidCallback? onFilterPressed;
  final bool readOnly;

  AppSearchTextField({
    super.key,
    this.hintText = AppString.searchForServicesAndVendors,
    this.controller,
    this.focusNode,
    this.leadingIcon = Icons.search,
    this.trailingIcon,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius = AppStyles.borderRadiusSmall,
    BoxShadow? boxShadow,
    this.padding,
    this.hintStyle,
    this.textStyle,
    this.debounceDuration = AppStyles.debounceDuration,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.onTrailingIconPressed,
    this.enabled = true,
    this.autoFocus = false,
    this.isFilterVisible = true,
    this.onFilterPressed,
    this.readOnly = false,
  }) : boxShadow = boxShadow ?? AppStyles.shadowLarge;

  @override
  State<AppSearchTextField> createState() => _AppSearchTextFieldState();
}

class _AppSearchTextFieldState extends State<AppSearchTextField> {
  late TextEditingController _internalController;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  void _onTextChanged(String value) {
    if (widget.onChanged == null) return;

    _debounceTimer?.cancel();
    _debounceTimer = Timer(widget.debounceDuration, () {
      widget.onChanged!(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: widget.padding ?? REdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 60.h,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? AppColors.getCardBackground(context),
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          boxShadow: widget.boxShadow != null ? [widget.boxShadow!] : [],
        ),
        child: Row(
          children: [
            if (widget.leadingIcon != null)...[
              SvgIconWidget(
                path: AssetsManager.search,
                width: 20.w,
                height: 20.h,
                color: widget.iconColor ?? AppColors.iconColor,
              ),
            ],
            SizedBox(width: 8.w),
            Expanded(
              child: TextFormField(
                controller: _internalController,
                focusNode: widget.focusNode,
                enabled: widget.enabled,
                autofocus: widget.autoFocus,
                readOnly: widget.readOnly,
                textInputAction: TextInputAction.search,
                style: widget.textStyle ?? TextStyle(color: AppColors.textColor, fontSize: 13.sp),
                decoration: InputDecoration(
                  hintText: widget.hintText?.tr(),
                  hintStyle: widget.hintStyle ?? TextStyle(color: AppColors.textColor, fontSize: 13.sp),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: REdgeInsets.symmetric(vertical: 8),
                ),
                onChanged: _onTextChanged,
                onTap: widget.onTap,
                onFieldSubmitted: (_) => widget.onSubmitted?.call(),
              ),
            ),
            if (widget.trailingIcon != null) ...[
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: widget.onTrailingIconPressed,
                child: Icon(
                  widget.trailingIcon,
                  size: 22.sp,
                  color: widget.iconColor ?? AppColors.blue.shade600,
                ),
              ),
            ],
            if (widget.isFilterVisible) ...[
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: widget.onFilterPressed,
                child: Container(
                  height: 38.h,
                  width: 38.w,
                  padding: REdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: SvgIconWidget(
                    path: AssetsManager.filter,
                    width: 19.2.w,
                    height: 18.h,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
