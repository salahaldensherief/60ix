import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/password_recovery_actions.dart';
import 'package:ix/features/auth/presentation/forgetpassword/presentation/views/widgets/password_recovery_form.dart';
import '../../../../../../art_core/utils/app_strings.dart';
import '../../../../../../art_core/widgets/custom_app_bar.dart';

///PasswordRecovery what?
///TODO: always add the widget type or identifier to its name
///exp: PasswordRecovery(View) , UserInfo(Card) , requests(List),anyName(bottomSheet)
class PasswordRecoveryView extends StatelessWidget {
  const PasswordRecoveryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///TODO: you can add appBarWidget here
      // appBar:
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///TODO
          CustomAppBar(
            // phoneNumber: '01002658542',
            showBack: true,
            title: AppStrings.passwordRecovery.tr(),
            subtitle: AppStrings.otpAppBarHint.tr(),
          ),

          ///TODO:
          PasswordRecoveryForm(),
          PasswordRecoveryActions(),
        ],
      ).padSymmetric(vertical: 20, horizontal: 18),
    );
  }
}
