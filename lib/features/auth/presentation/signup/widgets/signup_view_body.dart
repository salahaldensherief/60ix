import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/features/auth/presentation/signup/signup_verify_view.dart';
import 'package:ix/features/auth/presentation/widgets/have_account_hint.dart';
import 'package:ix/features/auth/presentation/widgets/or_divider.dart';
import 'package:ix/features/auth/presentation/login/login_view.dart';

import '../../../../../art_core/theme/text_botton_theme.dart';
import '../../../../../art_core/utils/app_colors.dart';
import '../../../../../art_core/utils/assets_data.dart';
import '../../../../../art_core/utils/font_styles.dart';
import '../../../../../art_core/widgets/buttons/custom_button.dart';
import '../../../../../art_core/widgets/custom_app_bar.dart';
import '../../../../../art_core/widgets/drop_down_menu/drop_down_menu_widget.dart';
import '../../../../../art_core/widgets/text_fields/custom_text_field.dart';
import '../../widgets/phone_number_widget.dart';
import '../../widgets/social_login_botton.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  subtitle: AppStrings.createAccountToContinueCourses.tr(),
                  title: AppStrings.gettingStarted.tr(),
                ),

                CustomTextFormField(
                  text: AppStrings.fullNameHint.tr(),
                  hintText: AppStrings.fullName.tr(),
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 12.h),
                PhoneNumberWidget(textFieldHint: AppStrings.phoneNumberHint.tr()),
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
                SizedBox(height: 16.h),

                CustomButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context) => SignupVerify(), ));
                  },
                  text: AppStrings.next.tr(),
                  color:AppTextButtonStyles.primaryColor(context),
                  colorSide: AppColors.primaryBtnColor,
                  textStyle: TextStyles.font16SemiBold.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 12.h),
                CustomButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                  text: AppStrings.guestLogin.tr(),
                  color: AppTextButtonStyles.secondaryColor(context),
                  textStyle: theme.headlineLarge!,                ),
                SizedBox(height: 20.h),

                OrDivider(),
                SizedBox(height: 20.h),

                SocialLoginBotton(),
                SizedBox(height: 20.h),
                HaveAccountHint(
                  title: AppStrings.alreadyHaveAccount.tr(),
                  actionTitle: AppStrings.signIn.tr(),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
