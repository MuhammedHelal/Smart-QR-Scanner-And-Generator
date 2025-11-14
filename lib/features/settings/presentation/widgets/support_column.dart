import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/utils/assets.dart';
import 'package:qr_reader/core/utils/colors.dart';
import 'package:qr_reader/core/utils/strings.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/features/settings/presentation/widgets/settings_item_container.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

const String appPackageName = 'dev.moashraf.qr_reader';

final Uri playStoreUri = Uri.parse('market://details?id=$appPackageName');
final Uri playStoreWebUri =
    Uri.parse('https://play.google.com/store/apps/details?id=$appPackageName');

class SupportColumn extends StatelessWidget {
  const SupportColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Support',
          style: AppTextStyles.primary26W500,
        ),
        const Gap(20),
        SettingsItemContainer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () async {
                if (await canLaunchUrl(playStoreUri)) {
                  await launchUrl(playStoreUri);
                } else if (await canLaunchUrl(playStoreWebUri)) {
                  await launchUrl(playStoreWebUri);
                }
              },
              leading: SvgPicture.asset(
                fit: BoxFit.cover,
                width: 24,
                height: 24,
                Assets.assetsImagesRateUsIcon,
              ),
              title: Text(
                'Rate us',
                style: AppTextStyles.robotoWhite16W400,
              ),
              subtitle: Text(
                'Your best reward to us.',
                style: AppTextStyles.robotoLightWhite14W400,
              ),
            ),
          ),
        ),
        const Gap(10),
        SettingsItemContainer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () async {
                await Share.share(
                  '${AppStrings.shareAppTitle}\n\n${AppStrings.shareAppMessage}\n\n${AppStrings.appStoreUrl}',
                  subject: AppStrings.shareAppTitle,
                );
              },
              leading: const Icon(
                Icons.share,
                size: 25,
                color: AppColors.primary,
              ),
              title: Text(
                'Share the app',
                style: AppTextStyles.robotoWhite16W400,
              ),
              subtitle: Text(
                'Sharing is always caring.',
                style: AppTextStyles.robotoLightWhite14W400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
