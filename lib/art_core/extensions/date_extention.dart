import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;

extension StringToDateTime on String {
  DateTime toDateTime() {
    try {
      return DateTime.parse(this);
    } catch (e) {
      throw FormatException('Invalid date format: $this');
    }
  }
}

extension FormatDateTime on String? {
  //? To 10-02-2023
  String get formatedDate {
    if (this == null) return '';
    try {
      final String date = this ?? DateTime.now().toString();
      DateTime dateTime = DateTime.parse(date);
      return '${dateTime.day}-${dateTime.month}-${dateTime.year}';
    } catch (e) {
      throw FormatException('Invalid date format: $this');
    }
  }
  //10 may 2025
  String get formatedDateWithMonth {
    if (this == null) return '';
    if (this !=null && this!.isEmpty) return '';
    try {
      final String date = this ?? DateTime.now().toString();
      DateTime dateTime = DateTime.parse(date);
      return DateFormat('dd MMMM yyyy').format(dateTime);
    } catch (e) {
      throw FormatException('Invalid date format: $this');
    }
  }
}


extension DateTimeAgoLocalized on DateTime {
  String timeAgo(BuildContext context) {
    final now = DateTime.now();
    final diff = now.difference(this);
    final isArabic = Directionality.of(context) == TextDirection.rtl;

    if (diff.inSeconds < 60) {
      return isArabic ? 'منذ ثوانٍ' : 'just now';
    } else if (diff.inMinutes < 60) {
      final count = diff.inMinutes;
      return isArabic
          ? 'منذ ${_arabicNumber(count)} دقيقة'
          : '$count minute${count > 1 ? 's' : ''} ago';
    } else if (diff.inHours < 24) {
      final count = diff.inHours;
      return isArabic
          ? 'منذ ${_arabicNumber(count)} ${_pluralAr('ساعة', count)}'
          : '$count hour${count > 1 ? 's' : ''} ago';
    } else if (diff.inDays < 7) {
      final count = diff.inDays;
      return isArabic
          ? 'منذ ${_arabicNumber(count)} ${_pluralAr('يوم', count)}'
          : '$count day${count > 1 ? 's' : ''} ago';
    } else if (diff.inDays < 30) {
      final count = (diff.inDays / 7).floor();
      return isArabic
          ? 'منذ ${_arabicNumber(count)} ${_pluralAr('أسبوع', count)}'
          : '$count week${count > 1 ? 's' : ''} ago';
    } else if (diff.inDays < 365) {
      final count = (diff.inDays / 30).floor();
      return isArabic
          ? 'منذ ${_arabicNumber(count)} ${_pluralAr('شهر', count)}'
          : '$count month${count > 1 ? 's' : ''} ago';
    } else {
      final count = (diff.inDays / 365).floor();
      return isArabic
          ? 'منذ ${_arabicNumber(count)} ${_pluralAr('سنة', count)}'
          : '$count year${count > 1 ? 's' : ''} ago';
    }
  }

  String _pluralAr(String word, int count) {
    if (count == 1) return word;
    switch (word) {
      case 'ساعة':
        return 'ساعات';
      case 'يوم':
        return 'أيام';
      case 'أسبوع':
        return 'أسابيع';
      case 'شهر':
        return 'أشهر';
      case 'سنة':
        return 'سنوات';
      default:
        return word;
    }
  }

  String _arabicNumber(int number) {
    const arabicNums = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number
        .toString()
        .split('')
        .map((d) => arabicNums[int.parse(d)])
        .join();
  }
}

extension StringDateTimeAgo on String {
  String timeAgoFromString(BuildContext context) {
    try {
      final date = DateTime.parse(this).toLocal();
      return date.timeAgo(context);
    } catch (e) {
      return '';
    }
  }
}


