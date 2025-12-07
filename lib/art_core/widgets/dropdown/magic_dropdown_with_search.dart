

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/core/translate/translate.dart';
import '../../theme/themes.dart';
import '../text/app_text.dart';

class CustomDropdownWithSearch<T> extends StatefulWidget {
  final String? label, hint;
  final List<T> items;
  final bool isRequired;
  final String Function(T value)? itemToString;
  void Function(String)? onChangedSearch;
  final T? initialValue;
  final Function(T value) onChanged;
  final Widget? customWidget;
  final String? errorText;
  final VoidCallback? onDropdownOpen;
  final bool enabled;

  CustomDropdownWithSearch({
    required this.onChanged,
    super.key,
    this.label,
    this.hint,
    this.customWidget,
    this.enabled = true,
    this.items = const [],
    this.itemToString,
    this.initialValue,
    this.isRequired = false,
    this.errorText,
    this.onChangedSearch,
    this.onDropdownOpen,
  });

  @override
  State<CustomDropdownWithSearch<T>> createState() =>
      _CustomDropdownWithSearchState<T>();
}

class _CustomDropdownWithSearchState<T>
    extends State<CustomDropdownWithSearch<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final displayLabel =
        selectedValue != null
            ? (widget.itemToString?.call(selectedValue!) ??
                selectedValue.toString())
            : (widget.hint ?? '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (widget.label != null) ...[AppText(text: widget.label ?? '')],
            if (widget.isRequired) ...[
              const SizedBox(width: 5),
              const Text("*", style: TextStyle(color: AppColors.red)),
            ],
          ],
        ),
        RSizedBox(height: 6.h),
        GestureDetector(
          onTap: () {
            if (widget.enabled) {
              widget.onDropdownOpen?.call();
              _showDropdownSheet(context, customWidget: widget.customWidget);
            }
          },
          child: Container(
            // constraints: BoxConstraints(maxHeight: 80.h),
            decoration: BoxDecoration(
              color: AppColors.borderInputField,
              border: Border.all(color: AppColors.shadowColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 14.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: AppText(text: displayLabel)),
                      Icon(Icons.arrow_drop_down, color: AppColors.iconColor),
                    ],
                  ),

                  if (widget.errorText != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        widget.errorText!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.red,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        // AppButton(
        //   content: ButtonContent(
        //     label: displayLabel,
        //     icon: const Icon(Icons.keyboard_arrow_down),
        //   ),
        //   behavior: ButtonBehavior.tap(
        //     onTap: () {
        //       if (widget.enabled) {
        //         _showDropdownSheet(context, customWidget: widget.customWidget);
        //       }
        //     },
        //   ),
        // ),
      ],
    );
  }

  void _showDropdownSheet(BuildContext context, {Widget? customWidget}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: widget.onChangedSearch,
                      decoration: InputDecoration(
                        hintText: translate(AppString.search),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: ScreenUtil().screenHeight * 0.3,
                    child: customWidget ??
                        ListView.builder(
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16.w,
                          ),
                          itemCount: widget.items.length,
                          itemBuilder: (context, index) {
                            final item = widget.items[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  selectedValue = item;
                                });
                                widget.onChanged(item);
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.borderInputField,
                                  border:
                                  Border.all(color: AppColors.shadowColor),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromRGBO(0, 0, 0, 0.05),
                                      blurRadius: 8,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: AppText(
                                  text: widget.itemToString?.call(item) ??
                                      item.toString(),
                                ),
                              ),
                            );
                          },
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}
