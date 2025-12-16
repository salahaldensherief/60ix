import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../art_core/utils/app_strings.dart';
import '../../../../../art_core/utils/assets_data.dart';
import '../../../../../art_core/widgets/drop_down_menu/drop_down_menu_widget.dart';
import '../../../../../art_core/widgets/text_fields/custom_text_field.dart';
import '../../widgets/phone_number_text_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          text: AppStrings.fullNameHint.tr(),
          hintText: AppStrings.fullName.tr(),
          textInputType: TextInputType.name,
        ),
        SizedBox(height: 12.h),
        PhoneNumberTextField(
          textFieldHint: AppStrings.phoneNumberHint.tr(),
        ),
        SizedBox(height: 12.h),
        CustomTextFormField(
          text: AppStrings.emailHint.tr(),

          hintText: AppStrings.email.tr(),
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 12.h),
        DropDownMenuWidget(
          text: AppStrings.countryHint.tr(),
          hintText: AppStrings.country.tr(),
          dropdownMenuEntries: [
            DropdownMenuEntry(value: 'EG', label: 'Egypt'),
            DropdownMenuEntry(value: 'EG', label: 'Egypt'),
            DropdownMenuEntry(value: 'EG', label: 'Egypt'),
          ],
        ),
        SizedBox(height: 12.h),
        DropDownMenuWidget(
          text: AppStrings.city.tr(),
          hintText: AppStrings.cityHint.tr(),
          dropdownMenuEntries: [
            DropdownMenuEntry(value: 'ef', label: 'sad'),
            DropdownMenuEntry(value: 'ef', label: 'sad'),
            DropdownMenuEntry(value: 'ef', label: 'sad'),
          ],
        ),
        SizedBox(height: 12.h),
        DropDownMenuWidget(
          text: AppStrings.genderHint.tr(),
          hintText: AppStrings.gender.tr(),
          dropdownMenuEntries: [
            DropdownMenuEntry(value: 'm', label: 'male'),
            DropdownMenuEntry(value: 'f', label: 'female'),
          ],
        ),
        SizedBox(height: 12.h),
        CustomTextFormField(
          text: AppStrings.dateOfBirth.tr(),
          onTap: () {
            showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              initialDate: DateTime.now(),
            );
          },
          readOnly: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(AssetsData.calendarIcon),
          ),
          hintText: AppStrings.dateOfBirthHint.tr(),
          textInputType: TextInputType.visiblePassword,
          obscureText: true,
        ),
      ],
    );
  }
}
