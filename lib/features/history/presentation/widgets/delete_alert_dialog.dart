import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/services/locator.dart';
import 'package:qr_reader/core/utils/colors.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/features/history/domain/history_item_entity.dart';
import 'package:qr_reader/features/history/presentation/manager/history_cubit/history_cubit.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({super.key, required this.item});

  final HistoryItemEntity item;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: const Text(
        'Delete?',
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.primary),
      ),
      content: const Text(
        'Are you sure?',
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

                await locator<HistoryCubit>().deleteHistory(item);
              },
              child: const Text('Delete'),
            ),
          ],
        )
      ],
    );
  }
}
