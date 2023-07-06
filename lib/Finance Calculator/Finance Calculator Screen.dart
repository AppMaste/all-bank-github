import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FinanceCalculatorScreen extends StatelessWidget {
  const FinanceCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/FinanceCalculatorScreen");
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
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_6()),
                      Text(
                        "Finance Calculator",
                        style: GoogleFonts.ibmPlexSansThaiLooped(
                            color: const Color(0xFF12356E),
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenSize.fSize_20()),
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
                        SizedBox(height: ScreenSize.fSize_30()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ussdContainer(
                                context,
                                "Compare Loan",
                                "Personal loan interest calculator",
                                "assets/icons/New folder/compare loan icon.png",
                                () {
                                  tapButton.button(context, "/CompareLoanScreen", '');
                              // Get.to(() => CompareLoanScreen());
                            }),
                            ussdContainer(
                                context,
                                "EMI Calculator",
                                "Helps you calculate the EMI",
                                "assets/icons/New folder/EMI calculator icon.png",
                                () {
                                  tapButton.button(context, "/EMICalculatorScreen", '');
                              // Get.to(() => const EMICalculatorScreen());
                            }),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        // native.getNT("listTileMedium"),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ussdContainer(
                                context,
                                "EMI in Advance",
                                "EMI, Affordability, Tenure & Interest Rate EMI in",
                                "assets/icons/New folder/EMI advance icon.png",
                                () {
                                  tapButton.button(context, "/EMIAdvanceScreen", '');
                              // Get.to(() => const EMIAdvanceScreen());
                            }),
                            ussdContainer(
                                context,
                                "Loan Calculator",
                                "Personal loan interest calculator",
                                "assets/icons/New folder/Loan Calculator icon.png",
                                () {
                                  tapButton.button(context, "/LoanCalculatorScreen", '');
                              // Get.to(() => LoanCalculatorScreen());
                            }),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ussdContainer(
                                context,
                                "Interest Calculation",
                                "Interest rate is defined as the proportion of an amount",
                                "assets/icons/New folder/Interest Calculation icon.png",
                                () {
                                  tapButton.button(context, "/InterestCalculationScreen", '');
                              // Get.to(() => InterestCalculationScreen());
                            }),
                            ussdContainer(
                                context,
                                "Loan Period",
                                "Loan period is the academic year or portion of an aca...",
                                "assets/icons/New folder/Loan Period icon.png",
                                () {
                                  tapButton.button(context, "/LoanPeriodScreen", '');
                              // Get.to(() => LoanPeriodScreen());
                            }),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ussdContainer(
                                context,
                                "FD Calculation",
                                "Multiplying the principal, rate of interest and the...",
                                "assets/icons/New folder/FD Calculation icon.png",
                                () {
                                  tapButton.button(context, "/FDCalculationScreen", '');
                              // Get.to(() => const FDCalculationScreen());
                            }),
                            ussdContainer(
                                context,
                                "RD Calculation",
                                "Loan period is the academic year or portion of an aca...",
                                "assets/icons/New folder/RD Calculation icon.png",
                                () {
                                  tapButton.button(context, "/RDCalculationScreen", '');
                              // Get.to(() => RDCalculationScreen());
                            }),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ussdContainer(
                                context,
                                "PPF Calculation",
                                "PPF can be a good option keeping all things in mind",
                                "assets/icons/New folder/PPF Calculation icon.png",
                                () {
                                  tapButton.button(context, "/PPFCalculationScreen", '');
                              // Get.to(() => PPFCalculationScreen());
                            }),
                            ussdContainer(
                                context,
                                "Simple Calculation",
                                "Start your planning with the multiple calculators...",
                                "assets/icons/New folder/Simple Calculation icon.png",
                                () {
                                  tapButton.button(context, "/SimpleCalculationScreen", '');
                              // Get.to(() => SimpleCalculationScreen());
                            }),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ussdContainer(
                                context,
                                "Investment Plan",
                                "Helps you start your planning with the multiple...",
                                "assets/icons/New folder/Investment Plan Icon.png",
                                () {
                                  tapButton.button(context, "/InvestmentCalculateScreen", '');
                              // Get.to(() => InvestmentCalculateScreen());
                            }),
                            ussdContainer(
                                context,
                                "SIP Plan",
                                "Makes use of power of compounding in market to...",
                                "assets/icons/New folder/SIP Plan Icon.png", () {
                              tapButton.button(context, "/SIPCalculationScreen", '');
                              // Get.to(() => const SIPCalculationScreen());
                            }),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ussdContainer(
                                context,
                                "Lumpsum Calcula...",
                                "Investment over a period of time considering it...",
                                "assets/icons/New folder/Lumpsum Calculator icon.png",
                                () {
                                  tapButton.button(context, "/LumpsumCalculationScreen", '');
                              // Get.to(() => LumpsumCalculationScreen());
                            }),
                            ussdContainer(
                                context,
                                "GST Calculator",
                                "GST amount by using GST calculator online",
                                "assets/icons/New folder/GST Calculator icon.png",
                                () {
                                  tapButton.button(context, "/GSTCalculatorScreen", '');
                              // Get.to(() => const GSTCalculatorScreen());
                            }),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_70()),
                      ],
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
