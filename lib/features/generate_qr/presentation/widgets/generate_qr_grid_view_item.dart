import 'package:flutter/material.dart';
import 'package:qr_reader/core/functions/navbar_navigation.dart';
import 'package:qr_reader/core/utils/colors.dart';
import 'package:qr_reader/core/utils/text_styles.dart';

class GenerateQrGridViewItem extends StatelessWidget {
  const GenerateQrGridViewItem({
    super.key,
    required this.title,
    required this.icon,
    required this.navigateTo,
  });
  final String title;
  final Widget icon;
  final Widget navigateTo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateWithoutNavBar(
          context,
          navigateTo,
        );
      },
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.blackGreyish,
              border: Border.all(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
            child: Center(child: icon),
          ),
          Positioned(
            top: -10,
            child: Container(
              height: 24,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  title,
                  style: AppTextStyles.blackGreyish14W600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
