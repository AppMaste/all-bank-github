import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';

class InterestCalculationScreen extends StatelessWidget {
  InterestCalculationScreen({Key? key}) : super(key: key);

  var amountController = TextEditingController();
  var emiController = TextEditingController();
  var yearController = TextEditingController();
  var monthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/InterestCalculationScreen");
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
                  sameRow(context, "Interest Rate"),
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
                            "Loan Amount",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          emiadvance(
                            context,
                            amountController,
                            "₹",
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Text(
                            "EMI",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          emiadvance(
                            context,
                            emiController,
                            "₹",
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          compareContainer(
                            context,
                            "Loan Year",
                            "Loan Month",
                            "Year",
                            "Month",
                            yearController,
                            monthController,
                          ),
                          SizedBox(height: ScreenSize.fSize_40()),
                          compareLoanContainer(context, "Interest Calculate", () {
                            if (amountController.text.isEmpty ||
                                emiController.text.isEmpty ||
                                yearController.text.isEmpty ||
                                monthController.text.isEmpty) {
                              fluttertost();
                            } else {
                              tapButton.button(
                                context,
                                "/InterestCalculationResultScreen",
                                [
                                  amountController,
                                  emiController,
                                  yearController,
                                  monthController,
                                ],
                              );
                              // Get.to(
                              //       () => const InterestCalculationResultScreen(),
                              //   arguments: [
                              //     amountController,
                              //     emiController,
                              //     yearController,
                              //     monthController,
                              //   ],
                              // );
                            }
                          }),
                          SizedBox(height: ScreenSize.fSize_30()),
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
      ),
    );
  }
}
