import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/utils/app_strings.dart';
import 'package:ix/features/discounts/presentation/get_discount_service_screen.dart';
import 'package:ix/features/discounts/presentation/widgets/service_card.dart';
import '../../../../art_core/utils/assets_data.dart';

class ServicesCardsGridView extends StatelessWidget {
  const ServicesCardsGridView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        return ServiceCard(
          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetDiscountServiceScreen(),)),
          direction: Axis.vertical,
          serviceTitle: AppStrings.veterinaryCare.tr(),
          centerName: AppStrings.animalCareCenter.tr(),
          image: AssetsData.horse,
          serviceLogo: AssetsData.animalCareLogo,
          price: '100.00',
          oldPrice: '150.00',
          rating: '4.5',
        );
      },
    );
  }
}
