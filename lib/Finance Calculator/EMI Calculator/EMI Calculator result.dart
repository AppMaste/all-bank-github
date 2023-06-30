import 'dart:math';

import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Finance%20Calculator/EMI%20Calculator/EMI%20Calculator%20Detaila.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class EMICalculatorResultScreen extends StatefulWidget {
  EMICalculatorResultScreen({super.key});

  @override
  State<EMICalculatorResultScreen> createState() =>
      _EMICalculatorResultScreenState();
}

class _EMICalculatorResultScreenState extends State<EMICalculatorResultScreen> {
  var data = Get.arguments;

  var load = false.obs;

  // ignore: non_constant_identifier_names
  var Result = "".obs;

  // ignore: non_constant_identifier_names
  var Totalrate = "".obs;

  // ignore: non_constant_identifier_names
  var TotalMonth = "".obs;

  // ignore: non_constant_identifier_names
  var TotalPayment = "".obs;

  // ignore: non_constant_identifier_names

  var principalController = TextEditingController().obs;
  var rateController = TextEditingController().obs;
  var yearController = TextEditingController().obs;
  var monthController = TextEditingController().obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    principalController.value.text = data[0];
    rateController.value.text = data[1];
    yearController.value.text = data[2];
    monthController.value.text = data[3];
  }

  @override
  Widget build(BuildContext context) {
    print("DATAAA $data");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbarr,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  sameRow(context, "EMI Calculator"),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Container(
                    width: double.maxFinite,
                    decoration: decoration,
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.fSize_20()),
                        EMICALCULATION("Loan Amount", "₹", "Interest %", "%",
                            principalController.value, rateController.value),
                        EMICALCULATION("Loan Year", "Year", "Loan Month", "Month",
                            yearController.value, monthController.value),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              compareLoanContainer(context, "EMI Calculate", () {
                                if (principalController.value.text.isEmpty ||
                                    rateController.value.text.isEmpty ||
                                    yearController.value.text.isEmpty ||
                                    monthController.value.text.isEmpty) {
                                  fluttertost();
                                } else {
                                  load.value = true;
                                  handleclaculation();
                                }
                              }),
                              comparereset(context, "Reset", () {
                                principalController.value.clear();
                                rateController.value.clear();
                                yearController.value.clear();
                                monthController.value.clear();
                                load.value = false;
                              }),
                            ],
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        emiAdvanceCalculation(
                            context,
                            "Loan Amount",
                            "Total Interest",
                            "Total Payment",
                            "Periods(Month)",
                            load.value == true ? Result.toString() : "0.0",
                            load.value == true ? Totalrate.toString() : "0.0",
                            load.value == true ? TotalPayment.toString() : "0.0",
                            load.value == true ? TotalMonth.toString() : "0.0"),
                        SizedBox(height: ScreenSize.fSize_30()),
                        viewMoreDetail(context, () {
                          Get.to(
                            () =>  EMICalculatorDetailScreen(),
                            arguments: [
                              Result.value,
                              rateController.value.text,
                              principalController.value.text
                            ],
                          );
                        }),
                        SizedBox(height: ScreenSize.fSize_70()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          banner.getBN()
        ],
      ),
    );
  }

  handleclaculation() {
    int Principal = int.parse(principalController.value.text);
    double Rate = double.parse(rateController.value.text);
    int Year = int.parse(yearController.value.text);
    int Month = int.parse(monthController.value.text);

    double A = 0.0;
    int P = Principal;
    double r = Rate / 12 / 100;
    int n = Year * 12 + Month;
    print("N valueee:  $n");

    A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

    print("AAAA  $A");
    print("PPPP  $P");
    print("rrrr  $r");
    print("nnnn  $n");

    Result.value = A.toStringAsFixed(0);
    // double FinalAmount = Principal + (Principal * Term * Rate) / 100;
    // double loanamount = FinalAmount / Term * 12;
    int totalrate = int.parse(Result.value) * n - Principal;
    print("rateee:  $totalrate");

    int totalpayment = int.parse(Result.value) * n;
    print("Result:  ${Result.value}");
    print("payment:  $totalpayment");

    TotalMonth.value = n.toStringAsFixed(0);

    Totalrate.value = totalrate.toStringAsFixed(0);

    TotalPayment.value = totalpayment.toStringAsFixed(0);
    print("TotalPayment.value:  ${TotalPayment.value}");
    print("loanamount $Result\n\n");
    return Result;
  }
}
