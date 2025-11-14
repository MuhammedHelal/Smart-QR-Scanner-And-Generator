import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:qr_reader/core/utils/strings.dart';
import 'package:qr_reader/features/settings/domain/settings_entity.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial()) {
    getSettings();
  }

  late SettingsEntity settingsEntity;
  void getSettings() {
    final Map value = Hive.box(AppStrings.settingsBoxName).toMap();
    settingsEntity = SettingsEntity.fromMap(value);
    emit(SettingsSuccess());
  }

  void saveSettings() async {
    await Hive.box(AppStrings.settingsBoxName).putAll(settingsEntity.toMap());
  }

  void changeBeep(bool value) {
    settingsEntity = settingsEntity.copyWith(beep: value);
    emit(SettingsSuccess());

    saveSettings();
  }

  void changeVibrate(bool value) {
    settingsEntity = settingsEntity.copyWith(vibrate: value);
    emit(SettingsSuccess());

    saveSettings();
  }
}
