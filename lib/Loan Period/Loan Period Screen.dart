import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanPeriodScreen extends StatelessWidget {
  LoanPeriodScreen({Key? key}) : super(key: key);

  TextEditingController amountController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController emiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/LoanPeriodScreen");
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
                  sameRow(context, "Loan Period"),
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
                          SizedBox(height: ScreenSize.fSize_40()),
                          compareLoanContainer(context, "Interest Calculate",
                              () {
                            if (amountController.text.isEmpty ||
                                interestController.text.isEmpty ||
                                emiController.text.isEmpty) {
                              fluttertost();
                            } else {
                              tapButton.button(
                                context,
                                "/LoanPeriodResultScreen",
                                [
                                  amountController,
                                  interestController,
                                  emiController,
                                ],
                              );
                              // Get.to(
                              //   () => const LoanPeriodResultScreen(),
                              //   arguments: [
                              //     amountController,
                              //     interestController,
                              //     emiController,
                              //   ],
                              // );
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
            // banner.getBN()
          ],
        ),
      ),
    );
  }
}
