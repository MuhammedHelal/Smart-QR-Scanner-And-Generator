import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:qr_reader/core/services/locator.dart';
import 'package:qr_reader/core/utils/flavor_config.dart';
import 'package:qr_reader/core/utils/strings.dart';
import 'package:qr_reader/features/history/domain/history_item_entity.dart';
import 'package:qr_reader/qr_scanner.dart';

import 'core/utils/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig.appFlavor = AppFlavor.free;
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();

  await Hive.initFlutter();
  Hive.registerAdapter<HistoryItemEntity>(HistoryItemEntityAdapter());
  await Future.wait([
    Hive.openBox<HistoryItemEntity>(AppStrings.scannedHistoryBoxName),
    Hive.openBox<HistoryItemEntity>(AppStrings.generatedHistoryBoxName),
    Hive.openBox(AppStrings.settingsBoxName),
  ]);

  runApp(const QrScanner());
  final targetingInfo = await MobileAds.instance.initialize();
  log(targetingInfo.toString());
}
