import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_reader/core/services/locator.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/core/widgets/custom_qr_image_view.dart';
import 'package:qr_reader/core/widgets/show_qr_view_buttons.dart';
import 'package:qr_reader/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/utils/colors.dart';
import 'package:qr_reader/features/generate_qr/presentation/manager/show_qr_cubit/show_qr_cubit.dart';
import 'package:qr_reader/core/functions/build_action_button.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/generate_qr_item_view_body.dart';
import 'package:qr_reader/features/history/domain/history_item_entity.dart';
import 'package:qr_reader/features/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:screenshot/screenshot.dart';

class ShowQrView extends StatelessWidget {
  const ShowQrView({super.key});
  @override
  Widget build(BuildContext context) {
    final ScreenshotController screenshotController = ScreenshotController();
    final ShowQrCubit cubit = BlocProvider.of<ShowQrCubit>(context);
    if (cubit.save) {
      Future.delayed(const Duration(seconds: 2), () {
        log('delayed');
        log('data: ${cubit.data}');
        log('isScanned: ${cubit.isScanned}');
        locator<HistoryCubit>().addHistory(
          scannedHistory: cubit.isScanned,
          historyItemEntity: HistoryItemEntity(
            data: cubit.data,
            qrData: cubit.qrData,
            type: cubit.qrType.name,
            date: DateTime.now().toString(),
          ),
        );
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundCircles(),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomAppBar(title: ''),
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
                          child: BlocBuilder<ShowQrCubit, ShowQrState>(
                            builder: (context, state) {
                              if (state is ShowQrSuccess) {
                                return Text(
                                  state.qrData,
                                  style: AppTextStyles.white17W400,
                                );
                              } else if (state is ShowQrError) {
                                return const Text('Cannot read this QR code');
                              } else {
                                return const Text('');
                              }
                            },
                          ),
                        ),
                        const Gap(40),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 75),
                            child: CustomQrImageView(data: cubit.data),
                          ),
                        ),
                        const Gap(41),
                      ],
                    ),
                  ),
                  ShowQrViewButtons(
                    screenshotController: screenshotController,
                    data: cubit.data,
                    qrData: cubit.qrData ?? cubit.data,
                  ),
                  const Gap(32),
                  buildActionbutton(
                    data: cubit.data,
                    type: cubit.qrType,
                  ),
                  const Gap(60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
