import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_reader/features/generate_qr/presentation/manager/show_qr_cubit/show_qr_cubit.dart';
import 'package:qr_reader/features/generate_qr/presentation/views/show_qr_view.dart';

class ShowQrViewWithCubit extends StatelessWidget {
  const ShowQrViewWithCubit(
    this.data, {
    super.key,
    this.isScanned = false,
    this.save = true,
  });
  final String data;
  final bool isScanned;
  final bool save;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowQrCubit(
        data: data,
        isScanned: isScanned,
        save: save,
      ),
      child: const ShowQrView(),
    );
  }
}
