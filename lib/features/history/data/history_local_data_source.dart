import 'package:hive/hive.dart';
import 'package:qr_reader/core/utils/strings.dart';
import 'package:qr_reader/features/history/domain/history_item_entity.dart';

class HistoryLocalDataSource {
  List<HistoryItemEntity> getHistory(bool getScannedHistory) {
    Box<HistoryItemEntity> box;
    if (getScannedHistory) {
      box = Hive.box<HistoryItemEntity>(AppStrings.scannedHistoryBoxName);
    } else {
      box = Hive.box<HistoryItemEntity>(AppStrings.generatedHistoryBoxName);
    }
    return box.values.toList();
  }

  void addHistory({
    required HistoryItemEntity historyItemEntity,
    required bool isScanned,
  }) async {
    Box<HistoryItemEntity> box;
    if (isScanned) {
      box = Hive.box<HistoryItemEntity>(AppStrings.scannedHistoryBoxName);
    } else {
      box = Hive.box<HistoryItemEntity>(AppStrings.generatedHistoryBoxName);
    }
    await box.add(historyItemEntity);
  }

  Future<void> deleteHistory({
    required HistoryItemEntity item,
    required bool isScanned,
  }) async {
    Box<HistoryItemEntity> box;
    if (isScanned) {
      box = Hive.box<HistoryItemEntity>(AppStrings.scannedHistoryBoxName);
    } else {
      box = Hive.box<HistoryItemEntity>(AppStrings.generatedHistoryBoxName);
    }
    final index = box.values.toList().indexOf(item);
    await box.deleteAt(index);
  }

  void deleteAllHistory() {
    final scannedBox =
        Hive.box<HistoryItemEntity>(AppStrings.scannedHistoryBoxName);
    scannedBox.clear();
    final generatedBox =
        Hive.box<HistoryItemEntity>(AppStrings.generatedHistoryBoxName);
    generatedBox.clear();
  }
}
