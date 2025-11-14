import 'package:qr_reader/core/utils/strings.dart';

class SettingsEntity {
  final bool vibrate;
  final bool beep;

  SettingsEntity({
    required this.vibrate,
    required this.beep,
  });

  Map<String, dynamic> toMap() {
    return {
      AppStrings.vibrateKey: vibrate,
      AppStrings.beepKey: beep,
    };
  }

  factory SettingsEntity.fromMap(Map<dynamic, dynamic> map) {
    return SettingsEntity(
      vibrate: map[AppStrings.vibrateKey] ?? true,
      beep: map[AppStrings.beepKey] ?? false,
    );
  }

  SettingsEntity copyWith({
    bool? vibrate,
    bool? beep,
  }) {
    return SettingsEntity(
      vibrate: vibrate ?? this.vibrate,
      beep: beep ?? this.beep,
    );
  }
}
