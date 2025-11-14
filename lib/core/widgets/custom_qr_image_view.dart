import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_reader/core/utils/colors.dart';

class CustomQrImageView extends StatelessWidget {
  const CustomQrImageView({
    super.key,
    required this.data,
  });

  final String? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primary,
          width: 4,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: QrImageView(
          size: 160,
          data: data!,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
