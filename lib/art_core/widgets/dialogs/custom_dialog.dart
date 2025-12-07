part of 'dialogs.dart';

class GlobalDialog extends StatelessWidget {
  final Widget title;
  final Widget content;
  final Color? backgroundColor;

  const GlobalDialog({
    super.key,
    required this.title,
    required this.content,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              title,
              const SizedBox(height: 20.0),
              content,
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> show({
    required BuildContext context,
    required Widget title,
    required Widget content,
    Color? backgroundColor,
  }) {
    return showDialog(
      context: context,
      builder: (context) => GlobalDialog(
        title: title,
        content: content,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
