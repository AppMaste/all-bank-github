import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Compare Loan result.dart';

class CompareLoanScreen extends StatelessWidget {
  CompareLoanScreen({Key? key}) : super(key: key);

  TextEditingController Aloanamount = TextEditingController();
  TextEditingController Ainterest = TextEditingController();
  TextEditingController Aloanyear = TextEditingController();
  TextEditingController Aloanmonth = TextEditingController();
  TextEditingController Bloanamount = TextEditingController();
  TextEditingController Binterest = TextEditingController();
  TextEditingController Bloanyear = TextEditingController();
  TextEditingController Bloanmonth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbarr,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                sameRow(context, "Compare Loan"),
                SizedBox(height: ScreenSize.fSize_20()),
                Container(
                  width: double.maxFinite,
                  decoration: decoration,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ScreenSize.fSize_20()),
                        Center(
                          child: Text(
                            "Loan A",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF12356E),
                                fontSize: ScreenSize.fSize_20()),
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        compareContainer(context, "Loan Amount", "Interest %", "₹",
                            "%", Aloanamount, Ainterest,),
                        compareContainer(context, "Loan Year", "Loan Month", "Year",
                            "Month", Aloanyear, Aloanmonth,),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Center(
                          child: Text(
                            "Loan B",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF12356E),
                                fontSize: ScreenSize.fSize_20()),
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        compareContainer(context, "Loan Amount", "Interest %", "₹",
                            "%", Bloanamount, Binterest,),
                        compareContainer(context, "Loan Year", "Loan Month", "Year",
                            "Month", Bloanyear, Bloanmonth,),
                        SizedBox(height: ScreenSize.fSize_30()),
                        compareLoanContainer(context, "Compare Loan", () {
                          if (Aloanamount.text.isEmpty ||
                              Ainterest.text.isEmpty ||
                              Aloanyear.text.isEmpty ||
                              Aloanmonth.text.isEmpty ||
                              Bloanamount.text.isEmpty ||
                              Binterest.text.isEmpty ||
                              Bloanyear.text.isEmpty ||
                              Bloanmonth.text.isEmpty) {
                            fluttertost();
                          } else {
                            Get.to(
                              () => CompareLoanResultScreen(),
                              arguments: [
                                Aloanamount.text,
                                Ainterest.text,
                                Aloanyear.text,
                                Aloanmonth.text,
                                Bloanamount.text,
                                Binterest.text,
                                Bloanyear.text,
                                Bloanmonth.text,
                              ],
                            );
                          }
                        }),
                        SizedBox(height: ScreenSize.fSize_70()),
                      ],
                    ),
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
}
