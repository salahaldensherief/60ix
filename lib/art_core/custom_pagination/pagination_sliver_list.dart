import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixty_ix/modules/art_core/custom_pagination/pagination_cubit.dart';
import 'package:sixty_ix/modules/art_core/custom_pagination/pagination_state.dart';
import '../request_ui/request_ui_helper.dart';
import '../widgets/loading/loading_view.dart';

class PaginatedSliverList<T> extends StatelessWidget {
  final PaginatedCubit<T> cubit;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final EdgeInsetsGeometry? padding;

  const PaginatedSliverList({
    super.key,
    required this.cubit,
    required this.itemBuilder,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedCubit<T>, PaginatedState<T>>(
      bloc: cubit,
      builder: (context, state) {
        if (!state.isLoading && state.items.isEmpty) {
          return SliverToBoxAdapter(
            child: emptyWidget ?? const EmptyWidget(),
          );
        }

        if (state.isLoading && state.items.isEmpty) {
          return SliverToBoxAdapter(
            child: loadingWidget ?? const LoadingView(),
          );
        }

        if (state.isError && state.items.isEmpty) {
          return SliverToBoxAdapter(
            child: errorWidget ?? EmptyWidget(message: state.errorMessage),
          );
        }

        return SliverPadding(
          padding: padding ?? EdgeInsets.zero,
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                if (index == state.items.length) {
                  // ✅ وصلنا لآخر عنصر، نعمل load more
                  if (!state.isLoading &&
                      !state.isAppending &&
                      state.hasMore) {
                    cubit.fetchNextPage();
                  }
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CupertinoActivityIndicator()),
                  );
                }
                return itemBuilder(context, state.items[index], index);
              },
              childCount: state.items.length + (state.hasMore ? 1 : 0),
            ),
          ),
        );
      },
    );
  }
}


