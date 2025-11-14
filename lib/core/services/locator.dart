import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:qr_reader/features/history/data/history_local_data_source.dart';
import 'package:qr_reader/features/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:qr_reader/features/scan_qr/manager/scan_qr_cubit/scan_qr_cubit.dart';
import 'package:qr_reader/features/settings/presentation/manager/cubit/settings_cubit.dart';

final GetIt locator = GetIt.instance;
void setupServiceLocator() {
  locator.registerLazySingleton<SettingsCubit>(
    () => SettingsCubit(),
  );
  locator.registerLazySingleton<DeviceInfoPlugin>(
    () => DeviceInfoPlugin(),
  );
  locator.registerLazySingleton<AudioPlayer>(
    () => AudioPlayer(),
  );
  locator.registerLazySingleton<ScanQrCubit>(
    () => ScanQrCubit(),
  );

  locator.registerLazySingleton<HistoryCubit>(
    () => HistoryCubit(HistoryLocalDataSource()),
  );
}
