import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/Lumpsum%20Calculation/Lumpsum%20Calculation%20Result%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';

class LumpsumCalculationScreen extends StatelessWidget {
  LumpsumCalculationScreen({Key? key}) : super(key: key);

  TextEditingController amountController = TextEditingController();
  TextEditingController tenureController = TextEditingController();
  TextEditingController rateController = TextEditingController();

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
                sameRow(context, "Lumpsum Calculate"),
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
                          "Investment Amount",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_10()),
                        emiadvance(context, amountController, "₹",
                            ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Tenure in",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, tenureController, "%",
                            ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Rate of Return (%)",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(
                            context, rateController, "%", ),
                        SizedBox(height: ScreenSize.fSize_30()),
                        emiadvancebutton(context, "Lumpsum Calculate", () {
                          if (amountController.text.isEmpty ||
                              tenureController.text.isEmpty ||
                              rateController.text.isEmpty) {
                            fluttertost();
                          } else {
                            Get.to(() => LumpsumCalculationResultScreen(),
                                arguments: [
                                  amountController,
                                  tenureController,
                                  rateController,
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
