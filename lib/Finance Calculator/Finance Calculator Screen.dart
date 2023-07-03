import 'package:all_bank/EMI%20in%20Advance/EMI%20in%20Advance%20Screen.dart';
import 'package:all_bank/FD%20Calculation/FD%20Calculation%20Screen.dart';
import 'package:all_bank/Interest%20calculation/Interest%20Calculation%20Screen.dart';
import 'package:all_bank/Investment%20Calculate/Investment%20Calculate%20Screen.dart';
import 'package:all_bank/Loan%20Calculator/Loan%20Calculator%20Screen.dart';
import 'package:all_bank/Loan%20Period/Loan%20Period%20Screen.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/Lumpsum%20Calculation/Lumpsum%20Calculation%20Screen.dart';
import 'package:all_bank/SIP%20Calculation/SIP%20Calculation%20Screen.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../GST Calculator/GST Calculator Screen.dart';
import '../PPF Calculation/PPF Calculation Screen.dart';
import '../RD Calculation/RD Calculation Screen.dart';
import '../Simple Calculation/Sinple Calculation Screen.dart';
import 'Compare loan/Compare Loan Screen.dart';
import 'EMI Calculator/EMI Calculator Screen.dart';

class FinanceCalculatorScreen extends StatelessWidget {
  const FinanceCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
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
                            Get.to(() => CompareLoanScreen());
                          }),
                          ussdContainer(
                              context,
                              "EMI Calculator",
                              "Helps you calculate the EMI",
                              "assets/icons/New folder/EMI calculator icon.png",
                              () {
                            Get.to(() => const EMICalculatorScreen());
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
                            Get.to(() => const EMIAdvanceScreen());
                          }),
                          ussdContainer(
                              context,
                              "Loan Calculator",
                              "Personal loan interest calculator",
                              "assets/icons/New folder/Loan Calculator icon.png",
                              () {
                            Get.to(() => LoanCalculatorScreen());
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
                            Get.to(() => InterestCalculationScreen());
                          }),
                          ussdContainer(
                              context,
                              "Loan Period",
                              "Loan period is the academic year or portion of an aca...",
                              "assets/icons/New folder/Loan Period icon.png",
                              () {
                            Get.to(() => LoanPeriodScreen());
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
                            Get.to(() => const FDCalculationScreen());
                          }),
                          ussdContainer(
                              context,
                              "RD Calculation",
                              "Loan period is the academic year or portion of an aca...",
                              "assets/icons/New folder/RD Calculation icon.png",
                              () {
                            Get.to(() => RDCalculationScreen());
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
                            Get.to(() => PPFCalculationScreen());
                          }),
                          ussdContainer(
                              context,
                              "Simple Calculation",
                              "Start your planning with the multiple calculators...",
                              "assets/icons/New folder/Simple Calculation icon.png",
                              () {
                            Get.to(() => SimpleCalculationScreen());
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
                            Get.to(() => InvestmentCalculateScreen());
                          }),
                          ussdContainer(
                              context,
                              "SIP Plan",
                              "Makes use of power of compounding in market to...",
                              "assets/icons/New folder/SIP Plan Icon.png", () {
                            Get.to(() => const SIPCalculationScreen());
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
                            Get.to(() => LumpsumCalculationScreen());
                          }),
                          ussdContainer(
                              context,
                              "GST Calculator",
                              "GST amount by using GST calculator online",
                              "assets/icons/New folder/GST Calculator icon.png",
                              () {
                            Get.to(() => const GSTCalculatorScreen());
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
    );
  }
}
