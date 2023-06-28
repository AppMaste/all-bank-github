import 'dart:math';

import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'EMI Calculator result.dart';

class EMICalculatorScreen extends StatefulWidget {
  const EMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<EMICalculatorScreen> createState() => EMICalculatorScreenState();
}

class EMICalculatorScreenState extends State<EMICalculatorScreen> {

  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();

  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbarr,
      body: Form(
        key: fromKey,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  sameRow(context, "EMI Calculator"),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Container(
                    width: double.maxFinite,
                    decoration: decoration,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: ScreenSize.fSize_20()),
                          compareContainer(context, "Loan Amount", "Interest %",
                              "₹", "%", principalController, rateController,),
                          SizedBox(height: ScreenSize.fSize_20()),
                          compareContainer(context, "Loan Year", "Loan Month",
                              "Year", "Month", yearController, monthController,),
                          SizedBox(height: ScreenSize.fSize_40()),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                // setState(() {
                                if (principalController.text.isEmpty ||
                                    rateController.text.isEmpty ||
                                    yearController.text.isEmpty ||
                                    monthController.text.isEmpty) {
                                  fluttertost();
                                } else if (principalController
                                        .text.isNotEmpty ||
                                    rateController.text.isNotEmpty ||
                                    yearController.text.isNotEmpty ||
                                    monthController.text.isNotEmpty) {
                                  Get.to(() => EMICalculatorResultScreen(),
                                      arguments: [
                                        principalController.text,
                                        rateController.text,
                                        yearController.text,
                                        monthController.text,
                                      ]);
                                }
                                // });
                              },
                              child: Container(
                                width: ScreenSize.horizontalBlockSize! * 55,
                                height: ScreenSize.fSize_50(),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF12356E),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(ScreenSize.fSize_10()),
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          offset: Offset(0, 3))
                                    ]),
                                child: Center(
                                  child: Text(
                                    "EMI Calculate",
                                    style: GoogleFonts.ibmPlexSansThaiLooped(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: ScreenSize.fSize_15()),
                                  ),
                                ),
                              ),
                            ),
                          ),
/*                  compareLoanContainer222(
                              context,
                              "EMI Calculate",
                              EMICalculatorResultScreen(),
                              [Result, Totalrate, TotalMonth, TotalPayment],
                              handleclaculation()),*/
                          SizedBox(height: ScreenSize.fSize_30()),
                          /*   Text(Result),
                          Text(Totalrate),
                          Text(TotalMonth),
                          Text(TotalPayment),*/
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            banner.getBN()
          ],
        ),
      ),
    );
  }
}
