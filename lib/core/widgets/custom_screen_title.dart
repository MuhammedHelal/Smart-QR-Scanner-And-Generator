import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_reader/core/functions/navbar_navigation.dart';
import 'package:qr_reader/core/services/locator.dart';
import 'package:qr_reader/core/utils/assets.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/core/widgets/custom_iconbutton_background.dart';
import 'package:qr_reader/features/settings/presentation/manager/cubit/settings_cubit.dart';
import 'package:qr_reader/features/settings/presentation/views/settings_view.dart';

class CustomScreenTitle extends StatelessWidget {
  const CustomScreenTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.white24W500,
        ),
        GestureDetector(
          onTap: () {
            navigateWithoutNavBarWithCupertinoAnimation(
              context,
              BlocProvider.value(
                value: locator<SettingsCubit>(),
                child: const SettingsView(),
              ),
            );
          },
          child: CustomIconButtonBackground(
            icon: Padding(
              padding: const EdgeInsets.all(2),
              child: SvgPicture.asset(
                Assets.assetsImagesMenuIcon,
              ),
            ),
          ),
        )
      ],
    );
  }
}
