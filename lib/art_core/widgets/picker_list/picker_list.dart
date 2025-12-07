import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/core/translate/translate.dart';

class PickerList<T> extends StatefulWidget {
  final List<T> items;
  final T selectedValue;
  final String Function(T) itemToString;
  final ValueChanged<T>? onValueChanged; // خليها اختيارية
  final ValueChanged<T> onSave; // هنا نخلي onSave يرسل القيمة المختارة مباشرة
  final String? title;
  final String saveButtonText;

  const PickerList({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.itemToString,
    this.onValueChanged,
    required this.onSave,
    this.title,
    this.saveButtonText = AppString.save,
  });

  @override
  State<PickerList<T>> createState() => _PickerListState<T>();
}

class _PickerListState<T> extends State<PickerList<T>> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.items.indexOf(widget.selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              text: widget.title ?? "",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
            ),
          ),
        SizedBox(
          height: 150.h,
          child: ListWheelScrollView.useDelegate(
            itemExtent: 40.h,
            perspective: 0.002,
            diameterRatio: 2.5,
            physics: const FixedExtentScrollPhysics(),
            controller: FixedExtentScrollController(initialItem: _selectedIndex),
            onSelectedItemChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: widget.items.length,
              builder: (context, index) {
                final isSelected = index == _selectedIndex;
                return AnimatedContainer(
                  width: 300.w,
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12.0),
                  decoration: isSelected
                      ? BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.blueAccent.withOpacity(0.2),
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey[300]!,
                        Colors.grey[900]!,
                        Colors.grey[300]!,
                      ],
                      stops: [0.0, 0.5, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  )
                      : null,
                  child: Center(
                    child: AppText(
                      text: widget.itemToString(widget.items[index]),
                      fontSize: isSelected ? 20.sp : 16.sp,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      // color: isSelected ? AppColors.textColor : Colors.black54,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        AppButton(
          content: ButtonContent(label: translate(widget.saveButtonText)),
          behavior: TapBehavior(
            onTap: () {
              final selected = widget.items[_selectedIndex];
              widget.onSave(selected);
            },
          ),
        ),
      ],
    );
  }
}


