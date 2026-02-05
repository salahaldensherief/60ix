import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import '../../../../../art_core/utils/app_colors.dart';
import '../../../../../art_core/utils/font_styles.dart';
import '../signup_cubit.dart';
import '../signup_state.dart';
import 'custom_check_box.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {

    final cubit = context.read<SignupCubit>();

    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (prev, curr) =>
      prev.isTermsAccepted != curr.isTermsAccepted,
      builder: (context, state) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Row(
          children: [
            CustomCheckBox(
              isChecked: state.isTermsAccepted,
              onChecked: cubit.changeTermsAcceptance,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${AppStrings.agree.tr()} ',
                      style: isDark
                          ? TextStyles.font14SemiBold.copyWith(
                        color:
                        AppColors.textColorDarkSecondary,
                      )
                          : const TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: AppStrings.terms.tr(),
                      style: TextStyles.font14SemiBold.copyWith(
                        color: AppColors.primaryBtnColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
