import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/SIP%20Calculation/SIP%20Calculation%20Result%20Screen.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SIPCalculationScreen extends StatefulWidget {
  const SIPCalculationScreen({Key? key}) : super(key: key);

  @override
  State<SIPCalculationScreen> createState() => _SIPCalculationScreenState();
}

class _SIPCalculationScreenState extends State<SIPCalculationScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController yearController = TextEditingController();

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
                sameRow(context, "SIP Calculation"),
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
                          "Total Amount Expexcteed",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_10()),
                        emiadvance(context, amountController, "₹",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Expexcted Rate Of Return",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, rateController, "%",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Investment Period (Years)",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, yearController, "Year",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        emiadvancebutton(context, "SIP Plan Calculate", () {
                          if (amountController.text.isEmpty ||
                              rateController.text.isEmpty ||
                              yearController.text.isEmpty) {
                            fluttertost();
                          } else {
                            Get.to(
                              () => SIPCalculationResultScreen(),
                              arguments: [
                                amountController,
                                rateController,
                                yearController
                              ],
                            );
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
