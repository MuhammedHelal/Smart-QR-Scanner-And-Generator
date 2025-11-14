import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_reader/core/services/locator.dart';
import 'package:qr_reader/core/widgets/background_greyish_black.dart';
import 'package:qr_reader/features/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:qr_reader/features/history/presentation/widgets/history_view_body.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        const BackgroundGreyishBlack(),
        BlocProvider.value(
          value: locator<HistoryCubit>()..getHistory(),
          child: const HistoryViewBody(),
        ),
      ],
    );
  }
}
