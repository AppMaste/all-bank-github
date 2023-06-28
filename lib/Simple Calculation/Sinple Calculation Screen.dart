import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:all_bank/Simple%20Calculation/Simple%20Calculation%20Result%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleCalculationScreen extends StatelessWidget {
  SimpleCalculationScreen({Key? key}) : super(key: key);

  TextEditingController amountController = TextEditingController();
  TextEditingController interestController = TextEditingController();
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
                sameRow(context, "Simple Calculation"),
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
                        compareContainer(context, "PPF Amount", "Interest %", "₹",
                            "%", amountController, interestController,),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Period in Year",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, yearController, "Year",),
                        SizedBox(height: ScreenSize.fSize_30()),
                        emiadvancebutton(context, "Simple Calculate", () {
                          if (amountController.text.isEmpty ||
                              interestController.text.isEmpty ||
                              yearController.text.isEmpty) {
                            fluttertost();
                          } else {
                            Get.to(
                              () => const SimpleCalculationResultScreen(),
                              arguments: [
                                amountController,
                                interestController,
                                yearController
                              ],
                            );
                          }
                        }),
                        SizedBox(height: ScreenSize.fSize_20()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // banner.getBN()
        ],
      ),
    );
  }
}
