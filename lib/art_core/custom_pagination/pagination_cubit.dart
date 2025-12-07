import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' ;

import '../../core/networking/error_response.dart';
import '../../core/networking/network_mappers.dart';
import 'list_response_pagination.dart';
import 'pagination_params.dart';
import 'pagination_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PaginatedCubit<T> extends Cubit<PaginatedState<T>> {
  final Future<Either<BasicFailure, BaseMappable>> Function(PaginatedParams) fetchFunction;
  PaginatedParams _params;

  PaginatedCubit({
    required this.fetchFunction,
    required PaginatedParams initialParams,
  })  : _params = initialParams,
        super(  PaginatedState<T>());

  Future<void> fetchFirstPage() async {

    final isFirstPage =  _params.page == 1 || state.currentPage == 1;

    final bool enableLoading = isFirstPage && state.items.isEmpty;


    print("==== fetchFirstPage==== $isFirstPage. =======enableLoading. $enableLoading ");
    if (enableLoading) {

      emit(state.copyWith(status: PaginatedStatus.loading, currentPage: 1));
    } else {
      emit(state.copyWith(status: PaginatedStatus.refreshing, currentPage: 1));
    }
    _params.page = 1;

    final res = await fetchFunction(_params);

    res.fold(
          (error) => emit(state.copyWith(status: PaginatedStatus.error, errorMessage: error.errorMassage)),
          (rawResult) {
        final result = rawResult as ListResponsePagination<T>; // ✅ fix
        emit(state.copyWith(
          items: result.items,
          currentPage: result.currentPage,
          hasMore: result.hasMore,
          status: PaginatedStatus.success,
        ));
      },
    );
  }

  Future<void> fetchNextPage() async {
    if (!state.hasMore || state.isAppending) return;

    emit(state.copyWith(status: PaginatedStatus.appending));
    _params.page = state.currentPage + 1;

    final res = await fetchFunction(_params);

    res.fold(
          (error) => emit(state.copyWith(status: PaginatedStatus.error, errorMessage: error.errorMassage)),
          (rawResult) {
        final result = rawResult as ListResponsePagination<T>;
        emit(state.copyWith(
          items: [...state.items, ...result.items],
          currentPage: result.currentPage,
          hasMore: result.hasMore,
          status: PaginatedStatus.success,
        ));
      },
    );
  }

  void updateParams(PaginatedParams newParams) {
    _params = newParams;
    fetchFirstPage();
  }

  Future<void> refresh() async {

    emit(state.copyWith(status: PaginatedStatus.refreshing, currentPage: 1));
    _params.page = 1;

    final res = await fetchFunction(_params);

    res.fold(
          (error) => emit(state.copyWith(status: PaginatedStatus.error, errorMessage: error.errorMassage)),
          (rawResult) {
        final result = rawResult as ListResponsePagination<T>;
        emit(state.copyWith(
          items: result.items,
          currentPage: result.currentPage,
          hasMore: result.hasMore,
          status: PaginatedStatus.success,
        ));
      },
    );
  }

  void reset(){
    if(state.items.isNotEmpty) state.clearItems();
  }

}
