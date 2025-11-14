import 'package:flutter/material.dart';
import 'package:qr_reader/core/functions/launch_url.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/action_button_impl.dart';

class WebsiteOpenUrlButton extends StatelessWidget {
  const WebsiteOpenUrlButton({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return ActionButtonImpl(
      icon: const Icon(
        Icons.open_in_browser,
        size: 30,
      ),
      title: 'Open URL',
      onPressed: () async {
        await myLaunchURL(data);
      },
    );
  }
}
