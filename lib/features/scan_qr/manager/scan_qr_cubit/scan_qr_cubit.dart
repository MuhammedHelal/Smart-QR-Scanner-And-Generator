import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_tools/qr_code_tools.dart';
import 'package:qr_reader/core/functions/make_feedback.dart';
part 'scan_qr_state.dart';

class ScanQrCubit extends Cubit<ScanQrState> {
  ScanQrCubit() : super(ReadQrInitial());
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String intentFilePath = '';
  bool shouldReCheckCameraPermission = false;
  void scanBycamera() async {
    if (state is! ReadQrInitial) {
      emit(ReadQrInitial());

      await controller?.resumeCamera();
    }
  }

  void onPermissionSet(bool hasPermission) {
    if (!hasPermission) {
      emit(CameraPerssionRequired());
    }
  }

  /* Future<PermissionStatus> requestStoragePermission() async {
    final androidInfo = await locator<DeviceInfoPlugin>().androidInfo;
    final int version = androidInfo.version.sdkInt;
    PermissionStatus status;
    if (version < 33) {
      status = await Permission.storage.request();
    } else {
      status = await Permission.manageExternalStorage.request();
    }
    return status;
  }*/

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      emit(ReadQrInitial());
    } else {
      await openAppSettings();
      shouldReCheckCameraPermission = true;
    }
  }

  Future<void> checkIfCameraPermissionIsGranted() async {
    if (!shouldReCheckCameraPermission) {
      log('Should not recheck camera permission');
      return;
    }

    final status = await Permission.camera.isGranted;
    log('Camera permission status: $status');

    if (status) {
      log('Camera permission is granted');
      emit(ReadQrInitial());
      shouldReCheckCameraPermission = false;
    }
  }

  Future<void> scanFromIntent() async {
    /* final status = await requestStoragePermission();
    if (status.isDenied || status.isPermanentlyDenied) {
      emit(StoragePermissionRequired());
      return;
    }*/
    try {
      log('Scanning from intent: $intentFilePath');
      final qrResult = await QrCodeToolsPlugin.decodeFrom(intentFilePath);
      log('QR result: $qrResult');
      emit(ReadQrSuccess(data: qrResult));

      if (qrResult == null) {
        log('No QR code found');
        emit(ReadQrFail(message: 'No QR code found'));
        return;
      }
    } on PlatformException catch (e) {
      log('Exception: ${e.code}');
      emit(ReadQrFail(message: e.code));
    } catch (e) {
      log('Exception: ${e.toString()}');
      emit(ReadQrFail(message: e.toString()));
    }
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (scanData.code == null) return;
      emit(ReadQrSuccess(data: scanData.code!));
      await controller.pauseCamera();
    });
  }

  Future<void> scanImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      try {
        final qrResult = await QrCodeToolsPlugin.decodeFrom(pickedFile.path);
        emit(ReadQrSuccess(data: qrResult));

        if (qrResult == null) {
          emit(ReadQrFail(message: 'No QR code found'));
          return;
        }
      } on PlatformException catch (e) {
        emit(ReadQrFail(message: e.code));
      } catch (e) {
        emit(ReadQrFail(message: e.toString()));
      }
    } else {
      emit(ReadQrFail(message: 'No image selected'));
    }
  }
}
