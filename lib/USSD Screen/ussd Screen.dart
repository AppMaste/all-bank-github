import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';

class USSDBankingScreen extends StatelessWidget {
  const USSDBankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/USSDBankingScreen");
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
                        "USSD Banking",
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
                        // native.getNT("listTileMedium")
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ussdContainer(context, "USSD Banking", "All Bank USSD Code",
                                "assets/icons/USSD banking icon.png", () {
                              tapButton.button(context, "/AllBankUSSDCodeScreen", '');
                                  // Get.to(() => const AllBankUSSDCodeScreen());
                                }),
                            ussdContainer2(context, "Dial *99# First Ti...",
                                "First Time setup Dial *99#", "*99#", () {
                              tapButton.button(context, "/SetUpDialScreen", '');
                                  // Get.to(() =>  SetUpDialScreen());
                                })
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_70()),
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
