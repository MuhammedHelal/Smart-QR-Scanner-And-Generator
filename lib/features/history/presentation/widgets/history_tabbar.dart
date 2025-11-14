import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_reader/core/utils/colors.dart';
import 'package:qr_reader/features/history/presentation/manager/history_cubit/history_cubit.dart';

class HistoryTabbar extends StatelessWidget {
  const HistoryTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HistoryCubit>(context);

    return DefaultTabController(
      length: 2,
      initialIndex: cubit.tapIndex,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.blackGreyish,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TabBar(
          dividerHeight: 0,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 4),
          indicator: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          labelColor: AppColors.blackGreyish,
          unselectedLabelColor: Colors.white,
          tabs: const [
            Tab(
              child: Text(
                'Scanned',
                //  style: AppTextStyles.white17W400,
              ),
            ),
            Tab(
              child: Text(
                'Generated',
                //  style: AppTextStyles.white17W400,
              ),
            ),
          ],
          onTap: (index) {
            cubit.chooseTab(index);
          },
        ),
      ),
    );
  }
}
