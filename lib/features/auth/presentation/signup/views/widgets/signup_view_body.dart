import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/core/utils/app_colors.dart';
import 'package:ix/core/widgets/custom_text_field.dart';

import '../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../../core/widgets/drop_down_menu_widget.dart';
import '../../../widgets/phone_number_widget.dart';

class SignupViewBody  extends StatelessWidget {
  const  SignupViewBody ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
             children: [
         CustomAppBar(
           subtitle: 'Create an Account to Continue your allCourses',
           title: 'Getting Started.!',
         ),
               SizedBox(height: 20.h),

               CustomTextFormField(hintText: 'Full Name*', textInputType: TextInputType.name),
                SizedBox(height: 16.h),
                PhoneNumberWidget(),
                SizedBox(height: 16.h),
                CustomTextFormField(hintText: 'Email', textInputType: TextInputType.emailAddress),
                SizedBox(height: 16.h,),
               // DropDownMenuWidget(dropdownMenuEntries: [
               //   DropdownMenuEntry(value: '', label: 'dss')
               // ],),
                SizedBox(height: 16.h),
                CustomTextFormField(hintText: 'Password*', textInputType: TextInputType.visiblePassword, obscureText: true),
               SizedBox(height: 16.h),
             ],
        ),
      ),
    );
  }
}

