part of 'dialogs.dart';

void showCustomDialog({required Widget content}) {
  final context = Modular.routerDelegate.navigatorKey.currentContext;
  showGeneralDialog(
    context: context!,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            margin: REdgeInsets.symmetric(horizontal: 16.0),
            padding: REdgeInsets.fromLTRB(20, 25, 20, 25),
            decoration: BoxDecoration(
              color: AppColors.getCardBackground(context),
              borderRadius: BorderRadius.circular(40.0.r),
            ),
            child: content,
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}