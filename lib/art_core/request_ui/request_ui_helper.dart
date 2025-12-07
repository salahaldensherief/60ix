import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import '../../core/enums/enums.dart';
import '../resources/app_styles.dart';
import '../widgets/empty_view/empty_search.dart';
part "widgets/empty_widget.dart";
part "widgets/error_widget.dart";

typedef StateGetter<S> = GlobalState Function(S state);

class RequestUiHelper<B extends BlocBase<S>, S> extends StatelessWidget {
  /// Function to extract the `GlobalState` from a given state
  final StateGetter<S> state;

  /// Callback for refresh
  final RefreshCallback? onRefresh;

  /// Widget shown when data is successfully loaded
  final Widget Function(S state) successWidget;

  /// Custom error, loading, empty, and no-internet views
  final Widget? errorWidget;

  /// Custom widgets for the no-internet state (optional)
  final Widget? noInternetWidget;

  /// Custom loading view (optional)
  final Widget? loadingView;

  /// Custom Empty view (optional)
  final Widget? emptyView;

  /// Message used in default error widget
  final String? errorMessage;

  /// Optional BlocConsumer listener
  final void Function(BuildContext, S)? listener;

  const RequestUiHelper({
    super.key,
    required this.state,
    this.onRefresh,
    required this.successWidget,
    this.errorWidget,
    this.noInternetWidget,
    this.errorMessage,
    this.loadingView,
    this.emptyView,
    this.listener,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh ?? () async {},
      child: BlocConsumer<B, S>(
        bloc: Modular.get<B>(),
        listener: listener ?? (_, __) {},
        builder: (context, S s) {
          final GlobalState currentState = state(s);
          return switch (currentState) {
            GlobalState.loading =>
              loadingView ?? const Center(child: CircularProgressIndicator()),
            GlobalState.empty => emptyView ?? EmptySearch(),
            GlobalState.error =>
              errorWidget ?? ErrorWidget(errorMessage: errorMessage),
            GlobalState.noInternet =>
              noInternetWidget ??
                  ErrorWidget(
                    noInternet: true,
                    errorMessage: AppString.noInternetConnection.tr(),
                  ),
            _ => successWidget(s),
          };
        },
      ),
    );
  }
}
