import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_reader/core/utils/colors.dart';
import 'package:qr_reader/core/utils/text_styles.dart';
import 'package:qr_reader/features/settings/presentation/manager/cubit/settings_cubit.dart';

class VibrateSettingsWidget extends StatelessWidget {
  const VibrateSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsCubit cubit = BlocProvider.of<SettingsCubit>(context);
    return ListTile(
      leading: const Icon(
        Icons.vibration,
        size: 25,
        color: AppColors.primary,
      ),
      title: Text(
        'Vibrate',
        style: AppTextStyles.robotoWhite16W400,
      ),
      subtitle: Text(
        'Vibration when scan is done.',
        style: AppTextStyles.robotoLightWhite14W400,
      ),
      trailing: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Switch(
            value: cubit.settingsEntity.vibrate,
            onChanged: (value) {
              cubit.changeVibrate(value);
            },
          );
        },
      ),
    );
  }
}
