enum PaginatedStatus { initial, loading, success, error, refreshing, appending }

class PaginatedState<T> {
  final List<T> items;
  final int currentPage;
  final bool hasMore;
  final PaginatedStatus status;
  final String? errorMessage;

  const PaginatedState({
    this.items = const [],
    this.currentPage = 1,
    this.hasMore = true,
    this.status = PaginatedStatus.initial,
    this.errorMessage,
  });

  bool get isInitial => status == PaginatedStatus.initial;
  bool get isLoading => status == PaginatedStatus.loading;
  bool get isRefreshing => status == PaginatedStatus.refreshing;
  bool get isAppending => status == PaginatedStatus.appending;
  bool get isSuccess => status == PaginatedStatus.success;
  bool get isError => status == PaginatedStatus.error;

  PaginatedState<T> copyWith({
    List<T>? items,
    int? currentPage,
    bool? hasMore,
    PaginatedStatus? status,
    String? errorMessage,
  }) {
    return PaginatedState<T>(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  void clearItems(){
    items.clear();
  }
}
