import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';

class InvestmentCalculateScreen extends StatelessWidget {
  InvestmentCalculateScreen({Key? key}) : super(key: key);

  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/InvestmentCalculateScreen");
        return Future(() => false);
      },
      child: Scaffold(
        appBar: appbarr,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  sameRow(context, "Investment Calculate"),
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
                            "SIP Amount",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          emiadvance(context, amountController, "₹",
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
                          SizedBox(height: ScreenSize.fSize_20()),
                          Text(
                            "Investment Year",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          emiadvance(context, yearController, "Year",
                              ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Text(
                            "Investment Month",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          emiadvance(context, monthController, "Month",
                              ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Text(
                            "*Select any one option year or month",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          emiadvancebutton(context, "Investment Calculate", () {
                            if (amountController.text.isEmpty ||
                                rateController.text.isEmpty ||
                                yearController.text.isEmpty ||
                                monthController.text.isEmpty) {
                              fluttertost();
                            } else {
                              tapButton.button(context, "/InvestmentResultScreen", [
                                amountController,
                                rateController,
                                yearController,
                                monthController
                              ],);
                              // Get.to(
                              //   () => const InvestmentResultScreen(),
                              //   arguments: [
                              //     amountController,
                              //     rateController,
                              //     yearController,
                              //     monthController
                              //   ]
                              // );
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
      ),
    );
  }
}
