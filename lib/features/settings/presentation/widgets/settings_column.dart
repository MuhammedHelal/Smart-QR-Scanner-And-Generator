import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/functions/show_toast.dart';
import 'package:qr_reader/core/services/locator.dart';
import 'package:qr_reader/core/utils/colors.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/features/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:qr_reader/features/settings/presentation/widgets/beep_widget.dart';
import 'package:qr_reader/features/settings/presentation/widgets/settings_item_container.dart';
import 'package:qr_reader/features/settings/presentation/widgets/vibrate_settings.dart';

class SettingsColumn extends StatelessWidget {
  const SettingsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Settings',
          style: AppTextStyles.primary26W500,
        ),
        const Gap(20),
        const SettingsItemContainer(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: VibrateSettingsWidget(),
          ),
        ),
        const Gap(10),
        const SettingsItemContainer(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: BeepSettingsWidget(),
          ),
        ),
        const Gap(10),
        SettingsItemContainer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      alignment: Alignment.center,
                      title: const Text(
                        'Delete History?',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.primary),
                      ),
                      content: const Text(
                        'Are you sure? This action cannot be undone.',
                        style: AppTextStyles.white17W400,
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            const Gap(12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);

                                locator<HistoryCubit>().deleteAllHistory();
                                await showToast(
                                  message: 'All history deleted',
                                  color: Colors.green,
                                );
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
              leading: const Icon(
                Icons.delete_forever_sharp,
                size: 25,
                color: Colors.red,
              ),
              title: const Text('Delete history'),
              subtitle: const Text(
                'Delete all scanned and generated history.',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
