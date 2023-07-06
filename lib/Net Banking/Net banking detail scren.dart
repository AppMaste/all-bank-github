import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/Button Controller.dart';
import '../ScreenSize.dart';

class NetBankingDetailScreen extends StatelessWidget {
  NetBankingDetailScreen({Key? key}) : super(key: key);

  var bankdata = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // print("objecttt ${bankdata}");
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/NetBankingDetailScreen");
        return Future(() => false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appbarr,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_6()),
                      Text(
                        "${bankdata[0]}",
                        style: GoogleFonts.ibmPlexSansThaiLooped(
                            color: const Color(0xFF12356E),
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenSize.fSize_20()),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_20()),
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
                        SizedBox(height: ScreenSize.fSize_30()),
                        SMSContainer2(context, () {
                          tapButton.button(
                            context,
                            "/NetBankingWebScreen",
                            bankdata[1],
                          );
                          // Get.to(() => const NetBankingWebScreen(),arguments: bankdata[1]);
                        }, "Official Website", "Personal Banking"),
                        SizedBox(height: ScreenSize.fSize_30()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            banner.getBN()
          ],
        ),
      ),
    );
  }
}
