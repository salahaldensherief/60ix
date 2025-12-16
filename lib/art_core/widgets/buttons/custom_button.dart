import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.alignment ,

    this.onPressed,
    this.text ='',
    this.color,
     this.colorSide = Colors.transparent,
    this.textStyle,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
 final  Color? colorSide;
  final TextStyle? textStyle;
  final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        alignment: alignment,
        backgroundColor: color,
        fixedSize: Size(364, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: colorSide!),
      ),
      onPressed: onPressed,
      child: Text(
          text!,
          style:textStyle),
    );
  }
}
