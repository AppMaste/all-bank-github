import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/Setting/Privacy%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ScreenSize.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarr,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: ScreenSize.fSize_6()),
                    Flexible(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        "Setting",
                        style: GoogleFonts.ibmPlexSansThaiLooped(
                            color: const Color(0xFF12356E),
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenSize.fSize_20()),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.fSize_40()),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBF1FE),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(ScreenSize.fSize_30()),
                        topLeft: Radius.circular(ScreenSize.fSize_30())),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: ScreenSize.fSize_20()),
                      settingContoller(
                          context,
                          "Share App",
                          "Share your friends and family",
                          "assets/icons/share-icon.png", () {
                        Share.share("https://www.youtube.com/");
                      }),
                      settingContoller(
                          context,
                          "Rate Us",
                          "If you enjoy using our App, Please Rate Us",
                          "assets/icons/rate us -icon.png", () {
                        _shareURL();
                      }),
                      settingContoller(
                          context,
                          "Privacy Policy",
                          "By click on start you to our privacy policy",
                          "assets/icons/privacy policy icon.png", () {
                        Get.to(() => const PrivacyScreen());
                      }),
                      settingContoller(context, "App Version", "Version : 1.3",
                          "assets/icons/app version icon.png", () {}),
                      SizedBox(height: ScreenSize.fSize_80()),
                    ],
                  ),
                )
              ],
            ),
          ),
          banner.getBN()
        ],
      ),
    );
  }

  _shareURL() async {
    const url = 'https://in.linkedin.com/company/infinitizi?trk=ppro_cprof';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
