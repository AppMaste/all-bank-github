import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';

class LoanCalculatorScreen extends StatelessWidget {
  LoanCalculatorScreen({Key? key}) : super(key: key);

  TextEditingController emiController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/LoanCalculatorScreen");
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
                  sameRow(context, "Loan Calculator"),
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
                            "Loan EMI",
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
                          Text(
                            "Interest %",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          emiadvance(
                            context,
                            interestController,
                            "%",
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
                          SizedBox(height: ScreenSize.fSize_30()),
                          compareLoanContainer(context, "Loan Calculate", () {
                            if (emiController.text.isEmpty ||
                                interestController.text.isEmpty ||
                                yearController.text.isEmpty ||
                                monthController.text.isEmpty) {
                              fluttertost();
                            } else {
                              tapButton.button(
                                context,
                                "/LoanCalculatorResultScreen",
                                [
                                  emiController,
                                  interestController,
                                  yearController,
                                  monthController,
                                ],
                              );
                              /*    Get.to(
                                () => LoanCalculatorResultScreen(),
                                arguments: [
                                  emiController,
                                  interestController,
                                  yearController,
                                  monthController,
                                ],
                              );*/
                            }
                          }),
                          SizedBox(height: ScreenSize.fSize_200()),
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
