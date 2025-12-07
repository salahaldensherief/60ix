part of 'dialogs.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  static void show() {
    if(AppConfig.isGuestUser) {
      PreferenceManager().logout();
      Modular.to.navigate(
        NavigatorKeys.AUTH_KEY + NavigatorKeys.AUTH_OPTIONS_PAGE,
      );
    }else{

    showCustomDialog(content: LogoutDialog());
    }
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
            AssetsManager.logoutIcon,
            height: 40.h,
            width: 30.w,
          ),
        ),
        SizedBox(height: 24.h),
        AppText(
          text: AppString.logoutTitle.tr(),
          maxLines: 2,
          fontSize: 20.sp,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
        ),

        SizedBox(height: 14.h),

        AppText(
          text: AppString.areYouSureYouWantToLogout.tr(),
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
                content: ButtonContent(label: translate(AppString.cancel)),
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
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Expanded(
              child: AppButton(
                content: ButtonContent(label: translate(AppString.logOut)),
                behavior: TapBehavior(
                  onTap: () async{
                    PreferenceManager().logout();
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
