
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/core/translate/translate.dart';
import 'package:flutter/services.dart';
class AppPhoneField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(PhoneNumber?)? validator;
  final String label;
  final String? hint;
  final String? errorText;
  final String initialCountryCode;
  final Function(PhoneNumber)? onChanged;
  final Function(String)? onCountryChanged;
  final TextStyle? labelStyle, textStyle, hintStyle;
  final Color? fillColor;
  final bool filled, enableBorder, isRequired;
  final EdgeInsetsGeometry? contentPadding, margin;
  final String? initialValue;
  const AppPhoneField({
    super.key,
    this.controller,
    required this.label,
    this.validator,
    this.hint,
    this.errorText,
    this.initialCountryCode = "EG",
    this.onChanged,
    this.onCountryChanged,
    this.labelStyle,
    this.textStyle,
    this.hintStyle,
    this.fillColor,
    this.filled = true,
    this.enableBorder = true,
    this.isRequired = false,
    this.contentPadding,
    this.margin,
    this.initialValue,
  });

  @override
  State<AppPhoneField> createState() => _AppPhoneFieldState();
}

class _AppPhoneFieldState extends State<AppPhoneField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ----------- Label -----------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              Text(
                widget.label,
                style: widget.labelStyle ??
                    TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              if (widget.isRequired) ...[
                const SizedBox(width: 5),
                const Text("*", style: TextStyle(color: Colors.red)),
              ],
            ],
          ),
        ),
        const SizedBox(height: 4),
        // ----------- Phone Field Container -----------
        Container(
          margin: widget.margin ?? EdgeInsets.zero,
          decoration: BoxDecoration(
            color: widget.fillColor ?? AppColors.borderInputField,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.errorText != null ? AppColors.red : AppColors.shadowColor,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 0.05),
                blurRadius: 8,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: IntlPhoneField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                EnglishDigitsOnlyFormatter(),
              ],
              initialValue: widget.initialValue,
              dropdownTextStyle: TextStyle(
                color: AppColors.textColor,
                fontSize: 16,
              ),
              flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 8),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.controller,
              textInputAction: TextInputAction.next,
              initialCountryCode: widget.initialCountryCode,
              onChanged: widget.onChanged,
              onCountryChanged: (country) {
                if (widget.onCountryChanged != null) {
                  widget.onCountryChanged!(country.dialCode);
                }
              },
              disableLengthCheck: false,
              invalidNumberMessage: AppString.phoneInvalid.tr(),
              validator: widget.validator ??
                      (phone) {
                    if (phone == null || phone.number.isEmpty) {
                      return translate(AppString.requiredPhoneNumber);
                    }
                    return null;
                  },
              pickerDialogStyle: PickerDialogStyle(
                searchFieldCursorColor: AppColors.primary,
                searchFieldInputDecoration: InputDecoration(
                  labelText: "Search Country",
                  labelStyle: TextStyle(color: AppColors.grey[100]),
                ),
              ),
              dropdownIconPosition: IconPosition.trailing,
              cursorColor: AppColors.primary,
              style: widget.textStyle ??  TextStyle(fontSize: 16,color: AppColors.textColor),
              decoration: InputDecoration(
                isDense: true,
                hintText: widget.hint ?? "",
                hintStyle: widget.hintStyle ??
                    TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w300,
                    ),
                hintTextDirection: TextDirection.ltr,
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12.0),
                border: InputBorder.none,
                errorStyle: const TextStyle(color: AppColors.red),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class EnglishDigitsOnlyFormatter extends TextInputFormatter {
  static const arabicDigits = ['٠','١','٢','٣','٤','٥','٦','٧','٨','٩'];
  static const englishDigits = ['0','1','2','3','4','5','6','7','8','9'];

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String newText = newValue.text;
    for (int i = 0; i < arabicDigits.length; i++) {
      newText = newText.replaceAll(arabicDigits[i], englishDigits[i]);
    }
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
