import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/utils/assets.dart';
import 'package:qr_reader/core/widgets/background_greyish_black.dart';
import 'package:qr_reader/core/widgets/custom_screen_title.dart';
import 'package:qr_reader/features/generate_qr/presentation/views/email_qr_view.dart';
import 'package:qr_reader/features/generate_qr/presentation/views/event_qr_view.dart';
import 'package:qr_reader/features/generate_qr/presentation/views/sms_qr_view.dart';
import 'package:qr_reader/features/generate_qr/presentation/views/text_qr_view.dart';
import 'package:qr_reader/features/generate_qr/presentation/views/website_qr_view.dart';
import 'package:qr_reader/features/generate_qr/presentation/views/wifi_qr_view.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/generate_qr_grid_view_item.dart';

class GenerateQrView extends StatelessWidget {
  const GenerateQrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        const BackgroundGreyishBlack(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SafeArea(
            child: Column(
              children: [
                const CustomScreenTitle(title: 'Generate QR'),
                const Gap(40),
                Expanded(
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 75,
                      crossAxisSpacing: 43,
                    ),
                    children: gridViewChildern,
                  ),
                ),
                const Gap(10),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static final gridViewChildern = [
    const GenerateQrGridViewItem(
      icon: Icon(Icons.text_fields_sharp),
      navigateTo: TextQrView(),
      title: 'Text',
    ),
    GenerateQrGridViewItem(
      icon: SvgPicture.asset(Assets.assetsImagesWebsiteIcon),
      navigateTo: const WebsiteQrView(),
      title: 'Website',
    ),
    const GenerateQrGridViewItem(
      icon: Icon(Icons.wifi),
      navigateTo: WifiQrView(),
      title: 'Wi-fi',
    ),
    const GenerateQrGridViewItem(
      icon: Icon(Icons.event_available),
      navigateTo: EventQrView(),
      title: 'Event',
    ),
    const GenerateQrGridViewItem(
      icon: Icon(Icons.alternate_email_outlined),
      navigateTo: EmailQrView(),
      title: 'Email',
    ),
    const GenerateQrGridViewItem(
      icon: Icon(Icons.sms_rounded),
      navigateTo: SmsQrView(),
      title: 'Sms',
    )
  ];
}
