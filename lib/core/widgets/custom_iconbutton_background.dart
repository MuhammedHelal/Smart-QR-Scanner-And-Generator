import 'package:flutter/material.dart';
import 'package:qr_reader/core/utils/colors.dart';

class CustomIconButtonBackground extends StatelessWidget {
  const CustomIconButtonBackground({
    super.key,
    required this.icon,
  });
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColors.blackGreyish,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black26,
          ),
        ],
      ),
      child: icon,
    );
  }
}
