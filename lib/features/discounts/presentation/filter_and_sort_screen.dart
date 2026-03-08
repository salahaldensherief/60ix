import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/utils/app_colors.dart';
import 'package:ix/art_core/utils/assets_data.dart';
import 'package:ix/art_core/widgets/appbar/custom_app_bar.dart';
import 'package:ix/art_core/widgets/buttons/custom_button.dart';
import 'package:ix/features/discounts/presentation/widgets/apply_and_reset_filters.dart';
import 'package:ix/features/discounts/presentation/widgets/city_field_widget.dart';
import 'package:ix/features/discounts/presentation/widgets/filter_by_widget.dart';
import 'package:ix/features/discounts/presentation/widgets/rating_widget.dart';
import 'package:ix/features/discounts/presentation/widgets/sort_by_widget.dart';

class FilterAndSortScreen extends StatelessWidget {
  FilterAndSortScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(
        size: 50,
        showBack: true, title: 'Sort & Filter',showElevation: true,),
      body: SafeArea(
        minimum: EdgeInsets.only(top: 10),
        top: true,
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            FilterByWidget(),
            FilterByWidget(),
            CityFieldWidget(),
            RatingWidget(),
            SortByWidget(),
            ApplyAndResetFilters(theme: theme),
        
          ],
        ).padOnly(left: 20),
      ),
    );
  }
}
