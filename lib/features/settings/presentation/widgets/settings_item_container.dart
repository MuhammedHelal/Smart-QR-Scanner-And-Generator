import 'package:flutter/material.dart';
import 'package:qr_reader/core/utils/colors.dart';

class SettingsItemContainer extends StatelessWidget {
  const SettingsItemContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColors.blackGreyish,
      ),
      child: child,
    );
  }
}
