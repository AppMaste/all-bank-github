import 'dart:convert';

import 'package:all_bank/Finance%20Calculator/Finance%20Calculator%20Screen.dart';
import 'package:all_bank/Get%20Started%20Screen/Logo%20Screen.dart';
import 'package:all_bank/demo%20page.dart';
import 'package:all_bank/demopage2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
RxMap remoteconfig = {}.obs;

Future initConfig() async {
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 1),
    minimumFetchInterval: const Duration(seconds: 10),
  ));
  await remoteConfig.fetchAndActivate();
}

AppOpenAd? appOpenAd;

loadAd() {
  AppOpenAd.load(
    // adUnitId: "/6499/example/app-open",
    adUnitId: remoteconfig.value['AppOpen AD'],
    orientation: AppOpenAd.orientationPortrait,
    request: const AdManagerAdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        print("Ad Loaded.................................");
        appOpenAd = ad;
        // isLoaded=true;
        ad.show();
      },
      onAdFailedToLoad: (error) {
        // loadAd();
        AppOpenAd.load(
          // adUnitId: "/6499/example/app-open",
          adUnitId: remoteconfig.value['AppOpen AD'],
          // adUnitId: "ca-app-pub-3940256099942544/3419835294",
          orientation: AppOpenAd.orientationPortrait,
          request: const AdManagerAdRequest(),
          adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (ad) {
              print("Ad Loaded.................................");
              appOpenAd = ad;
              // isLoaded=true;
              ad.show();
            },
            onAdFailedToLoad: (error) {
              // loadAd();
              // Handle the error.
            },
          ),
        );

        // Handle the error.
      },
    ),
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  initConfig().whenComplete(() {
    remoteconfig.value = json.decode(remoteConfig.getString('BankApp'));
    loadAd();
  });
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogoScreen(),
    ),
  );
}

/*void main() {
  runApp(
    const GetMaterialApp(
      home: FinanceCalculatorScreen(),
    ),
  );
}*/
