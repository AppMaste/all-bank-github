import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';
import 'RD Calculation Result Screen.dart';

class RDCalculationScreen extends StatelessWidget {
  RDCalculationScreen({Key? key}) : super(key: key);

  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController periodController = TextEditingController();

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
                sameRow(context, "RD Calculation"),
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
                        Text(
                          "Monthly Installment Amount",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_10()),
                        emiadvance(context, amountController, "₹",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Annual Interest Rate %",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, rateController, "%",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Period in Month",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, periodController, "Month",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        emiadvancebutton(context, "RD Calculate", () {
                          if (amountController.text.isEmpty ||
                              rateController.text.isEmpty ||
                              periodController.text.isEmpty) {
                            fluttertost();
                          } else {
                            Get.to(() => const RDCalculationResultScreen(),
                                arguments: [
                                  amountController,
                                  rateController,
                                  periodController
                                ]);
                          }
                        }),
                        SizedBox(height: ScreenSize.fSize_20()),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // banner.getBN()
        ],
      ),
    );
  }
}
