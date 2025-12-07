part of 'dialogs.dart';

class CheckLoginView extends StatelessWidget {
  const CheckLoginView({super.key});

  static void show() {
    if (AppConfig.isGuestUser) {
      showCustomDialog(content: CheckLoginView());
    }
  }

  static Widget check({required Widget child}) {
    if (AppConfig.isGuestUser) {
      return Center(
        child: Padding(
          padding: AppStyles.defaultPadding,
          child: CheckLoginView(),
        ),
      );
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 88.h,
          width: 88.w,
          padding: REdgeInsets.all(17),
          decoration: BoxDecoration(
            color: AppColors.primary.shade50,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            AssetsManager.lock2,
            height: 40.h,
            width: 30.w,
          ),
        ),
        SizedBox(height: 24.h),
        AppText(
          text: AppString.join60ixToUnlockThisFeature.tr(),
          maxLines: 2,
          fontSize: 20.sp,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
        ),

        SizedBox(height: 14.h),

        AppText(
          text: AppString.signInOrCreateAnAccountToEnjoyAllFeatures.tr(),
          fontSize: 15.sp,
          maxLines: 4,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.w,
          children: [
            Expanded(
              child: AppButton(
                content: ButtonContent(label: translate(AppString.signup)),
                buttonConfig: ButtonConfig.outlined(
                  backgroundColor: AppColors.inputField,
                  textStyle: TextStyle(
                    color: AppColors.blue,
                    fontSize: 15.5.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontsManager.fontFamily,
                  ),
                ),
                behavior: TapBehavior(
                  onTap: () async {
                    // Navigator.of(context).pop();
                    // await Future.delayed(const Duration(milliseconds: 300));
                    Modular.to.navigate(
                      NavigatorKeys.AUTH_KEY + NavigatorKeys.AUTH_OPTIONS_PAGE,
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: AppButton(
                content: ButtonContent(label: translate(AppString.login)),
                behavior: TapBehavior(
                  onTap: () {
                    // Navigator.of(context).pop();
                    // await Future.delayed(const Duration(milliseconds: 300));
                    Modular.to.navigate(
                      NavigatorKeys.AUTH_KEY + NavigatorKeys.AUTH_OPTIONS_PAGE,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
