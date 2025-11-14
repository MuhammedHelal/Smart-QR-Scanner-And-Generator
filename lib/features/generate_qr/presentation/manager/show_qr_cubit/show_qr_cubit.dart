import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_reader/core/classes/qr_parser.dart';

part 'show_qr_state.dart';

class ShowQrCubit extends Cubit<ShowQrState> {
  ShowQrCubit({
    required this.data,
    required this.isScanned,
    required this.save,
  }) : super(ShowQrInitial()) {
    getQrData();
  }
  final bool isScanned;
  final String data;
  final bool save;
  String? qrData;
  late final QRCodeType qrType;

  void getQrData() {
    emit(ShowQrLoading());

    qrType = QRCodeParser.getQRCodeType(data);
    qrData = QRCodeParser.parseQrCodeType(data: data, type: qrType);
    if (qrData == null) {
      emit(ShowQrError());
    } else {
      emit(ShowQrSuccess(qrData: qrData!));
    }
  }
}
