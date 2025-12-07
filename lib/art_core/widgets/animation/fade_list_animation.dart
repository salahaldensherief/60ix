part of 'animation.dart';

class FadeListAnimation extends StatefulWidget {
  final Widget child;

  const FadeListAnimation({required this.child, Key? key}) : super(key: key);

  @override
  _FadeListAnimationState createState() => _FadeListAnimationState();
}

class _FadeListAnimationState extends State<FadeListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _fadeAnimation, child: widget.child);
  }
}
