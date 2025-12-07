import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/resources/assets_manager.dart';
import 'package:sixty_ix/modules/art_core/widgets/text/app_text.dart';

import '../../../core/translate/translate.dart';
import '../../resources/app_strings.dart';
import '../../resources/app_styles.dart';
import '../../theme/themes.dart';
import '../svg_icon/svg_icon_widget.dart';

part 'app_date_field.dart';
part 'app_dropdown_text_field.dart';
part 'app_search_text_field.dart';
part 'app_text_field.dart';

class ExTextFields extends StatelessWidget {
  const ExTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = TextEditingController();
    final TextEditingController _dateController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Regular text field
        AppTextField(
          label: "Name",
          hint: "Enter your name",
          prefixIcon: Icons.person,
          isRequired: true,
          controller: _textController,
          validator: _requiredValidator,
          onChanged: (value) => print("Name: $value"),
        ),
        const SizedBox(height: 20),
        // Date field
        AppDateField(
          label: "Date of Birth",
          hint: "Select your birth date",
          prefixIcon: Icons.calendar_today,
          isRequired: true,
          controller: _dateController,
          validator: _requiredDateValidator,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          onDateChanged: (date) => print("Selected Date: ${date.toIso8601String()}"),
        ),
        const SizedBox(height: 20),
        // Password field
        const AppTextField(
          label: "Password",
          hint: "Enter your password",
          prefixIcon: Icons.lock,
          isPassword: true,
          isRequired: true,
          validator: _requiredValidator,
        ),

        //Todo :: Dropdown field
        AppDropdownTextField(
          label: "Choose an option",
          items: ["Option 1", "Option 2", "Option 3"],
          initialValue: "Option 1",
          onChanged: (value) {
            print("Selected: $value");
          },
          isRequired: true,
          hint: "Pick one",
          prefixIcon: Icons.category,
        )
      ],
    );
  }
  static String? _requiredValidator(String? value) {
    if (value == null || value.isEmpty) return "This field is required";
    return null;
  }

  static String? _requiredDateValidator(DateTime? date) {
    if (date == null) return "Date is required";
    return null;
  }
}
