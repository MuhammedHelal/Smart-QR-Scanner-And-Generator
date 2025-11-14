import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_reader/features/history/data/history_local_data_source.dart';
import 'package:qr_reader/features/history/domain/history_item_entity.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this.localDataSource) : super(HistoryInitial());
  final HistoryLocalDataSource localDataSource;
  int tapIndex = 0;
  List<HistoryItemEntity> history = [];

  void getHistory() {
    history = localDataSource.getHistory(tapIndex == 0);
    emit(HistorySuccess(history));
  }

  void chooseTab(int index) {
    tapIndex = index;
    getHistory();
  }

  void addHistory({
    required HistoryItemEntity historyItemEntity,
    required bool scannedHistory,
  }) {
    // 0 => scanned, 1 => generated
    if (scannedHistory && tapIndex == 0) {
      history.add(historyItemEntity);

      emit(HistorySuccess(history));
    } else if (!scannedHistory && tapIndex == 1) {
      history.add(historyItemEntity);
      emit(HistorySuccess(history));
    }

    localDataSource.addHistory(
      historyItemEntity: historyItemEntity,
      isScanned: scannedHistory,
    );
  }

  Future<void> deleteHistory(HistoryItemEntity item) async {
    history.remove(item);
    emit(HistorySuccess(history));
    await localDataSource.deleteHistory(
      item: item,
      isScanned: tapIndex == 0,
    );
  }

  void deleteAllHistory() {
    history.clear();

    emit(HistorySuccess(history));
    localDataSource.deleteAllHistory();
  }
}
