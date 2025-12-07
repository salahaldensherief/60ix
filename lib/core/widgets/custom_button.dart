import 'package:flutter/material.dart';

import '../utils/font_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.colorSide,
   required this.textStyle,
  });
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color colorSide;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(364, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: color,
        side: BorderSide(color: colorSide),
      ),
      onPressed: onPressed,
      child: Text(text, style:textStyle),
    );
  }
}
