import 'package:flutter/material.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/features/discounts/presentation/widgets/filter_section_name_widget.dart';

import '../../../auth/presentation/signup/widgets/custom_check_box.dart';

class SortByWidget extends StatelessWidget {
  const SortByWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FilterSectionNameWidget(),
        SizedBox(height: 8,),
        _buildSortByRow(theme),
        SizedBox(height: 8,),

        _buildSortByRow(theme),
        SizedBox(height: 8,),

        _buildSortByRow(theme),
        SizedBox(height: 8,),

        _buildSortByRow(theme),
      ],
    ).padOnly(left: 6,top: 16,right: 8);
  }

  Row _buildSortByRow(TextTheme theme) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Price Low to High',style: theme.titleLarge,),
          CustomCheckBox(
            isChecked: true,
            onChecked: (value) {},
          ),
        ],
      );
  }
}
