part of 'show_qr_cubit.dart';

sealed class ShowQrState {}

final class ShowQrInitial extends ShowQrState {}

final class ShowQrSuccess extends ShowQrState {
  final String qrData;
  ShowQrSuccess({required this.qrData});
}

final class ShowQrError extends ShowQrState {}

final class ShowQrLoading extends ShowQrState {}
