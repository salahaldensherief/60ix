part of 'extensions.dart';

extension LanguageX on String {
  // This extension is used to translate the text
  // String get tr {
  //   return this;
  // }

  // This extension is used to detect the language of the text

  bool get isArabic {
    RegExp arabicRegExp = RegExp(r'[\u0600-\u06FF]+');
    return arabicRegExp.hasMatch(this);
  }

  bool get isEnglish {
    RegExp englishRegExp = RegExp(r'[A-Za-z]+');
    return englishRegExp.hasMatch(this);
  }

  String capitalizeFirst() {
    if (isEmpty) return '';
    return this[0].toUpperCase() + substring(1);
  }
}
