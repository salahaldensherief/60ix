import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/features/auth/presentation/signup/signup_cubit.dart';
import '../../../../../art_core/utils/app_strings.dart';
import '../../../../../art_core/utils/assets_data.dart';
import '../../../../../art_core/widgets/drop_down_menu/drop_down_menu_widget.dart';
import '../../../../../art_core/widgets/text_fields/custom_text_field.dart';
import '../../widgets/phone_number_text_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Form(
      key: cubit.registerFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: cubit.nameController,
            text: AppStrings.fullNameHint.tr(),
            hintText: AppStrings.fullName.tr(),
            textInputType: TextInputType.name,
          ).padOnly(bottom: 10),

          PhoneNumberTextField(
            phoneNController: cubit.mobileNumberController,
            controller: cubit.mobileCodeController,
            onCountryChanged: (code) {
              cubit.mobileCodeController.text = code.dialCode;
              log("mobile code => ${code.dialCode}");
            },
            textFieldHint: AppStrings.phoneNumberHint.tr(),
          ).padOnly(bottom: 10),

          CustomTextFormField(
            controller: cubit.emailController,
            text: AppStrings.emailHint.tr(),
            hintText: AppStrings.email.tr(),
            textInputType: TextInputType.emailAddress,
          ).padOnly(bottom: 10),

          DropDownMenuWidget(
            text: AppStrings.city.tr(),
            hintText: AppStrings.cityHint.tr(),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 1, label: 'Cairo'),
              DropdownMenuEntry(value: 2, label: 'Giza'),
              DropdownMenuEntry(value: 3, label: 'kafr Elshikh'),
              DropdownMenuEntry(value: 4, label: 'Mansoura'),
              DropdownMenuEntry(value: 5, label: 'Mahalla'),
            ],
            onSelected: (value) {
              cubit.cityId = value ?? 0;
            },
          ).padOnly(bottom: 10),

          DropDownMenuWidget(

            text: AppStrings.gender.tr(),
            hintText: AppStrings.genderHint.tr(),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 1, label: 'Male'),
              DropdownMenuEntry(value: 2, label: 'Female'),
            ],
            onSelected: (value) {
              cubit.gender = value ?? 0;
            },
          ).padOnly(bottom: 10),

          CustomTextFormField(
            controller: cubit.birthDateController,
            text: AppStrings.dateOfBirth.tr(),
            hintText: AppStrings.dateOfBirthHint.tr(),
            readOnly: true,
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );

              if (pickedDate != null) {
                cubit.birthDateController.text =
                pickedDate.toIso8601String().split('T')[0];
              }
            },
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AssetsData.calendarIcon),
            ),
            textInputType: TextInputType.datetime,
          ),
        ],
      ),
    );
  }
}
