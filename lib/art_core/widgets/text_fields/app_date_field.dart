part of 'text_fields.dart';

class AppDateField extends StatefulWidget {
  final TextEditingController? controller;
  final DateTime? initialDate;
  final Function(DateTime)? onDateChanged;
  final bool disableFutureDates;

  final String? errorText;
  final String label;
  final String? hint;
  final TextStyle? hintStyle, textStyle, labelStyle;
  final bool isRequired;
  final String? Function(DateTime?)? validator;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool filled;
  final bool enableBorder;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final String dateFormat; // e.g., "yyyy-MM-dd"

  const AppDateField({
    super.key,
    this.controller,
    this.initialDate,
    this.onDateChanged,
    this.errorText,
    required this.label,
    this.hint,
    this.hintStyle,
    this.textStyle,
    this.labelStyle,
    this.isRequired = false,
    this.disableFutureDates = false,
    this.validator,
    this.firstDate,
    this.lastDate,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.filled = true,
    this.enableBorder = true,
    this.contentPadding,
    this.margin,
    this.dateFormat = "yyyy-MM-dd",
  });

  @override
  State<AppDateField> createState() => _AppDateFieldState();
}

class _AppDateFieldState extends State<AppDateField> {
  late TextEditingController _internalController;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
    _selectedDate = widget.initialDate;
    if (_selectedDate != null) {
      _updateTextField();
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  void _updateTextField() {
    if (_selectedDate != null) {
      final formatted = _formatDate(_selectedDate!);
      _internalController.text = formatted;


      if (widget.onDateChanged != null) {
        widget.onDateChanged!(_selectedDate!);
      }
    }
  }

  String _formatDate(DateTime date) {
    final String year = date.year.toString();
    final String month = date.month.toString().padLeft(2, '0');
    final String day = date.day.toString().padLeft(2, '0');
    return "$year-$month-$day"; 
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime tempPickedDate = _selectedDate ?? DateTime.now();

    await showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cardBackground,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 300.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedDate = tempPickedDate;
                      _updateTextField();
                      if (widget.onDateChanged != null) {
                        widget.onDateChanged!(tempPickedDate);
                      }
                    });
                    Navigator.pop(context);
                  },

                  child: AppText(text: translate(AppString.confirm)),
                ),
                SizedBox(height: 10.0,),
                const Divider(height: 1),
                SizedBox(height: 10.0,),
                Expanded(
                  child: CupertinoDatePicker(
                    backgroundColor: AppColors.cardBackground,
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: _selectedDate ?? DateTime.now(),
                    minimumDate: widget.firstDate ?? DateTime(1900),
                    maximumDate: widget.disableFutureDates
                        ? DateTime.now()
                        : (widget.lastDate ?? DateTime(2100)),
                    onDateTimeChanged: (DateTime newDate) {
                      tempPickedDate = newDate;
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    color: AppColors.grey[100],
                    size: 20,
                  ),
                ),
              Text(
                widget.label,
                style:
                    widget.labelStyle ??
                    TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              if (widget.isRequired) ...[
                const SizedBox(width: 5),
                const Text("*", style: TextStyle(color: AppColors.red)),
              ],
            ],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          margin: widget.margin ?? EdgeInsets.zero,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: widget.fillColor ?? AppColors.borderInputField,
            border: Border.all(color: AppColors.shadowColor),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 0.05),
                blurRadius: 8,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          // border: enableBorder && errorText != null
          //     ? Border.all(color: Colors.red, width: 1.0)
          //     : null,
          child: Padding(
            padding: REdgeInsets.only(
              left: widget.prefixIcon != null ? 25.0 : 0,
              top: 0,
              bottom: 4,
            ),
            child: TextFormField(
              controller: _internalController,
              readOnly: true,
              // Date field is not editable manually
              onTap: () => _selectDate(context),
              scrollPadding: EdgeInsets.zero,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              style:
                  widget.textStyle ??
                  TextStyle(fontSize: 16, color: AppColors.textColor),
              validator:
                  widget.validator != null
                      ? (value) => widget.validator!(_selectedDate)
                      : null,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: widget.hint ?? translate(AppString.selectDate),
                hintStyle:
                    widget.hintStyle ??
                    TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w300,
                    ),
                fillColor:
                    widget.filled
                        ? (widget.fillColor ?? AppColors.borderInputField)
                        : null,
                filled: widget.filled,
                border: InputBorder.none,
                contentPadding: widget.contentPadding ?? EdgeInsets.zero,
                isCollapsed: true,
                suffixIcon: widget.suffixIcon,
                errorText: widget.errorText,
                errorStyle: const TextStyle(color: AppColors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
