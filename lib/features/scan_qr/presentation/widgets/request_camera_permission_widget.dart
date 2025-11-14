import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/features/scan_qr/manager/scan_qr_cubit/scan_qr_cubit.dart';

class RequestCameraPerssionWidget extends StatelessWidget {
  const RequestCameraPerssionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ScanQrCubit>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Camera permission required',
              textAlign: TextAlign.center,
              style: AppTextStyles.primary26W500,
            ),
            const Gap(20),
            const Text(
              textAlign: TextAlign.center,
              'Please accept camera permission so the app can access can work properly.',
              style: AppTextStyles.white17W400,
            ),
            const Gap(20),
            ElevatedButton(
              onPressed: () async {
                await cubit.requestCameraPermission();
              },
              child: const Text(
                'Allow',
                style: AppTextStyles.blackGreyish17W500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
