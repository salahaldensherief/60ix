part of '../shared_app_widgets.dart';

enum SortPriceType {
  lowToHigh(0), //ASC
  highToLow(1);//DESC

  final int value;
  const SortPriceType(this.value);

  String get label {
    return switch (this) {
      SortPriceType.lowToHigh => AppString.lowToHigh.tr(),
      SortPriceType.highToLow => AppString.highToLow.tr(),
    };
  }
}

class ToggleSortPrice extends StatefulWidget {
  final SortPriceType? initialSortPrice;
  final ValueChanged<SortPriceType?>? onSortPriceSelected;
  const ToggleSortPrice({super.key, this.initialSortPrice, this.onSortPriceSelected});

  @override
  State<ToggleSortPrice> createState() => _ToggleSortPriceState();
}

class _ToggleSortPriceState extends State<ToggleSortPrice> {
  SortPriceType? _selectedSortType;

  void _onSortPriceSelected(SortPriceType sortPrice) {
    setState(() {
      _selectedSortType = _selectedSortType == sortPrice ? null : sortPrice;
    });
    if (widget.onSortPriceSelected != null) widget.onSortPriceSelected!(_selectedSortType);
  }

  @override
  void initState() {
    super.initState();
    _selectedSortType = widget.initialSortPrice;
  }

  @override
  void didUpdateWidget(covariant ToggleSortPrice oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialSortPrice != oldWidget.initialSortPrice) {
      _selectedSortType = widget.initialSortPrice;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 12.w,
      children: SortPriceType.values.map((type) {
        final isSelected = _selectedSortType == type;
        return Expanded(
          child: GestureDetector(
            onTap: () => _onSortPriceSelected(type),
            child: _SortPriceToggleCard(
              isSelected: isSelected,
              type: type,
            ),
          ),
        );
      }).toList()
    );
  }
}

class _SortPriceToggleCard extends StatelessWidget {
  final bool isSelected;
  final SortPriceType type;

  const _SortPriceToggleCard({
    required this.isSelected,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: isSelected ? AppColors.primary.shade50 : AppColors.cardBackground,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.borderColor,
          width: 1.5.w,
        ),
      ),
      child: Center(
        child: AppText(
          text: type.label,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: isSelected ? AppColors.primary : null,
        ),
      ),
    );
  }
}
