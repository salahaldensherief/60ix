import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/forget_password_cubit.dart';
import '../../../../../../../art_core/utils/app_strings.dart';
import '../../../../widgets/phone_number_text_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    return Form(
      key: cubit.forgetPasswordFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          PhoneNumberTextField(
            onCountryChanged: (code) {
              cubit.mobileCode.text= code.dialCode;
            },
            phoneNController:cubit.mobileNumber ,
            controller: cubit.mobileCode,
            textFieldHint: AppStrings.appBarForgetPasswordHint.tr(),
          ),

        ],
      ),
    );
  }
}
