import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ix/art_core/extensions/padding.dart';
import 'package:ix/art_core/utils/assets_data.dart';
import 'package:ix/art_core/widgets/appbar/custom_app_bar.dart';
import 'package:ix/art_core/widgets/scroll/mini_scroll_widget.dart';
import 'package:ix/features/discounts/presentation/widgets/bottom_bar_widget.dart';
import 'package:ix/features/discounts/presentation/widgets/branch_list_widget.dart';
import 'package:ix/features/discounts/presentation/widgets/branch_selector_widget.dart';
import 'package:ix/features/discounts/presentation/widgets/choose_optoins_widget.dart';
import 'package:ix/features/discounts/presentation/widgets/coupon_widget.dart';
import 'package:ix/features/discounts/presentation/widgets/title_price_widget.dart';
import 'package:ix/features/discounts/presentation/widgets/vendor_card_widget.dart';

class GetDiscountServiceScreen extends StatefulWidget {
  const GetDiscountServiceScreen({super.key});

  @override
  State<GetDiscountServiceScreen> createState() =>
      _GetDiscountServiceScreenState();
}

class _GetDiscountServiceScreenState extends State<GetDiscountServiceScreen> {
  int _selectedBranchIndex = 0;
  bool _showOptions = false;

  late final ScrollController _imageScrollController;

  @override
  void initState() {
    super.initState();
    _imageScrollController = ScrollController();
  }

  @override
  void dispose() {
    _imageScrollController.dispose();
    super.dispose();
  }

  void _onChooseOptions() {
    setState(() => _showOptions = true);
  }

  void _onBranchSelected(int index) {
    setState(() => _selectedBranchIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBarWidget(),
      appBar: CustomAppBar(title: 'Veterinary Care', showBack: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.rectangle),
                  child: Image.asset(AssetsData.horse),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  left: 0,
                  child: MiniScrollbar(controller: _imageScrollController),
                ),
              ],
            ),

            const TitlePriceWidget(),

            SizedBox(height: 4.h),
            const VendorCardWidget(),

            SizedBox(height: 14.h),

            BranchSelectorWidget(
              onChooseBranch: () => setState(() => _showOptions = false),
              isOptionsSelected: _showOptions,
              onChooseOptions: _onChooseOptions,
            ),

            SizedBox(height: 14.h),

            if (_showOptions)
              const OptionsWidget()
            else
              BranchListWidget(
                selectedIndex: _selectedBranchIndex,
                onBranchSelected: _onBranchSelected,
              ),

            SizedBox(height: 16.h),

            const CouponWidget(),

            SizedBox(height: 20.h),
          ],
        ).padSymmetric(horizontal: 20),
      ),
    );
  }
}
