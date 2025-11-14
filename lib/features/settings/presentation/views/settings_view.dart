import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_reader/core/widgets/back_icon_widget.dart';
import 'package:qr_reader/core/widgets/background_greyish_black.dart';
import 'package:qr_reader/features/settings/presentation/widgets/settings_column.dart';
import 'package:qr_reader/features/settings/presentation/widgets/support_column.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundGreyishBlack(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    BackIconWidget(),
                    Gap(30),
                    SettingsColumn(),
                    Gap(30),
                    SupportColumn(),
                    Gap(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
