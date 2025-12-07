part of 'enums.dart';

enum GlobalState {
  initial,
  loading,
  success,
  error,
  refreshing,
  empty,
  noInternet;

  bool get isInitial => this == GlobalState.initial;
  bool get isLoading => this == GlobalState.loading;
  bool get isSuccess => this == GlobalState.success;
  bool get isEmpty => this == GlobalState.empty;
  bool get isError => this == GlobalState.error;
  bool get isNoInternet => this == GlobalState.noInternet;
  bool get isRefreshing => this == GlobalState.refreshing;
}