/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/features/scan_qr/manager/scan_qr_cubit/scan_qr_cubit.dart';

class RequestStoragePermissionWidget extends StatelessWidget {
  const RequestStoragePermissionWidget({super.key});

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
              'Storage permission required',
              textAlign: TextAlign.center,
              style: AppTextStyles.primary26W500,
            ),
            const Gap(20),
            const Text(
              textAlign: TextAlign.center,
              'Please accept storage permission so the app can access the file you opened/shared to us and scan it.',
              style: AppTextStyles.white17W400,
            ),
            const Gap(20),
            ElevatedButton(
              onPressed: () async {
                await cubit.scanFromIntent();
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
*/