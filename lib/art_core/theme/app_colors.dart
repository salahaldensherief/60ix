part of 'themes.dart';

class AppColors {
  // Primary Color - #FE5D41
  static const MaterialColor primary = MaterialColor(0xFFFE5D41, <int, Color>{
    0: Color(0xFFFFF8F6),
    50: Color(0xFFFFE9E6),
    100: Color(0xFFFFD4CC),
    200: Color(0xFFFEA99A),
    300: Color(0xFFFE7D67),
    400: Color(0xFFFE5234),
    500: Color(0xFFFE5D41),
    600: Color(0xFFCB1F01),
    700: Color(0xFF981701),
    800: Color(0xFF651001),
    900: Color(0xFF330800),
    950: Color(0xFF190400),
  });

  // Secondary Color - #1C1A30
  static const MaterialColor blue = MaterialColor(0xFF1C1A30, <int, Color>{
    50: Color(0xFFEFEEF6),
    100: Color(0xFFDFDEED),
    200: Color(0xFFBFBDDB),
    300: Color(0xFFA09CC9),
    400: Color(0xFF807BB7),
    500: Color(0xFF1C1A30),
    600: Color(0xFF4D4884),
    700: Color(0xFF3A3663),
    800: Color(0xFF262442),
    900: Color(0xFF131221),
    950: Color(0xFF0A0911),
  });

  // Grey Color - #171721
  static const MaterialColor grey = MaterialColor(0xFF171721, <int, Color>{
    50: Color(0xFFE8E8E9),
    100: Color(0xFFB7B7BA),
    200: Color(0xFF949499),
    300: Color(0xFF64646A),
    400: Color(0xFF45454D),
    500: Color(0xFF171721),
    600: Color(0xFF15151E),
    700: Color(0xFF101017),
    800: Color(0xFF0D0D12),
    900: Color(0xFF0A0A0E),
    950: Color(0xFF050507),
  });

  // Other Colors
  static const Color scaffoldBackgroundLight = Color(0xffFFFFFF);
  static Color scaffoldBackgroundDark = Colors.black;
  static Color primaryDarkColor = Color(0xff1D1D28);

  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFEA4335);
  static const Color yellow = Color(0xFFFFC200);
  static const Color pink = Color(0xFFE02849);
  static const Color green = Color(0xFF1FC069);
  static const Color lightOrange = Color(0xFFFFEBCC);
  static const Color inputField = Color(0xFFF9F8FF);
  static const Color stroke = Color(0xFFEEEEEE);
  static const Color starColor = Color(0xFFFFC200);
  static const Color lightBlue = Color(0xffF4F8FF);
  static const Color disableButton = Color(0xFF949499);
  static const Color darkBlue = Color.fromRGBO(29, 29, 40, 1);
  static const Color lightBlueGrey = Color.fromRGBO(37, 37, 50, 1);

  ///****************** Handle Theme Colors ******************
  // Context-aware color getters
  static Color getScaffoldBackground(BuildContext context) {
    return AppConfig.isDarkModeWithContext(context)
        ? scaffoldBackgroundDark
        : scaffoldBackgroundLight;
  }

  static Color getCardBackground(BuildContext context) {
    return AppConfig.isDarkModeWithContext(context) ? primaryDarkColor : white;
  }

  static Color getTextColor(BuildContext context) {
    return AppConfig.isDarkModeWithContext(context) ? white : blue;
  }

  static Color getIconColor(BuildContext context) {
    return AppConfig.isDarkModeWithContext(context)
        ? grey.shade50
        : primary.shade50;
  }

  static Color getBorderColor(BuildContext context) {
    return AppConfig.isDarkModeWithContext(context)
        ? lightBlueGrey
        : primary.shade50;
  }

  static Color getShimmerBaseColor(BuildContext context) {
    return AppConfig.isDarkModeWithContext(context)
        ? grey.shade400
        : grey.shade50;
  }

  static Color getShimmerHighlightColor(BuildContext context) {
    return AppConfig.isDarkModeWithContext(context) ? grey.shade300 : white;
  }

  static Color getShimmerBackgroundColor(BuildContext context) {
    return AppConfig.isDarkModeWithContext(context)
        ? primaryDarkColor
        : grey.shade50;
  }

  // Static getters (for non-widgets usage or backward compatibility)
  static Color get scaffoldBackground {
    return AppConfig.isDarkMode
        ? scaffoldBackgroundDark
        : scaffoldBackgroundLight;
  }

  static Color get cardBackground {
    return AppConfig.isDarkMode ? primaryDarkColor : white;
  }

  static Color get borderInputField {
    return AppConfig.isDarkMode ? primaryDarkColor : inputField;
  }

  static Color get iconColor {
    return AppConfig.isDarkMode ? Colors.white30 : grey.shade500;
  }

  static Color get textColor {
    return AppConfig.isDarkMode ? grey.shade50 : grey.shade500;
  }

  static Color get shadowColor {
    return AppConfig.isDarkMode ? Color(0x1AE8E8E9) : Color(0x1A000000);
  }

  static Color get borderColor {
    return AppConfig.isDarkMode ? lightBlueGrey : primary.shade50;
  }

  static Color get shimmerBaseColor {
    return AppConfig.isDarkMode ? grey.shade400 : grey.shade50;
  }

  static Color get shimmerHighlightColor {
    return AppConfig.isDarkMode ? grey.shade300 : white;
  }

  static Color get shimmerBackgroundColor {
    return AppConfig.isDarkMode ? primaryDarkColor : grey.shade50;
  }

  static Color customColor({required Color lightColor, Color? darkColor}) {
    return AppConfig.isDarkMode ? darkColor ?? lightColor : lightColor;
  }
}

extension ColorExtension on MaterialColor {
  Color get shade0 => this[0]!;

  Color get shade950 => this[950]!;
}
