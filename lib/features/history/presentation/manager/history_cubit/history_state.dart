part of 'history_cubit.dart';

sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistorySuccess extends HistoryState {
  final List<HistoryItemEntity> history;

  HistorySuccess(this.history);
}

final class HistoryFail extends HistoryState {
  final String message;
  HistoryFail(this.message);
}

final class HistoryLoading extends HistoryState {}
