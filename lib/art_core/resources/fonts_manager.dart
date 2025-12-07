import 'package:sixty_ix/modules/core/constants/app_config.dart';

class FontsManager {
  static String get fontFamily => AppConfig.isArabic ? _arabicFontFamily : _englishFontFamily;

  // Fonts
  static const String _arabicFontFamily = _familyMontserrat;
  static const String _englishFontFamily = "Cairo";
  static const String _familyMontserrat = 'Montserrat';


}
