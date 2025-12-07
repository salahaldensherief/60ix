part of '../buttons.dart';

class ButtonContent {
  final String label;
  final Widget? icon;

  const ButtonContent({required this.label, this.icon});
}

class ButtonContentWidget extends StatelessWidget {
  final ButtonContent content;
  final TextStyle? textStyle;

  const ButtonContentWidget({super.key, required this.content, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (content.icon != null) ...[
          content.icon!,
          const SizedBox(width: 8.0),
        ],
        AppText(
          text: content.label.isNotEmpty ? content.label : 'Button',
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
