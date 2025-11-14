import 'package:hive/hive.dart';
import 'package:qr_reader/core/utils/strings.dart';

class SettingsLocalDataSource {
  void saveBeep(bool value) async {
    await Hive.box(AppStrings.settingsBoxName).put(
      AppStrings.beepKey,
      value,
    );
  }

  void saveVibrate(bool value) async {
    await Hive.box(AppStrings.settingsBoxName).put(
      AppStrings.vibrateKey,
      value,
    );
  }

  bool getBeep() {
    return Hive.box(AppStrings.settingsBoxName).get(
      AppStrings.beepKey,
      defaultValue: false,
    );
  }

  bool getVibrate() {
    return Hive.box(AppStrings.settingsBoxName).get(
      AppStrings.vibrateKey,
      defaultValue: true,
    );
  }
}
