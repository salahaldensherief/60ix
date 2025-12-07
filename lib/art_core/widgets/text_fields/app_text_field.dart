part of 'text_fields.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialText;
  final Function(String)? onChanged;
  final String? errorText;
  final String? label;
  final String? hint;
  final TextStyle? hintStyle, textInputStyle, textStyle, labelStyle;
  final bool isSelectable;
  final bool readOnly;
  final int? maxLines, maxLength , minLines;
  final String? Function(String?)? validator;
  final bool isPassword, isRequired;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onTap;
  final Color? fillColor;
  final bool filled;
  final bool enableBorder;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? boxShadow;
  const AppTextField({
    super.key,
    this.readOnly = false,
    this.boxShadow,
    this.minLines = 1,
    this.maxLines = 1,
    this.onTap,
    this.hint,
    this.label,
    this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.isPassword = false,
    this.isRequired = false,
    this.validator,
    this.onChanged,
    this.errorText,
    this.initialText,
    this.hintStyle,
    this.isSelectable = false,
    this.controller,
    this.maxLength,
    this.fillColor,
    this.filled = true,
    this.enableBorder = true,
    this.contentPadding,
    this.textInputStyle,
    this.textStyle,
    this.labelStyle,
    this.margin,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        color: AppColors.grey[100],
                        size: 20,
                      ),
                    ),
                  if (widget.label != null) ...[
                    Text(
                      widget.label!,
                      style:
                          widget.labelStyle ??
                          TextStyle(
                            fontSize: 16,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],

                  if (widget.isRequired) ...[
                    const SizedBox(width: 5),
                    const Text("*", style: TextStyle(color: AppColors.red)),
                  ],
                ],
              ),
            ),
            if (widget.suffixIcon != null)
              Padding(
                padding: REdgeInsets.only(right: 6.0),
                child: widget.suffixIcon,
              ),
          ],
        ),
        SizedBox(height: 10.0),
        Container(
          margin: widget.margin ?? EdgeInsets.zero,
          padding: widget.contentPadding ?? const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: widget.fillColor ?? AppColors.borderInputField,
            border: widget.enableBorder ?Border.all(
              color:
                  widget.errorText != null
                      ? AppColors.red
                      : AppColors.shadowColor,
            ) :null,
            borderRadius: BorderRadius.circular(12),
            boxShadow:widget.boxShadow?? [
              BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 0.05),
                blurRadius: 8,
                offset: const Offset(0, 1),
              ),
            ],
            // border: enableBorder && errorText != null
            //     ? Border.all(color: Colors.red, width: 1.0)
            //     : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Padding(
                      padding: REdgeInsets.only(
                        left: (widget.prefixIcon != null) ? 25.0 : 0,
                        top: 0,
                        bottom: 4,
                      ),
                      child: TextFormField(
                        onTapUpOutside: (value){
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        controller: widget.controller,
                        initialValue: widget.initialText,
                        textAlign:  TextAlign.start,
                        readOnly: widget.readOnly,
                        minLines: widget.minLines,
                        maxLines: widget.maxLines,
                        maxLength: widget.maxLength,
                        obscureText: obscureText,
                        keyboardType: widget.textInputType,
                        onChanged: widget.onChanged,
                        validator: widget.validator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onTap: widget.onTap,
                        scrollPadding: EdgeInsets.zero,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        style:
                            widget.textInputStyle ??
                            widget.textStyle ??
                            TextStyle(fontSize: 16, color: AppColors.textColor ),
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(

                          hintText: widget.hint ?? "Enter your text",
                          hintStyle:
                              widget.hintStyle ??
                              TextStyle(
                                fontSize: 16,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w300,
                              ),
                          fillColor:
                              widget.filled
                                  ? (widget.fillColor ??
                                      AppColors.borderInputField)
                                  : null,
                          filled: widget.filled,
                          border: InputBorder.none,
                          contentPadding:
                              widget.contentPadding ?? EdgeInsets.zero,
                          isCollapsed: true,
                          errorText: widget.errorText,
                          errorStyle: const TextStyle(color: AppColors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              if (widget.isPassword) ...[
                Padding(
                  padding: REdgeInsets.only(
                    top: obscureText ? 10 : 20,
                    right: 5,
                  ),
                  child: SvgIconWidget(
                    path:
                        obscureText ? AssetsManager.eyeOff : AssetsManager.eye,
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  // Widget? _buildSuffixIcon() {
  //   if (widget.suffixIcon != null) {
  //     return widget.suffixIcon;
  //   }
  //   if (widget.isPassword) {
  //     return InkWell(
  //       child: Icon(
  //         obscureText ? Icons.visibility_off : Icons.visibility,
  //         color: AppColors.grey[100],
  //       ),
  //       onTap: () {
  //         setState(() {
  //           obscureText = !obscureText;
  //         });
  //       },
  //     );
  //   }
  //   return null;
  // }
}
