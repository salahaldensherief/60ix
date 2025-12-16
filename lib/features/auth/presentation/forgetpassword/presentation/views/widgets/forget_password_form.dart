import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../../art_core/utils/app_strings.dart';
import '../../../../widgets/phone_number_text_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhoneNumberTextField(
          textFieldHint: AppStrings.appBarForgetPasswordHint.tr(),
        ),

      ],
    );
  }
}
