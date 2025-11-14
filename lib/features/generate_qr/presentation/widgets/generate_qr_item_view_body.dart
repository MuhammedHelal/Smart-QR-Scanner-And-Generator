import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_reader/core/utils/assets.dart';
import 'package:qr_reader/core/widgets/background_greyish_black.dart';

class BackgroundCircles extends StatelessWidget {
  const BackgroundCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const BackgroundGreyishBlack(),
        Positioned(
          bottom: 0,
          left: 0,
          child: SvgPicture.asset(
            alignment: Alignment.topRight,
            color: Colors.white12,
            Assets.assetsImagesBackgroundCircle,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: SvgPicture.asset(
            alignment: Alignment.topRight,
            color: Colors.white12,
            Assets.assetsImagesBackgroundCircleRight,
          ),
        )
      ],
    );
  }
}
