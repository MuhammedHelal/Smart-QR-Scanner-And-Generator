import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_reader/core/functions/format_datetime.dart';
import 'package:qr_reader/core/functions/navbar_navigation.dart';
import 'package:qr_reader/core/functions/show_toast.dart';
import 'package:qr_reader/core/utils/colors.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/features/history/domain/history_item_entity.dart';
import 'package:qr_reader/features/history/presentation/widgets/delete_alert_dialog.dart';
import 'package:qr_reader/features/history/presentation/widgets/view_history_qr_item.dart';

class HistoryListViewItem extends StatelessWidget {
  const HistoryListViewItem({super.key, required this.item});
  final HistoryItemEntity item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateWithoutNavBar(
          context,
          ViewHistoryQrItem(item: item),
        );
      },
      onLongPress: () async {
        await Clipboard.setData(ClipboardData(text: item.qrData ?? item.data));
        showToast(message: 'Copied', color: Colors.green);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: AppColors.blackGreyish,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.primary,
                  width: 2.5,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: QrImageView(
                  backgroundColor: Colors.white,
                  size: 60,
                  data: item.data,
                ),
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.qrData ?? item.data,
                          style: AppTextStyles.white16W400,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await confirmDelete(context);
                        },
                        icon: const Icon(Icons.delete_forever, size: 30),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.type.toUpperCase(),
                        style: AppTextStyles.grey13W400,
                      ),
                      Text(
                        formatDateTime(item.date),
                        style: AppTextStyles.grey13W400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> confirmDelete(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return DeleteAlertDialog(item: item);
      },
    );
  }
}
