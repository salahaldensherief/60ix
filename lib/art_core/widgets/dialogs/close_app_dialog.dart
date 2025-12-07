part of 'dialogs.dart';

class CloseAppDialog extends StatelessWidget {
  final VoidCallback onDelete;

  const CloseAppDialog({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Modular.to.pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ).marginOnly(left: 10, right: 10, top: 10),
              Image.asset("assets/images/Group 764.png"),
              AppText(
                text: "close_app".tr(),
                textAlign: TextAlign.center,
                fontSize: 16,
                maxLines: 3,
                fontWeight: FontWeight.bold,
              ).paddingOnly(bottom: 15),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text('no'.tr()),
                      onPressed: () => Modular.to.pop(),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onDelete,
                      child: Text('yes'.tr()),
                    ),
                  ),
                ],
              ).marginSymmetric(horizontal: 15),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
