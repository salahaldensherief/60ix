part of '../shared_app_widgets.dart';

enum RatingType {
  fiveStars(5),
  fourStars(4),
  threeStars(3),
  twoStars(2),
  oneStar(1);

  final int value;
  const RatingType(this.value);
}
class ToggleRatings extends StatefulWidget {
  final RatingType? initialRating;
  final ValueChanged<RatingType?>? onRatingSelected;
  const ToggleRatings({super.key, this.initialRating, this.onRatingSelected});

  @override
  State<ToggleRatings> createState() => _ToggleRatingsState();
}

class _ToggleRatingsState extends State<ToggleRatings> {
  RatingType? _selectedRating;


  void _onRatingSelected(RatingType rating) {
    setState(() {
      _selectedRating = _selectedRating == rating ? null : rating;
    });
    if (widget.onRatingSelected != null) widget.onRatingSelected!(_selectedRating);
  }

  @override
  void initState() {
    super.initState();
    _selectedRating = widget.initialRating;
  }


  @override
  void didUpdateWidget(covariant ToggleRatings oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialRating != oldWidget.initialRating) {
      _selectedRating = widget.initialRating;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: RatingType.values.map((rating) {
              final isSelected = _selectedRating == rating;
              return GestureDetector(
                onTap: () => _onRatingSelected(rating),
                child: _RatingToggleCard(
                  isSelected: isSelected,
                  rating: rating.value,
                  showPlusSign: rating != RatingType.oneStar && rating != RatingType.fiveStars,
                ),
              );
            }).toList(),
      ),
    );
  }
}

class _RatingToggleCard extends StatelessWidget {
  final bool isSelected;
  final bool showPlusSign;
  final int rating;

  const _RatingToggleCard({
    required this.isSelected,
    required this.rating,
    this.showPlusSign = true,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: REdgeInsetsDirectional.only(end: 12),
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: isSelected ? AppColors.primary.shade50 : AppColors.cardBackground,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.borderColor,
          width: 1.5.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgIconWidget(path: AssetsManager.star, height: 14.h, width: 14.h),
          SizedBox(width: 8.w),
          AppText(
            text: showPlusSign ? '+$rating' : '$rating',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.primary : null,
          ),
        ],
      ),
    );
  }
}
