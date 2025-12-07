part of "radio_button.dart";

class CustomRadioButtonGroup<T> extends StatefulWidget {
  final List<T> values; 
  final T? initialValue; 
  final ValueChanged<T?>? onChanged; 
  final List<String>? labels; 
  final double? fontSize; 
  final double spacing; 
  final Color? labelColor; 
  final Color? primaryColor;
  final Axis direction; 

  CustomRadioButtonGroup({
    super.key,
    required this.values,
    this.initialValue,
    this.onChanged,
    this.labels,
    this.fontSize = 16,
    this.spacing = 20,
    this.labelColor,
    this.primaryColor,
    this.direction = Axis.vertical,
  })  : assert(labels == null || labels.length == values.length, "Labels must match the number of values");

  @override
  State<CustomRadioButtonGroup<T>> createState() => _CustomRadioButtonGroupState<T>();
}

class _CustomRadioButtonGroupState<T> extends State<CustomRadioButtonGroup<T>> {
  late T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: widget.direction,
      mainAxisSize: MainAxisSize.min,
      spacing: widget.spacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(widget.values.length, (index) {
        return CustomRadioButton<T>(
          value: widget.values[index],
          selectedValue: _selectedValue,
          onChanged: (newValue) {
            setState(() {
              _selectedValue = newValue;
            });
            widget.onChanged?.call(newValue);
          },
          labelText: widget.labels != null ? widget.labels![index] : null,
          fontSize: widget.fontSize,
          labelColor: widget.labelColor,
          primaryColor: widget.primaryColor,
        );
      }),
    );
  }
}