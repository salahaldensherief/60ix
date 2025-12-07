import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/art_core/request_ui/request_ui_helper.dart';
import 'package:sixty_ix/modules/core/core.dart';

class GlobalStateHandlerView extends StatelessWidget {
  final GlobalState state;
  final Widget? loadingView, errorView, emptyView;
  final Widget successView;

  final String? errorMassage;

  final RefreshCallback? onRefresh;

  const GlobalStateHandlerView({
    super.key,
    this.state = GlobalState.initial,
    this.loadingView,
    this.errorView,
    this.emptyView,
    required this.successView,
    this.errorMassage,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = state.isLoading;
    final isError = state.isError;
    final isSuccess = state.isSuccess;
    final noInternet = state.isNoInternet;
    final isEmpty = state.isEmpty;

    return RefreshIndicator(
      onRefresh: onRefresh ?? () async {},

      child: Builder(
        builder: (context) {
          if (isLoading) {
            return loadingView ?? LoadingView();
          }
          if (isError) {
            return errorView ?? CustomEmptyViewList(title: errorMassage);
          }
          if (noInternet) {
            return CustomEmptyViewList(title: AppString.noInternetConnection.tr());
          }
          if (isEmpty) {
            return emptyView ?? EmptyWidget();
          }
          if (isSuccess) {
            return successView;
          }
          return SizedBox();
        },
      ),
    );
  }
}
