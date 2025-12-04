import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/core/utils/app_colors.dart';
import 'package:ix/core/utils/assets_data.dart';
import 'package:ix/core/utils/font_styles.dart';
import 'package:ix/core/widgets/custom_button.dart';
import 'package:ix/core/widgets/custom_text_field.dart';
import 'package:ix/core/widgets/have_an_account.dart';
import 'package:ix/core/widgets/or_divider.dart';

import '../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../../core/widgets/drop_down_menu_widget.dart';
import '../../../../../../core/widgets/social_login_botton.dart';
import '../../../widgets/phone_number_widget.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                  subtitle: 'Create an Account to Continue your allCourses',
                  title: 'Getting Started.!',
                ),
                SizedBox(height: 10),

                CustomTextFormField(
                  text: 'Enter your full name ...',
                  hintText: 'Full Name*',
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 12.h),
                PhoneNumberWidget(
                  textFieldHint: 'Enter your phone number ...',

                ),
                SizedBox(height: 12.h),
                CustomTextFormField(

                  text: 'Enter your email address ...',

                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 12.h),
                DropDownMenuWidget(
                  text: 'select your country ...',
                  hintText: 'Country',
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 'EG', label: 'Egypt'),
                    DropdownMenuEntry(value: 'EG', label: 'Egypt'),
                    DropdownMenuEntry(value: 'EG', label: 'Egypt'),
                  ],
                ),
                SizedBox(height: 12.h),

                DropDownMenuWidget(
                  text: 'select your city...',
                  hintText: 'City',
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 'ef', label: 'sad'),
                    DropdownMenuEntry(value: 'ef', label: 'sad'),
                    DropdownMenuEntry(value: 'ef', label: 'sad'),
                  ],
                ),
                SizedBox(height: 12.h),
                DropDownMenuWidget(
                  text: 'select your gender...',
                  hintText: 'Gender',
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 'm', label: 'male'),
                    DropdownMenuEntry(value: 'f', label: 'female'),
                  ],
                ),

                SizedBox(height: 12.h),
                CustomTextFormField(
                  text: 'Select your date of birth ...',
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
                    child: SvgPicture.asset(

                      AssetsData.calendarIcon,),
                  ),
                  hintText: 'Date of birth',
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 16.h),

                CustomButton(
                  onPressed: () {},
                  text: 'Next',
                  color: AppColors.primaryColor,
                  colorSide: AppColors.primaryColor,
                  textStyle: TextStyles.font14SemiBold,
                ),
                SizedBox(height: 12.h),
                CustomButton(
                  onPressed: () {},
                  text: 'Guest Login',
                  color: AppColors.lightOrangeColor,
                  colorSide: AppColors.lightOrangeColor,
                  textStyle: TextStyles.font14.copyWith(
                    color: AppColors.textColorPrimary,
                  ),
                ),
                SizedBox(height: 20.h),

                OrDivider(),
                SizedBox(height: 20.h),

                SocialLoginBotton(),
                SizedBox(height: 20.h),
                HaveAnAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
