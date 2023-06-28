import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../Model/Bank Name Model.dart';
import '../ScreenSize.dart';

class BankStatementScreen extends StatelessWidget {
  BankStatementScreen({Key? key}) : super(key: key);

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // print("bankbank ${data[1]}");
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
                        "${data[0]}",
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
                    children: [
                      SizedBox(height: ScreenSize.fSize_28()),
                      statementController(context, "Bank Balance", "${data[1]}",
                          ScreenSize.fSize_110(), () {
                        print("button pressssss");
                        Share.share(data[1]);
                      }),
                      statementController(context, "Mini Statement", "${data[2]}",
                          ScreenSize.fSize_100(), () {
                        Share.share(data[2]);
                      }),
                      statementController(context, "Customer Care Number",
                          "${data[3]}", ScreenSize.fSize_40(), () {
                        Share.share(data[3]);
                      }),
                      SizedBox(height: ScreenSize.fSize_28()),
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
