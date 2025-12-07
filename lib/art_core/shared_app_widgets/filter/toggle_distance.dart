part of '../shared_app_widgets.dart';

enum DistanceType {
  auto(0),
  fiftyKm(50),
  twentyKm(20),
  tenKm(10),
  fiveKm(5),
  oneKm(1);

  final int value;
  const DistanceType(this.value);

}
class ToggleDistance extends StatefulWidget {
  final DistanceType? initialDistance;
  final ValueChanged<DistanceType>? onDistanceSelected;
  const ToggleDistance({super.key, this.initialDistance, this.onDistanceSelected});

  @override
  State<ToggleDistance> createState() => _ToggleDistanceState();
}

class _ToggleDistanceState extends State<ToggleDistance> {
  DistanceType? _selectedDistance;


  void _onDistanceSelected(DistanceType distance) {
    setState(() {
      _selectedDistance = _selectedDistance == distance ? null : distance;
    });
    if (widget.onDistanceSelected != null) widget.onDistanceSelected!(distance);
  }

  @override
  void initState() {
    super.initState();
    _selectedDistance = widget.initialDistance;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: DistanceType.values.map((distance) {
              final isSelected = _selectedDistance == distance;
              return GestureDetector(
                onTap: () => _onDistanceSelected(distance),
                child: _DistanceToggleCard(
                  isSelected: isSelected,
                  distance: distance.value,
                ),
              );
            }).toList(),
      ),
    );
  }
}

class _DistanceToggleCard extends StatelessWidget {
  final bool isSelected;
  final int distance;

  const _DistanceToggleCard({
    required this.isSelected,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: REdgeInsetsDirectional.only(end: 12),
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: isSelected ? AppColors.primary.shade50 : AppColors.white,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.stroke,
          width: 1.5.w,
        ),
      ),
      child: Center(
        child: AppText(
          text: distance == 0 ? "Auto" : "$distance km",
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: isSelected ? AppColors.primary : AppColors.blue,
        ),
      ),
    );
  }
}
