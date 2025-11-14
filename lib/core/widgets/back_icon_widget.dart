import 'package:flutter/material.dart';
import 'package:qr_reader/core/utils/colors.dart';
import 'package:qr_reader/core/widgets/custom_iconbutton_background.dart';

class BackIconWidget extends StatelessWidget {
  const BackIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const CustomIconButtonBackground(
        icon: Icon(
          size: 25,
          color: AppColors.primary,
          Icons.arrow_back_ios_new,
        ),
      ),
    );
  }
}
