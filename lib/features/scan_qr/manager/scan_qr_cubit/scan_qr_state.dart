part of 'scan_qr_cubit.dart';

sealed class ScanQrState {}

final class ReadQrInitial extends ScanQrState {}

final class ReadQrSuccess extends ScanQrState {
  final String? data;
  ReadQrSuccess({required this.data}) {
    makeFeedback();
  }
}

final class ReadQrFail extends ScanQrState {
  final String message;

  ReadQrFail({required this.message});
}

final class StoragePermissionRequired extends ScanQrState {}

final class CameraPerssionRequired extends ScanQrState {}
