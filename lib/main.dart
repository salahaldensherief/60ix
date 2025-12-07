import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/core/utils/app_colors.dart';
import 'package:ix/features/splash/presntation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.whiteColor,
            fontFamily: 'Source Sans 3',
            primaryColor: AppColors.primaryColor,
          ),
          home: SplashView(),
        ),
      ),
    );
  }
}
