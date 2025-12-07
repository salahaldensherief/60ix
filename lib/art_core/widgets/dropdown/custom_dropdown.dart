part of 'dropdown.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? floatingLabelText;
  final String? hintText;
  final List<T> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final Color? textColor;
  final String Function(T)? itemToString;

  const CustomDropdown({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.floatingLabelText,
    this.hintText,
    this.textColor,
    this.itemToString,
  });


  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: floatingLabelText,
        filled: true,
        fillColor: AppColors.inputField,
        contentPadding: REdgeInsets.symmetric(horizontal: 16, vertical: 4),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        // hintText: floatingLabelText,
      ),
      child: DropdownButton<T>(
        items: items.map((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: AppText(
                  text: itemToString != null ? itemToString!(value) : value.toString(),
                  color: textColor ?? AppColors.grey.shade300,
                ),
              );
            }).toList(),
        value: value,
        hint: AppText(
          text: hintText ?? '',
          color: AppColors.grey.shade300,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
        borderRadius: BorderRadius.circular(10),
        underline: const SizedBox(),
        isExpanded: true,
        onChanged: onChanged,
        iconEnabledColor: AppColors.primary,
      ),
    );
  }

  InputBorder get border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(7.r),
    borderSide: BorderSide(
      color: Color.fromRGBO(238, 238, 238, 1),
      width: 1,
    ),
  );
}
