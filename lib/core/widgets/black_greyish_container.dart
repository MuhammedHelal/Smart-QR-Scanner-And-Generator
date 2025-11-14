import 'package:flutter/material.dart';
import 'package:qr_reader/core/utils/colors.dart';

class BlackGreyishContainer extends StatelessWidget {
  const BlackGreyishContainer({
    super.key,
    required this.child,
    this.isSettings = false,
  });
  final Widget child;
  final bool isSettings;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.black54,
        border: Border.symmetric(
          horizontal: isSettings
              ? BorderSide.none
              : const BorderSide(
                  color: AppColors.primary,
                ),
        ),
      ),
      child: child,
    );
  }
}
