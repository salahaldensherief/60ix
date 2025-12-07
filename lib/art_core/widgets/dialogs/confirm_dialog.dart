part of 'dialogs.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.onConfirm,
    required this.confirmationText,
    this.loading = false,
  });

  final String confirmationText;

  final VoidCallback onConfirm;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: const SizedBox(),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [AppText(text: confirmationText)],
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      actions: [
        SizedBox(
          width: 150,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: AppColors.primary.shade400),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'No',
              style: TextStyle(color: AppColors.primary.shade400),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 150,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppColors.primary),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: onConfirm,
            child: Text('Yes'),

          ),
        ),
      ],
    );
  }
}
