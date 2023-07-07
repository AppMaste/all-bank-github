import 'dart:io';

import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceBetween,
      scrollable: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      backgroundColor: Colors.white,
      title: const Center(
          child: Image(image: AssetImage("assets/icons/exit icon.png"))),
      content: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Want to Exit ?',
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenSize.fSize_20(),
                  color: const Color(0xFF12356E)),
            ),
            Text(
              'Are you sure you want to close this application ?',
              style: GoogleFonts.ibmPlexSansThaiLooped(
                color: const Color(0xFF768AAB),
              ),
            ),
            SizedBox(height: ScreenSize.fSize_12()),
            const Divider(
              color: Color(0xFF768AAB),
              thickness: 1,
            )
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: Container(
                height: ScreenSize.fSize_45(),
                width: ScreenSize.fSize_120(),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(ScreenSize.fSize_10()),
                    ),
                    border: Border.all(color: const Color(0xFF12356E))),
                child: Center(
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.ibmPlexSansThaiLooped(
                        fontSize: ScreenSize.fSize_15(),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF12356E)),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                exit(0);
              },
              child: Container(
                height: ScreenSize.fSize_45(),
                width: ScreenSize.fSize_120(),
                decoration: BoxDecoration(
                  color: Color(0xFF12356E),
                  borderRadius: BorderRadius.all(
                    Radius.circular(ScreenSize.fSize_10()),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Close",
                    style: GoogleFonts.ibmPlexSansThaiLooped(
                        fontSize: ScreenSize.fSize_15(),
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_100()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Welcome!",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                              color: const Color(0xFF12356E),
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenSize.horizontalBlockSize! * 5.6),
                        ),
                        GestureDetector(
                          onTap: () {
                            tapButton.button(context, "/SettingScreen", '');
                            // Get.to(() => const SettingScreen());
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: ScreenSize.fSize_12()),
                            child: Image(
                                image: const AssetImage(
                                    "assets/icons/Setting icon.png"),
                                height: ScreenSize.fSize_40()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_6()),
                      Text(
                        "All Bank Balance",
                        style: GoogleFonts.ibmPlexSansThaiLooped(
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
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                homescrencontainer(
                                    context,
                                    "assets/icons/missed-call-banking-icon.png",
                                    "Missed Call Banking",
                                    "Missed call banking helps you to check your bank balance at anytime."),
                                homescrencontainer(
                                    context,
                                    "assets/icons/IFSC & MICR -icon.png",
                                    "IFSC & MICR Details",
                                    "Check IFSC via Bank Name state, District or Branch"),
                              ],
                            ),
                            SizedBox(height: ScreenSize.fSize_60()),
                            native.getNT("listTile"),
                            SizedBox(height: ScreenSize.fSize_40()),
                            Row(
                              children: [
                                SizedBox(width: ScreenSize.fSize_6()),
                                Text(
                                  "Banking Option:",
                                  style: GoogleFonts.ibmPlexSansThaiLooped(
                                      color: const Color(0xFF12356E),
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenSize.fSize_20()),
                                ),
                              ],
                            ),
                            SizedBox(height: ScreenSize.fSize_24()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                smscontrolller(
                                    context,
                                    "assets/icons/SMS Banking icon.png",
                                    "SMS Banking", () {
                                  tapButton.button(
                                      context, "/SMSBankingScreen", '');
                                  // Get.to(() => const SMSBankingScreen());
                                }),
                                smscontrolller(
                                    context,
                                    "assets/icons/net banking icon.png",
                                    "Net Banking", () {
                                      tapButton.button(context, "/NetBankingScreen", '');
                                  // Get.to(() => const NetBankingScreen());
                                }),
                                smscontrolller(
                                    context,
                                    "assets/icons/USSD banking icon.png",
                                    "USSD Banking", () {
                                      tapButton.button(context, '/USSDBankingScreen', '');
                                  // Get.to(() => const USSDBankingScreen());
                                }),
                              ],
                            ),
                            SizedBox(height: ScreenSize.fSize_28()),
                            financeController(() {
                              tapButton.button(context, "/FinanceCalculatorScreen", "");
                              // Get.to(() => const FinanceCalculatorScreen());
                            }),
                            SizedBox(height: ScreenSize.fSize_28()),
                            Row(
                              children: [
                                SizedBox(width: ScreenSize.fSize_6()),
                                Text(
                                  "More Option:",
                                  style: GoogleFonts.ibmPlexSansThaiLooped(
                                      color: const Color(0xFF12356E),
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenSize.fSize_20()),
                                ),
                              ],
                            ),
                            SizedBox(height: ScreenSize.fSize_24()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                smscontrolller(
                                    context,
                                    "assets/icons/EPF & Passbook icon.png",
                                    "EPF & Passbook", () {
                                      tapButton.button(context, "/EPFBalancePassbookScreen", '');
                                  // Get.to(
                                  //     () => const EPFBalancePassbookScreen());
                                }),
                                smscontrolller(
                                    context,
                                    "assets/icons/bank holiday icon.png",
                                    "Bank Holiday", () {
                                  tapButton.button(context, "/BankHolidayScreen", '');
                                  // Get.to(() => BankHolidayScreen());
                                }),
                                smscontrolller(
                                    context,
                                    "assets/icons/near by place icon.png",
                                    "Near By Place", () {
                                  tapButton.button(context, "/NearByPlaceScreen", '');
                                  // Get.to(() => const NearByPlaceScreen());
                                }),
                              ],
                            ),
                            SizedBox(height: ScreenSize.fSize_100()),
                          ],
                        ),
                        rightarrowcontroller(context, () {
                          tapButton.button(context, "/MissedCallBankScreen", '');
                          // Get.to(() => const MissedCallBankScreen());
                        }, ScreenSize.horizontalBlockSize! * 17),
                        rightarrowcontroller(context, () {
                          tapButton.button(context, "/IFSCBankScreen", '');
                          // Get.to(() => IFSCBankScreen());
                        }, ScreenSize.horizontalBlockSize! * 67),
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
