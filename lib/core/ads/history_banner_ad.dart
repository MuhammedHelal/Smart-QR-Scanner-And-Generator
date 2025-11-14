import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_reader/core/ads/ad_strings.dart';
import 'package:qr_reader/core/utils/flavor_config.dart';

class HistoryBannerAd extends StatefulWidget {
  const HistoryBannerAd({super.key});

  @override
  _HistoryBannerAdState createState() => _HistoryBannerAdState();
}

class _HistoryBannerAdState extends State<HistoryBannerAd> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    if (FlavorConfig.isPaid) {
      return;
    }

    _bannerAd = BannerAd(
      adUnitId: AdStrings.historyBannerAd,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          log('Ad failed to load: $error');
        },
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isPaid || !_isAdLoaded || _bannerAd == null) {
      return const SizedBox.shrink();
    }
    return Container(
      alignment: Alignment.center,
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
