import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class SMSBankBalanceScreen extends StatelessWidget {
  SMSBankBalanceScreen({Key? key}) : super(key: key);

  var arg = Get.arguments;

  var random = Random();

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("SMSBankBalanceScreen arg ${arg[1].toString()}");
    // print("SMSBankBalanceScreen arg ${arg.toString().split("[")[1].split(",")[1]}");
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
                    Container(
                      width: ScreenSize.horizontalBlockSize! * 80,
                      color: Colors.transparent,
                      child: Text(
                        arg[0],
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ibmPlexSansThaiLooped(
                            color: const Color(0xFF12356E),
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenSize.fSize_20()),
                      ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ScreenSize.fSize_30()),
                      SMSBankbalance(context, "For Primary Account"),
                      SizedBox(height: ScreenSize.fSize_8()),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenSize.fSize_8()),
                        child: Text(
                          arg[1],
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenSize.fSize_17(),
                              color: const Color(0xFF12356E)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenSize.fSize_8()),
                        child: Text(
                          "Example : BALAVL ${random.nextInt(4656)}",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w600, color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_10()),
                      SMSBankbalance2(context, controller,arg[1]),
                      SizedBox(height: ScreenSize.fSize_20()),
                      SMSSendMessage(context, () {}),
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
    );
  }
}
