part of 'toasts.dart';

class AppToast {
  /// Show info Toast
  static void info(String msg) {
    _CustomToast.showToast(msg: msg, states: ToastStates.NORMAL);
  }

  /// Show success Toast
  static void success(String msg) {
    _CustomToast.showToast(msg: msg, states: ToastStates.SUCCESS);
  }

  /// Show error Toast
  static void error(String msg) {
    _CustomToast.showToast(msg: msg, states: ToastStates.ERROR);
  }

  /// Show warning toast
  static void warning(String msg) {
    _CustomToast.showToast(msg: msg, states: ToastStates.WARNING);
  }

  /// Show error Toast catch
  static void showErrorMessageCatch({
    required dynamic e,
    required StackTrace s,
  }) {
    _CustomToast.showToast(msg: "Catch error $e $s", states: ToastStates.ERROR);
  }

  static void cancelToast() {
    _CustomToast.cancelToast();
  }

  /// Show snackbar Toast
  static void showSnackBar({
    required String msg,
    Color? backgroundColor,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 5,
        dismissDirection: DismissDirection.vertical,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: backgroundColor ?? AppColors.primary,
        content: AppText(color: AppColors.white, text: msg),
      ),
    );
  }
}
