import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/functions/is_url.dart';
import 'package:qr_reader/core/functions/navbar_navigation.dart';
import 'package:qr_reader/core/utils/assets.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/core/widgets/custom_appbar.dart';
import 'package:qr_reader/core/widgets/show_qr_view_with_cubit.dart';
import 'package:qr_reader/core/widgets/black_greyish_container.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/generate_qr_item_view_body.dart';

class WebsiteQrView extends StatefulWidget {
  const WebsiteQrView({super.key});

  @override
  State<WebsiteQrView> createState() => _WebsiteQrViewState();
}

class _WebsiteQrViewState extends State<WebsiteQrView> {
  late final TextEditingController controller;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    controller = TextEditingController(
      text: 'https://',
    );
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const BackgroundCircles(),
          SingleChildScrollView(
            child: Column(
              children: [
                const Gap(60),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: BlackGreyishContainer(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Gap(42),
                          SvgPicture.asset(
                            Assets.assetsImagesWebsiteIcon,
                            height: 60,
                            width: 60,
                          ),
                          const Gap(52),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Form(
                              key: formKey,
                              child: TextFormField(
                                style: AppTextStyles.white16W400,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your website url';
                                  }
                                  if (isURL(value) == false) {
                                    return 'Enter a valid url';
                                  }
                                  return null;
                                },
                                maxLines: 1,
                                expands: false,
                                controller: controller,
                              ),
                            ),
                          ),
                          const Gap(52),
                          ElevatedButton(
                            onPressed: () {
                              final data = controller.text;
                              if (formKey.currentState!.validate()) {
                                navigateWithoutNavBar(
                                  context,
                                  ShowQrViewWithCubit(data),
                                );
                              }
                            },
                            child: const Text(
                              'Generate',
                              style: AppTextStyles.blackGreyish17W500,
                            ),
                          ),
                          const Gap(42),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(60),
              ],
            ),
          ),
          const CustomAppBar(title: 'Website'),
        ],
      ),
    );
  }
}
