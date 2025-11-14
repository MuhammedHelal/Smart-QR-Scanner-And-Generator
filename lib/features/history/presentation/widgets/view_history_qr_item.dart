import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/classes/qr_parser.dart';
import 'package:qr_reader/core/functions/format_datetime.dart';
import 'package:qr_reader/core/utils/colors.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/core/widgets/custom_qr_image_view.dart';
import 'package:qr_reader/core/widgets/show_qr_view_buttons.dart';
import 'package:qr_reader/core/widgets/custom_appbar.dart';
import 'package:qr_reader/core/functions/build_action_button.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/generate_qr_item_view_body.dart';
import 'package:qr_reader/features/history/domain/history_item_entity.dart';
import 'package:screenshot/screenshot.dart';

class ViewHistoryQrItem extends StatelessWidget {
  const ViewHistoryQrItem({super.key, required this.item});
  final HistoryItemEntity item;
  @override
  Widget build(BuildContext context) {
    final ScreenshotController screenshotController = ScreenshotController();
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          const BackgroundCircles(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomAppBar(title: item.type),
                Screenshot(
                  controller: screenshotController,
                  child: Column(
                    children: [
                      const Gap(10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: AppColors.blackGreyish,
                        ),
                        child: Text(
                          item.qrData ?? item.data,
                          style: AppTextStyles.white17W400,
                        ),
                      ),
                      const Gap(40),
                      Center(
                        child: CustomQrImageView(data: item.data),
                      ),
                      const Gap(41),
                    ],
                  ),
                ),
                ShowQrViewButtons(
                  screenshotController: screenshotController,
                  data: item.data,
                  qrData: item.qrData ?? item.data,
                ),
                const Gap(12),
                buildActionbutton(
                  data: item.data,
                  type: QRCodeType.values.byName(item.type),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    formatDateTime(item.date),
                    style: AppTextStyles.grey14W400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
