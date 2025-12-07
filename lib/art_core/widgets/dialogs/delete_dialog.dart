part of 'dialogs.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback onTapDelete;
  final String title;
  final String? body;
  final bool isLoading;

  const DeleteDialog({
    super.key,
    required this.title,
    required this.onTapDelete,
    this.body,
    this.isLoading = false,
  });

  static void show(
      BuildContext context, {
        required String title,
        String? body,
        required VoidCallback onTapDelete,
        bool isLoading = false,
      }) {
    showCustomDialog(
      content: DeleteDialog(
        title: title,
        body: body,
        onTapDelete: onTapDelete,
        isLoading: isLoading,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          constraints: BoxConstraints(
            maxWidth: size.width * 0.85,
            maxHeight: size.height * 0.5,
          ),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  color: AppColors.primary.shade100,
                  shape: BoxShape.circle
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgIconWidget(
                    path: AssetsManager.delete,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AppText(
                text: translate(title),
                fontSize: 18,
                maxLines: 3,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
             if(body != null)...[
               SizedBox(height: 10.0,),
               AppText(
                 text: translate(body!),
                 fontSize: 14,
                 maxLines: 3,
                 fontWeight: FontWeight.w400,
                 textAlign: TextAlign.center,
               ),
             ],
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      key: const Key("delete_button"),
                      buttonConfig: ButtonConfig.outlined(
                        backgroundColor: AppColors.red,
                      ),
                      content: ButtonContent(
                        label: translate(AppString.yes),
                      ),
                      behavior: TapBehavior(
                        isLoading: isLoading,
                        onTap: onTapDelete,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppButton(
                      content: ButtonContent(label: translate(AppString.no)),
                      behavior: TapBehavior(
                        onTap: () => Modular.to.pop(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
