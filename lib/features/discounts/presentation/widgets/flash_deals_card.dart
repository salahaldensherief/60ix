import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/features/discounts/presentation/widgets/service_card.dart';

import '../../../../art_core/extensions/padding.dart';
import '../../../../art_core/utils/assets_data.dart';

class FlashDealsCard extends StatelessWidget {
  FlashDealsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme
        .of(context)
        .textTheme;

    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            SizedBox(
              width: 340.w,
              child: ServiceCard(direction: Axis.horizontal,
                  serviceTitle: AppStrings.veterinaryCare.tr(),
                  centerName:AppStrings.animalCareCenter.tr(),
                  image: AssetsData.horse,
                  serviceLogo: AssetsData.animalCareLogo,
                  price: '100',
                  oldPrice: '150',
                  rating: '4.5').padOnly(right: 10),
            ),
      ),
    );
  }

}
