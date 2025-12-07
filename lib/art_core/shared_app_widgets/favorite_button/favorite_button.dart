part of '../shared_app_widgets.dart';

class FavoriteButton extends StatefulWidget {
  final MainTypesEnum type;
  final int modelId;
  final bool? initialValue;
  final int? initialCount;
  final bool showToast;
  final void Function(bool isFav, int count)? onToggle;

  final BaseFavoriteStyle? style;

  const FavoriteButton({
    super.key,
    required this.type,
    required this.modelId,
    this.initialValue,
    this.initialCount,
    this.showToast = true,
    this.onToggle,
    this.style,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}


class _FavoriteButtonState extends State<FavoriteButton> {
  String get _key => '${widget.type.name}_${widget.modelId}';

  @override
  Widget build(BuildContext context) {
    final widgetStyle = widget.style ?? DefaultFavoriteStyle();
    final bool guestUser = AppConfig.isGuestUser;
    // Modular.get<PreferenceManager>().isOpenAsGuestUser()!;
    final cubit = Modular.get<FavouritesCubit>();
    final key = _key;
    if (widget.initialValue != null &&
        !cubit.state.favoritesStatus.containsKey(key)) {
      cubit.setInitialFavorite(
        widget.type,
        widget.modelId,
        widget.initialValue!,
      );
    }

    if (widget.initialCount != null &&
        !cubit.state.favoritesCount.containsKey(key)) {
      cubit.setInitialCount(widget.type, widget.modelId, widget.initialCount!);
    }

    // if (guestUser) return const SizedBox();

    return BlocSelector<FavouritesCubit, FavouriteState, bool>(
      bloc: cubit,
      selector: (state) => state.favoritesStatus[_key] ?? false,
      builder: (context, isFav) {
        final key = '${widget.type.name}_${widget.modelId}';
        final count =
            cubit.state.favoritesCount[key] ?? widget.initialCount ?? 0;

        return GestureDetector(
          // key: Key(_key),
          onTap: () async {
            if (guestUser) {
              CheckLoginView.show();
              return;
            }
            // await cubit.toggleFavourite(type: type, modelId: modelId);

            // final newState = cubit.state.favoritesStatus[_key] ?? !isFav;
            // onToggle?.call(newState); // ✅ call after update

            final key = '${widget.type.name}_${widget.modelId}';
            final isFavNow = cubit.state.favoritesStatus[key] ?? false;

            final count = await cubit.toggleFavourite(
              type: widget.type,
              modelId: widget.modelId,
              showToast: widget.showToast,
            );

            widget.onToggle?.call(!isFavNow, count);

            setState(() {});
          },
          child: widgetStyle.build(isFav: isFav, count: count),

        );
      },
    );
  }

  // Widget _defaultFavoriteWidget(bool isFav) {
  //   final bgColor =
  //       AppConfig.isDarkMode
  //           ? AppColors.lightBlueGrey
  //           : AppColors.white.withOpacity(0.85);
  //
  //   final iconColor =
  //       AppConfig.isDarkMode
  //           ? (isFav ? AppColors.white : AppColors.grey.shade50)
  //           : (isFav ? AppColors.white : AppColors.blue);
  //
  //   final borderColor =
  //       AppConfig.isDarkMode
  //           ? AppColors.lightBlueGrey
  //           : (isFav ? AppColors.primary.shade50 : AppColors.stroke);
  //
  //   return Container(
  //     height: 36.h,
  //     width: 36.w,
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       color: bgColor,
  //       border: Border.all(color: borderColor, width: 2.0),
  //       boxShadow: [AppStyles.shadowMedium],
  //     ),
  //     child: Center(
  //       child: AnimatedContainer(
  //         height: isFav ? 21.w : null,
  //         width: isFav ? 21.w : null,
  //         padding: isFav ? EdgeInsets.zero : REdgeInsets.all(3),
  //         duration: const Duration(milliseconds: 200),
  //         decoration: BoxDecoration(
  //           color: isFav ? AppColors.primary : Colors.transparent,
  //           shape: BoxShape.circle,
  //         ),
  //         child: Icon(
  //           isFav ? Icons.favorite : Icons.favorite_border,
  //           size: isFav ? 14.sp : 18.sp,
  //           color: iconColor,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
