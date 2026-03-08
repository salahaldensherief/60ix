import 'package:flutter/material.dart';

import '../../../../art_core/extensions/padding.dart';
import '../../../../art_core/widgets/drop_down_menu/drop_down_menu_widget.dart';
import 'filter_section_name_widget.dart';

class CityFieldWidget extends StatelessWidget {
  const CityFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionNameWidget(),
        const DropDownMenuWidget(

          text: 'Select city ...',
          radius: Radius.circular(24),

          hintText: 'City',
          dropdownMenuEntries: [],
        ).padOnly(right: 16,bottom: 16),

      ],
    );
  }
}
