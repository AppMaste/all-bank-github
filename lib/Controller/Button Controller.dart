import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

final TapButton tapButton = Get.put(TapButton());
final BackButton backButton = Get.put(BackButton());

class TapButton extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Rx counter = 1.obs;

  button(BuildContext context, String page, var aa) async {
    if (remoteconfig.value["AD_Counter"] == counter.value) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Center(
              child: AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
                // backgroundColor: colorFromHex("#8cb425"),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
                    Text(
                      "Ad is loading...",
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: Colors.black, fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
      if (remoteconfig.value[Get.currentRoute]["Interstitial_AD"] == 'admob') {
        InterstitialAd.load(
          adUnitId: remoteconfig.value[Get.currentRoute]["Interstitial_ADMOB"],
          // adUnitId: "/6499/example/interstitial",
          request: const AdManagerAdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
            ad.show();
            Navigator.pop(context);
            page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
            counter.value = 1;
          }, onAdFailedToLoad: (error) {
            InterstitialAd.load(
              adUnitId: remoteconfig.value[Get.currentRoute]
                  ["Interstitial_ADMOB"],
              // adUnitId: "/6499/example/interstitial",
              request: const AdManagerAdRequest(),
              adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
                ad.show();
                Navigator.pop(context);
                page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
                counter.value = 1;
              }, onAdFailedToLoad: (error) {
                Navigator.pop(context);
                page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
                counter.value = 1;
              }),
            );
          }),
        );
      }

      if (remoteconfig.value[Get.currentRoute]["Interstitial_AD"] == 'fb') {
        FacebookInterstitialAd.loadInterstitialAd(
          placementId: remoteconfig.value[Get.currentRoute]
              ["Interstitial_FB_AD"],
          // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
          listener: (result, value) {
            if (result == InterstitialAdResult.LOADED) {
              FacebookInterstitialAd.showInterstitialAd;
              Navigator.pop(context);
              page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
              counter.value = 1;
            }
            if (result == InterstitialAdResult.ERROR) {
              Navigator.pop(context);
              page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
              counter.value = 1;
            }
          },
        );
      }
      if (remoteconfig.value[Get.currentRoute]["AD_Interstitial_TYPE"] ==
          "web") {
        _launchURL(remoteconfig.value[Get.currentRoute]["Url"]);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pop(context);
            page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
            counter.value = 1;
          },
        );
      }
    } else {
      // Get.to(() => const FirstPage());
      page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
      counter.value++;
      // controller.incrementClickCount(context, 'FirstPage');
    }
  }
}

class BackButton extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Rx backcounter = 1.obs;

  backbutton(BuildContext context, String page) async {
    if (remoteconfig.value["AD_BackCounter"] == backcounter.value) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Center(
              child: AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
                // backgroundColor: colorFromHex("#8cb425"),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
                    Text(
                      "Ad is loading...",
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: Colors.black, fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
      if (remoteconfig.value[page]["Interstitial_AD"] == 'admob') {
        InterstitialAd.load(
          adUnitId: remoteconfig.value[page]["Interstitial_ADMOB"],
          // adUnitId: "/6499/example/interstitial",
          request: const AdManagerAdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
            ad.show();
            Navigator.pop(context);
            Navigator.pop(context);
            // page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
            backcounter.value = 1;
          }, onAdFailedToLoad: (error) {
            InterstitialAd.load(
              adUnitId: remoteconfig.value[Get.currentRoute]
                  ["Interstitial_ADMOB"],
              // adUnitId: "/6499/example/interstitial",
              request: const AdManagerAdRequest(),
              adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
                ad.show();
                Navigator.pop(context);
                Navigator.pop(context);
                // page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
                backcounter.value = 1;
              }, onAdFailedToLoad: (error) {
                Navigator.pop(context);
                Navigator.pop(context);
                // page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
                backcounter.value = 1;
              }),
            );
          }),
        );
      }

      if (remoteconfig.value[page]["Interstitial_AD"] == 'fb') {
        FacebookInterstitialAd.loadInterstitialAd(
          placementId: remoteconfig.value[page]
              ["Interstitial_FB_AD"],
          // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
          listener: (result, value) {
            if (result == InterstitialAdResult.LOADED) {
              FacebookInterstitialAd.showInterstitialAd;
              Navigator.pop(context);
              Navigator.pop(context);
              // page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
              backcounter.value = 1;
            }
            if (result == InterstitialAdResult.ERROR) {
              Navigator.pop(context);
              Navigator.pop(context);
              // page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
              backcounter.value = 1;
            }
          },
        );
      }
      if (remoteconfig.value[page]["AD_Interstitial_TYPE"] ==
          "web") {
        _launchURL(remoteconfig.value[page]["Url"]);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pop(context);
            Navigator.pop(context);
            // page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
            backcounter.value = 1;
          },
        );
      }
    } else {
      // Get.to(() => const FirstPage());
      Navigator.pop(context);
      // page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
      backcounter.value++;
      // controller.incrementClickCount(context, 'FirstPage');
    }
  }
}
