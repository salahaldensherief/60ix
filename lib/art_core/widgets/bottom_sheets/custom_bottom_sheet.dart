part of 'bottom_sheets.dart';

class CustomBottomSheet extends StatelessWidget {
  /// The text to display Title [String]
  ///
  /// This text is displayed in the title section of the bottom sheet If It is not null
  final String? title;

  /// Color [Color] to display in the title section of the bottom sheet
  ///
  /// This color is used to change the color of the title section of the bottom sheet If It is not null
  final Color? titleColor;

  /// The text to display Body [String]
  ///
  /// This text is displayed in the body section of the bottom sheet If It is not null
  final String? body;

  /// Color [Color] to display in the body section of the bottom sheet
  ///
  /// This color is used to change the color of the body section of the bottom sheet If It is not null
  final Color? bodyColor;


  final Color? backgroundColor;
  /// The Widget to display in the body section of the bottom sheet [Widget]
  ///
  /// This Widget is displayed in the body section of the bottom sheet If It is not null
  final Widget? content;

  /// The icon path to display in the body section of the bottom sheet [String]
  ///
  /// This icon path is displayed in the body section of the bottom sheet If It is not null
  final String? iconPath;

  /// Filed Button [bool] to display in the bottom sheet
  ///
  /// This filed is used to display the Filed Button in the bottom sheet
  final bool? enabledFiledButton;

  /// The BtnSettings [BtnSettings] for the Filed Button
  ///
  /// If filedButton is true this BtnSettings is required
  final BtnSettings? filedBtnSettings;

  /// Outlined Button [bool] to display in the bottom sheet
  ///
  /// This filed is used to display the Outlined Button in the bottom sheet
  final bool? enabledOutlinedButton;

  /// The BtnSettings [BtnSettings] for the Outlined Button
  ///
  /// If outlinedButton is true this BtnSettings is required
  final BtnSettings? outlinedBtnSettings;

  /// The BtnSettings [BtnSettings] for the textButton
  ///
  /// Clear Button [bool] to display in the bottom sheet
  final BtnSettings? enabledClearButton;

  const CustomBottomSheet({
    super.key,
    this.title,
    this.titleColor,
    this.body,
    this.bodyColor,
    this.content,
    this.iconPath,
    this.enabledFiledButton,
    this.filedBtnSettings,
    this.enabledOutlinedButton,
    this.outlinedBtnSettings,
    this.backgroundColor,
    this.enabledClearButton,
  }) : assert(
         //? check if the enabledFiledButton is true the filedBtnSettings is required and if false dont do any thing
         enabledFiledButton == null ||
             enabledFiledButton == true && filedBtnSettings != null ||
             enabledFiledButton == false,
         'FileButton Settings is required if enabledFiledButton is true',
       ),
       assert(
         //? check if the enabledOutlinedButton is true the outlinedBtnSettings is required and if false dont do any thing
         enabledOutlinedButton == null ||
             enabledOutlinedButton == true && outlinedBtnSettings != null ||
             enabledOutlinedButton == false && outlinedBtnSettings == null,
         'OutlinedButton Settings is required if enabledOutlinedButton is true',
       );

  static Future<dynamic> show({
    String? title,
    Color? titleColor,
    String? body,
    Color? bodyColor,
    Widget? content,
    String? iconPath,
    bool? enabledFiledButton,
    BtnSettings? filedBtnSettings,
    bool? enabledOutlinedButton,
    BtnSettings? outlinedBtnSettings,
    BtnSettings? enabledClearButton,
    Color? backgroundColor,
  }) {
    final context1 = Modular.routerDelegate.navigatorKey.currentContext!;
    return showModalBottomSheet(
      context: context1,
      isScrollControlled: true,
      backgroundColor: backgroundColor ?? AppColors.getCardBackground(context1),
      elevation: 0,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context1).width ,
        minWidth: MediaQuery.sizeOf(context1).width ,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder:
          (_) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context1).viewInsets.bottom,
            ),
            child: CustomBottomSheet(
              title: title ?? "",
              titleColor: titleColor,
              body: body,
              backgroundColor: backgroundColor,
              bodyColor: bodyColor,
              content: content,
              iconPath: iconPath,
              enabledFiledButton: enabledFiledButton,
              filedBtnSettings: filedBtnSettings,
              enabledOutlinedButton: enabledOutlinedButton,
              outlinedBtnSettings: outlinedBtnSettings,
              enabledClearButton: enabledClearButton,
            ),
          ),
    );
  }

  bool get hasBtn =>
      enabledFiledButton != null && enabledFiledButton! ||
      enabledOutlinedButton != null && enabledOutlinedButton!;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 60.w,
            child: Divider(
              color: AppColors.grey.shade400,
              thickness: 2.0,
            ),
          ),
          Container(
             margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.getCardBackground(context),
              borderRadius: BorderRadius.circular(12.0),
              // border: Border.all(color: AppColors.black.shade300, width: 1),
              // boxShadow: [
              //   BoxShadow(
              //     color: AppColors.black.withOpacity(0.15),
              //     blurRadius: 5.0,
              //     spreadRadius: 0,
              //     offset: const Offset(0, 1),
              //   ),
              // ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // if (title != null) ...[
                //   AppBar(
                //     title: AppText(
                //       text: title!,
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: titleColor,
                //     ),
                //     centerTitle: true,
                //     automaticallyImplyLeading: false,
                //     actions: [
                //       if (enabledClearButton != null &&
                //           enabledClearButton!.onTap != null) ...[
                //         TextButton(
                //           onPressed: enabledClearButton?.onTap,
                //           style: TextButton.styleFrom(
                //             padding: EdgeInsets.symmetric(
                //               horizontal:
                //                   enabledClearButton?.horizontalPadding ?? 15,
                //             ),
                //             shadowColor: Colors.transparent,
                //             foregroundColor: Colors.transparent,
                //             visualDensity: VisualDensity.compact,
                //           ),
                //           child: Text(
                //             enabledClearButton!.title,
                //             style: TextStyle(
                //               color: enabledClearButton?.textColor,
                //               fontSize: enabledClearButton?.fontSize,
                //               fontWeight: enabledClearButton?.fontWeight,
                //             ),
                //           ),
                //         ),
                //       ],
                //       const SizedBox(width: 15),
                //     ],
                //   ),
                //   // const SizedBox(height: 15),
                // ],
                if (iconPath != null) ...[
                  // const SizedBox(height: 30),
                  SvgIconWidget(path: iconPath!, width: 65, height: 65),
                  const SizedBox(height: 30),
                ],
                if (body != null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: AppText(
                      text: body!,
                      fontSize: 18,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.normal,
                      color: bodyColor,
                    ),
                  ),

                ],
                if (content != null) ...[content!, const SizedBox(height: 30)],
                if (hasBtn) ...[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (enabledOutlinedButton != null &&
                          enabledOutlinedButton!) ...[
                        Flexible(
                          child: ElevatedButton(
                            // enableBorder: outlinedBtnSettings!.enableBorder,
                            // title: outlinedBtnSettings!.title,
                            // fontSize: outlinedBtnSettings!.fontSize,
                            // fontWeight:
                            //     outlinedBtnSettings?.fontWeight ??
                            //     FontWeight.bold,
                            // textColor: outlinedBtnSettings!.textColor,
                            // onTap: outlinedBtnSettings!.onTap,
                            // color: outlinedBtnSettings!.color,
                            // borderColor: outlinedBtnSettings!.borderColor,
                            // height: outlinedBtnSettings!.height,
                            // width: outlinedBtnSettings!.width,
                            // horizontalPadding:
                            //     outlinedBtnSettings!.horizontalPadding,
                            // leading: outlinedBtnSettings!.body,

                            onPressed: outlinedBtnSettings!.onTap,
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                outlinedBtnSettings!.color,
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: outlinedBtnSettings!.borderColor!,
                                  ),
                                ),
                              ),
                            ),
                            child: outlinedBtnSettings!.body,
                          ),
                        ),
                      ],
                      if (enabledFiledButton != null &&
                          enabledFiledButton!) ...[
                        Flexible(
                          child: ElevatedButton(
                            // enableBorder: filedBtnSettings!.enableBorder,
                            // title: filedBtnSettings!.title,
                            // fontSize: filedBtnSettings!.fontSize,
                            // textColor: filedBtnSettings!.textColor,
                            // onTap: filedBtnSettings!.onTap,
                            // color: filedBtnSettings!.color,
                            // borderColor: filedBtnSettings!.borderColor,
                            // height: filedBtnSettings!.height,
                            // width: filedBtnSettings!.width,
                            // horizontalPadding:
                            //     filedBtnSettings!.horizontalPadding,
                            // loading: filedBtnSettings!.loading ?? false,
                            // fontWeight:
                            //     filedBtnSettings?.fontWeight ?? FontWeight.bold,
                            // leading: filedBtnSettings!.body,
                            onPressed: filedBtnSettings!.onTap,
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                filedBtnSettings!.color,
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: filedBtnSettings!.borderColor!,
                                  ),
                                ),
                              ),
                            ),
                            child: filedBtnSettings!.body,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
          // const SizedBox(height: 20),
        ],
      ),
    );
  }


}

class BtnSettings {
  final String title;
  final VoidCallback? onTap;
  final bool? loading;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final double? width;
  final double? horizontalPadding;
  final bool? enableBorder;
  final Widget? body;

  const BtnSettings({
    this.title = '',
    this.onTap,
    this.loading,
    this.color,
    this.borderColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.width,
    this.horizontalPadding,
    this.enableBorder,
    this.body,
  });

  /// This BtnSettings for enableBorder [BtnSettings] for the Filed Button Is [WARNING]
  factory BtnSettings.filedWarring({
    required String title,
    required VoidCallback onTap,
    bool? loading,
    Color? color,
    Color? borderColor,
    Color? textColor,
    double? fontSize,
    FontWeight fontWeight = FontWeight.bold,
    double? height,
    double? width,
    double? horizontalPadding,
    Widget? body,
  }) {
    return BtnSettings(
      title: title,
      onTap: onTap,
      loading: loading,
      textColor: textColor ?? Colors.white,
      color: color ?? AppColors.red.withOpacity(0.66),
      borderColor: borderColor ?? AppColors.red.withOpacity(0.66),
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      width: width,
      horizontalPadding: horizontalPadding,
      enableBorder: true,
      body: body,
    );
  }

  /// This BtnSettings for enableBorder [BtnSettings] for the Filed Button Is [Succeeded]
  factory BtnSettings.filedSucceeded({
    required String title,
    required VoidCallback onTap,
    bool? loading,
    Color? color,
    Color? borderColor,
    Color? textColor,
    double? fontSize,
    FontWeight fontWeight = FontWeight.bold,
    double? height,
    double? width,
    double? horizontalPadding,
    Widget? body,
  }) {
    return BtnSettings(
      title: title,
      onTap: onTap,
      loading: loading,
      textColor: textColor ?? Colors.white,
      color: color ?? AppColors.green,
      borderColor: borderColor ?? AppColors.green,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      width: width,
      horizontalPadding: horizontalPadding,
      enableBorder: true,
      body: body,
    );
  }

  /// This BtnSettings for enableBorder [BtnSettings] for the Outlined Button Is [WARNING]
  factory BtnSettings.outlinedWarning({
    required String title,
    required VoidCallback onTap,
    bool? loading,
    Color? color,
    Color? borderColor,
    Color? textColor,
    double? fontSize,
    FontWeight fontWeight = FontWeight.bold,
    double? height,
    double? width,
    double? horizontalPadding,
    Widget? body,
  }) {
    return BtnSettings(
      title: title,
      onTap: onTap,
      loading: loading,
      color: color ?? Colors.white,
      borderColor: borderColor ?? AppColors.red,
      textColor: textColor ?? AppColors.red,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      width: width,
      horizontalPadding: horizontalPadding,
      enableBorder: true,
      body: body,
    );
  }
}
