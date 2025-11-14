import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/functions/navbar_navigation.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/core/widgets/custom_appbar.dart';
import 'package:qr_reader/core/widgets/show_qr_view_with_cubit.dart';
import 'package:qr_reader/core/widgets/black_greyish_container.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/generate_qr_item_view_body.dart';

class SmsQrView extends StatefulWidget {
  const SmsQrView({super.key});

  @override
  State<SmsQrView> createState() => _SmsQrViewState();
}

class _SmsQrViewState extends State<SmsQrView> {
  late final TextEditingController phoneController;
  late final TextEditingController bodyController;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    phoneController = TextEditingController();
    bodyController = TextEditingController();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();

    phoneController.dispose();
    bodyController.dispose();
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
                          const Icon(
                            Icons.sms,
                            size: 60,
                          ),
                          const Gap(52),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    style: AppTextStyles.white16W400,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter phone number';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Enter phone number',
                                    ),
                                    maxLines: 1,
                                    expands: false,
                                    keyboardType: TextInputType.phone,
                                    controller: phoneController,
                                  ),
                                  const Gap(12),
                                  TextFormField(
                                    style: AppTextStyles.white16W400,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter body';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Enter body',
                                    ),
                                    maxLines: 5,
                                    expands: false,
                                    controller: bodyController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(52),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                final data =
                                    'sms:${phoneController.text}?body=${bodyController.text}';
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
          const CustomAppBar(title: 'Sms'),
        ],
      ),
    );
  }
}
