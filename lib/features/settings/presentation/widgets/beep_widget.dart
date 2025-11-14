import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_reader/core/utils/assets.dart';
import 'package:qr_reader/features/settings/presentation/manager/cubit/settings_cubit.dart';

class BeepSettingsWidget extends StatelessWidget {
  const BeepSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsCubit cubit = BlocProvider.of<SettingsCubit>(context);

    return ListTile(
      leading: SvgPicture.asset(
        Assets.assetsImagesDuck,
        fit: BoxFit.fill,
        height: 25,
        width: 25,
      ),
      title: const Text('Duck'),
      subtitle: const Text('Quack when scan is done.'),
      trailing: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Switch(
            value: cubit.settingsEntity.beep,
            onChanged: (value) {
              cubit.changeBeep(value);
            },
          );
        },
      ),
    );
  }
}
