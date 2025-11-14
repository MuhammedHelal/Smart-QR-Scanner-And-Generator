import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/functions/navbar_navigation.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/core/widgets/custom_appbar.dart';
import 'package:qr_reader/core/widgets/show_qr_view_with_cubit.dart';
import 'package:qr_reader/core/widgets/black_greyish_container.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/generate_qr_item_view_body.dart';

class WifiQrView extends StatefulWidget {
  const WifiQrView({super.key});

  @override
  State<WifiQrView> createState() => _WifiQrViewState();
}

class _WifiQrViewState extends State<WifiQrView> {
  late final TextEditingController networkNameController;
  late final TextEditingController passwordController;
  bool hidden = false;
  List<String> security = ['None', 'WEP', 'WPA', 'WPA2', 'WPA3'];

  String securityValue = 'WPA2';
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    networkNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    networkNameController.dispose();
    passwordController.dispose();
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
                            Icons.wifi,
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
                                    style: AppTextStyles.white17W400,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter wifi name';
                                      } else if (value.length > 32) {
                                        return 'Name must be between 1 and 32 characters';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Name',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    maxLines: 1,
                                    expands: false,
                                    controller: networkNameController,
                                  ),
                                  const Gap(8),
                                  securityValue == 'None'
                                      ? const SizedBox.shrink()
                                      : TextFormField(
                                          style: AppTextStyles.white17W400,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Enter wifi password';
                                            } else if (value.length < 8) {
                                              return 'Password must be at least 8 characters';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            hintText: 'Password',
                                          ),
                                          maxLines: 1,
                                          expands: false,
                                          controller: passwordController,
                                        ),
                                  const Gap(12),
                                  DropdownButtonFormField(
                                    style: AppTextStyles.white16W400,
                                    decoration: const InputDecoration(
                                      labelText: 'Security',
                                    ),
                                    value: securityValue,
                                    items: security
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      if (value == security[0]) {
                                        passwordController.clear();
                                      }
                                      setState(() {
                                        securityValue = value.toString();
                                      });
                                    },
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: hidden,
                                        onChanged: (value) {
                                          setState(() {
                                            hidden = value!;
                                          });
                                        },
                                      ),
                                      const Gap(4),
                                      const Text(
                                        'Hidden',
                                        style: AppTextStyles.primary17W400,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(52),
                          ElevatedButton(
                            onPressed: () {
                              final data =
                                  " WIFI:S:${networkNameController.text};T:$securityValue;P:${passwordController.text};H:$hidden;";

                              /* final data =
                                  'WIFI:T:$securityValue;S:${networkNameController.text};P:${passwordController.text};H:$hidden;';*/
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
          const CustomAppBar(
            title: 'Wi-fi',
          ),
        ],
      ),
    );
  }
}
