import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/art_core/utils/assets_data.dart';
import 'package:ix/art_core/widgets/appbar/home_app_bar.dart';
import 'package:ix/features/discounts/presentation/widgets/explore_categories_widget.dart';
import 'package:ix/features/discounts/presentation/widgets/services_cards_grid_view.dart';
import 'package:ix/features/discounts/presentation/widgets/categories_headline.dart';
import 'package:ix/features/discounts/presentation/widgets/flash_deals_card.dart';
import 'package:ix/features/discounts/presentation/widgets/search_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../art_core/utils/app_colors.dart';

class DiscountsScreen extends StatelessWidget {
  const DiscountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final RefreshController _refreshController =
    RefreshController(initialRefresh: false);
    return Scaffold(
      appBar: HomeAppBar(),
      body:SmartRefresher(
        controller:_refreshController ,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [

            SliverAppBar(
              backgroundColor: AppColors.whiteColor,
              expandedHeight: 105,
              floating: false,
              pinned: false,
              flexibleSpace: const FlexibleSpaceBar(
                background: SearchWidget(),
              ),
            ),

            SliverToBoxAdapter(
              child: CategoriesHeadline(
                icon: AssetsData.flashDealsIcon,
                name1: AppStrings.flash.tr(),
                name2: AppStrings.deals.tr(),
              ).padSymmetric(horizontal: 16),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 16.h)),

            SliverToBoxAdapter(
              child: FlashDealsCard().padOnly(left: 16),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 16.h)),

            SliverToBoxAdapter(
              child: CategoriesHeadline(
                name1: AppStrings.explore.tr(),
                name2: AppStrings.categories.tr(),
                icon: AssetsData.exploreIcon,
              ).padSymmetric(horizontal: 16),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 16.h)),

            SliverToBoxAdapter(
              child: ExploreCategories().padOnly(left: 16),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 16.h)),

            SliverToBoxAdapter(
              child: _buildFilterWidgetAndResults(
                theme,
                    () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    builder: (context) => Container(),
                  );
                },
              ).padOnly(left: 16),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 16.h)),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: const ServicesCardsGridView(),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildFilterWidgetAndResults(TextTheme theme, void Function()? onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 105.w,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: AppColors.textColorDarkPrimary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetsData.sortIcon,
                  color: AppColors.whiteColor,
                ),
                Text(
                  AppStrings.filterSort.tr(),
                  style: theme.labelMedium?.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '343',
                style: theme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(text: ' ${AppStrings.results.tr()}'),
            ],
          ),
        ),
      ],
    );
  }
}
