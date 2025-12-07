part of 'animation.dart';

class AnimatedAppList<T> extends StatelessWidget {
  final VoidCallback? onRefresh;
  final CardBodyModel<T> body;

  const AnimatedAppList({super.key, this.onRefresh, required this.body});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh?.call();
      },
      child: RawScrollbar(
        thumbColor: Colors.grey[200],
        child: RepaintBoundary(
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: body.items.length,
            addAutomaticKeepAlives: true,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            separatorBuilder: (_, __) => const SizedBox(height: 20),
            itemBuilder: (BuildContext context, int index) {
              final model = body.items[index];
              return FadeListAnimation(child: body.cardItem(model));
            },
          ),
        ),
      ),
    );
  }
}

class CardBodyModel<T> {
  final Widget Function(T) cardItem;
  final List<T> items;

  const CardBodyModel({
    required this.cardItem,
    required this.items,
  });
}
