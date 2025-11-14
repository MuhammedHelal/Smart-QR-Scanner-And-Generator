
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:gap/gap.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/core/functions/show_toast.dart';
import 'package:qr_reader/core/utils/strings.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/core/widgets/custom_qr_image_view.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ShowQrViewButtons extends StatelessWidget {
  const ShowQrViewButtons({
    super.key,
    required this.data,
    required this.qrData,
    required this.screenshotController,
  });
  final ScreenshotController screenshotController;
  final String data;
  final String qrData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            icon: const Icon(
              Icons.copy,
              size: 25,
            ),
            title: 'Copy',
            onPressed: () async {
              await showToast(
                message: 'Copid to clipboard',
                color: Colors.green,
              );
              await Clipboard.setData(
                ClipboardData(text: qrData),
              );
            },
          ),
          CustomButton(
            onPressed: () async {
              final directory = (await getTemporaryDirectory()).path;

              final path = await screenshotController.captureAndSave(
                directory,
                fileName: 'screenshot.png',
                delay: const Duration(milliseconds: 100),
              );
              if (path == null) return;
              final result = await GallerySaver.saveImage(
                path,
                albumName: 'QR Scanner',
              );
              if (result == null || !result) {
                await showToast(
                  message: 'Failed to save screenshot',
                  color: Colors.red,
                );
              } else {
                await showToast(
                  message: 'Captured screenshot and saved to device',
                  color: Colors.green,
                );
              }
            },
            icon: const Icon(
              size: 25,
              Icons.screenshot_outlined,
            ),
            title: 'Screenshot',
          ),
          CustomButton(
            onPressed: () async {
              final image = await ScreenshotController().captureFromWidget(
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: CustomQrImageView(data: data),
                ),
              );
              final file = XFile.fromData(image, mimeType: 'image/png');
              await Share.shareXFiles(
                [file],
                text:
                    'Scanned by QR Scanner.\n\nDownload now from playstore\n\n${AppStrings.appStoreUrl}',
                subject: 'QR code',
              );
            },
            title: 'Share',
            icon: const Icon(
              Icons.share,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });
  final Widget icon;
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),
          onPressed: onPressed,
          child: icon,
        ),
        const Gap(8),
        Text(
          title,
          style: AppTextStyles.white16W400,
        )
      ],
    );
  }
}
