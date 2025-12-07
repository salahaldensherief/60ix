part of 'toasts.dart';

class _CustomToast {
  static Future showToast({
    required String msg,
    ToastStates states = ToastStates.NORMAL,
    Color? toastColor,
    Color? textColor,
    ToastGravity gravity = ToastGravity.BOTTOM,
    int time = 2,
    bool showAllText = true,
    int maxCharacters = 200,
    double fontSize = 16,
  }) {
    if (!showAllText && msg.length > maxCharacters) {
      msg = '${msg.substring(0, maxCharacters)}...';
    }

    return Fluttertoast.showToast(
      msg: " $msg ",
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: time,
      backgroundColor: toastColor ?? _chooseToastColor(states),
      textColor: textColor ?? _chooseTextColor(states),
      fontSize: fontSize,
    );
  }

  static cancelToast() {
    return Fluttertoast.cancel();
  }

  static Color _chooseToastColor(ToastStates states) {
    Color color;
    switch (states) {
      case ToastStates.SUCCESS:
        color = Colors.green;
      case ToastStates.WARNING:
        color = Colors.orange;
      case ToastStates.ERROR:
        color = Colors.red;
      case ToastStates.NORMAL:
        color = AppColors.primary;
    }
    return color;
  }

  static Color _chooseTextColor(ToastStates states) {
    Color color;
    switch (states) {
      // case ToastStates.SUCCESS:
      //   color = Colors.green;
      // case ToastStates.WARNING:
      //   color = Colors.orange;
      // case ToastStates.ERROR:
      //   color = Colors.red;
      // case ToastStates.NORMAL:
      //   color = AppColors.primaryColor;
      default:
        color = Colors.white;
    }
    return color;
  }
}

enum ToastStates { SUCCESS, WARNING, ERROR, NORMAL }
