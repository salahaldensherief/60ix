import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/art_core/request_ui/request_ui_helper.dart';
import 'package:sixty_ix/modules/art_core/widgets/empty_view/empty_search.dart';

import 'pagination_cubit.dart';
import 'pagination_state.dart';

class PaginatedListView<T> extends StatelessWidget {
  final PaginatedCubit<T> cubit;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;
  final bool enableRefresh;
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  final Axis? scrollDirection;

  const PaginatedListView({
    super.key,
    required this.cubit,
    required this.itemBuilder,
    this.loadingWidget,
    this.emptyWidget,
    this.shrinkWrap = false,
    this.errorWidget,
    this.scrollController,
    this.physics,
    this.padding,
    this.scrollDirection,
    this.enableRefresh = true,
  });

  @override
  Widget build(BuildContext context) {
    final controller = scrollController ?? ScrollController();

    controller.addListener(() {
      if (controller.position.pixels >=
              controller.position.maxScrollExtent - 300 &&
          !cubit.state.isLoading &&
          !cubit.state.isAppending &&
          cubit.state.hasMore) {
        cubit.fetchNextPage();
      }
    });

    return BlocBuilder<PaginatedCubit<T>, PaginatedState<T>>(
      bloc: cubit,
      builder: (context, state) {
        if (!state.isLoading && state.items.isEmpty) {
          return emptyWidget ?? EmptyWidget();
        }

        if (state.isLoading || state.items.isEmpty) {
          return loadingWidget ?? LoadingView();
        }

        if (state.isError && state.items.isEmpty) {
          return errorWidget ?? EmptyWidget(message: state.errorMessage);
        }

        if (state.items.isEmpty) {
          return emptyWidget ?? EmptySearch();
        }

        Widget list = ListView.separated(
          scrollDirection: scrollDirection ?? Axis.vertical,
          controller: controller,
          padding: padding ?? const EdgeInsets.all(16),
          shrinkWrap: shrinkWrap ?? false,
          physics: physics,
          itemCount: state.items.length + (state.hasMore ? 1 : 0),
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemBuilder: (context, index) {
            if (index < state.items.length) {
              return itemBuilder(context, state.items[index], index);
            } else {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: CupertinoActivityIndicator()),
              );
            }
          },
        );

        if (enableRefresh) {
          return RefreshIndicator(
            onRefresh: () => cubit.refresh(),
            child: list,
          );
        }

        return list;
      },
    );
  }
}

class PaginatedGridView<T> extends StatelessWidget {
  final PaginatedCubit<T> cubit;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;
  final bool enableRefresh;
  final bool? shrinkWrap;
  final ScrollPhysics? physics;

  const PaginatedGridView({
    super.key,
    required this.cubit,
    required this.itemBuilder,
    this.loadingWidget,
    this.emptyWidget,
    this.shrinkWrap = false,
    this.errorWidget,
    this.scrollController,
    this.physics,
    this.padding,
    this.enableRefresh = true,
  });

  @override
  Widget build(BuildContext context) {
    final controller = scrollController ?? ScrollController();

    controller.addListener(() {
      if (controller.position.pixels >=
              controller.position.maxScrollExtent - 300 &&
          !cubit.state.isLoading &&
          !cubit.state.isAppending &&
          cubit.state.hasMore) {
        cubit.fetchNextPage();
      }
    });

    return BlocBuilder<PaginatedCubit<T>, PaginatedState<T>>(
      bloc: cubit,
      builder: (context, state) {
        if (!state.isLoading && state.items.isEmpty) {
          return emptyWidget ?? EmptyWidget();
        }

        if (state.isLoading || state.items.isEmpty) {
          return loadingWidget ?? LoadingView();
        }

        if (state.isError && state.items.isEmpty) {
          return errorWidget ?? EmptyWidget(message: state.errorMessage);
        }

        if (state.items.isEmpty) {
          return emptyWidget ?? EmptySearch();
        }

        Widget list = GridView.builder(
          controller: controller,
          physics: physics,
          padding: padding ?? const EdgeInsets.all(16),
          shrinkWrap: shrinkWrap ?? false,
          itemCount: state.items.length + (state.hasMore ? 1 : 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: (1.sw / 2 - 24.w) / 238.h,
          ),
          itemBuilder: (context, index) {
            if (index < state.items.length) {
              return itemBuilder(context, state.items[index], index);
            }
            // else {
            //   return Container(
            //     color: Colors.purple,
            //     height: 20,
            //     width: 20,
            //     child: Center(
            //       child: const Padding(
            //         padding: EdgeInsets.symmetric(vertical: 0),
            //         child: Center(child: CupertinoActivityIndicator(color: Colors.amber,)),
            //       ),
            //     ),
            //   );
            // }
          },
        );

        if (enableRefresh) {
          return RefreshIndicator(
            onRefresh: () => cubit.refresh(),
            child: list,
          );
        }

        return list;
      },
    );
  }
}
