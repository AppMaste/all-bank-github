import 'dart:math';

import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:math' as math;

import 'package:pie_chart/pie_chart.dart';

class SimpleCalculationPieChartScreen extends StatefulWidget {
  SimpleCalculationPieChartScreen({Key? key}) : super(key: key);

  @override
  State<SimpleCalculationPieChartScreen> createState() =>
      _SimpleCalculationPieChartScreenState();
}

class _SimpleCalculationPieChartScreenState
    extends State<SimpleCalculationPieChartScreen> {
  var arg = Get.arguments;

  @override
  void initState() {
    super.initState();
    emicalcualtion();
  }

  // ignore: non_constant_identifier_names
  var Result = "".obs;

  // ignore: non_constant_identifier_names
  var Totalrate = "".obs;

  // ignore: non_constant_identifier_names
  var TotalMonth = "".obs;

  // ignore: non_constant_identifier_names
  var TotalPayment = "".obs;

  @override
  Widget build(BuildContext context) {
    // print("ghdchgadasgdcgsahd $arg");
    final dataMap = <String, double>{
      "Loan (${arg[0]})": 100,
      "Interest (${arg[2]})": 4,
    };
    final chart = PieChart(
      legendOptions: const LegendOptions(
        legendPosition: LegendPosition.bottom,
        legendShape: BoxShape.rectangle,
        showLegendsInRow: true,
      ),
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartRadius: math.min(MediaQuery.of(context).size.width / 1.7, 300),
      colorList: colorList,
      emptyColor: Colors.grey,
      // baseChartColor: Colors.transparent,
    );
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/SimpleCalculationPieChartScreen");
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
                  sameRow(context, "PPF Details"),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Container(
                    width: double.maxFinite,
                    decoration: decoration,
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.fSize_24()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: ScreenSize.fSize_50(),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(ScreenSize.fSize_10()),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(0, 3))
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width:
                                          ScreenSize.horizontalBlockSize! * 43,
                                      height: ScreenSize.fSize_50(),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              ScreenSize.fSize_10()),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Details",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                                  color:
                                                      const Color(0xFF768AAB),
                                                  fontSize:
                                                      ScreenSize.fSize_17(),
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: ScreenSize.horizontalBlockSize! * 43,
                                      height: ScreenSize.fSize_50(),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF12356E),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(ScreenSize.fSize_10()),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Pie Chart",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                                  color: Colors.white,
                                                  fontSize: ScreenSize.fSize_17(),
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_15()),
                        Text(
                          "Total Payment ${arg[4]}",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenSize.fSize_15(),
                              color: const Color(0xFF12356E)),
                        ),
                        chart,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFF12356E),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    ScreenSize.fSize_15(),
                                  ),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      offset: Offset(0, 3))
                                ]),
                            child: Column(
                              children: [
                                SizedBox(height: ScreenSize.fSize_20()),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      textfunction("Loan Amount", "${arg[0]}"),
                                      rowdivider(),
                                      textfunction("Interest", "${arg[1]}"),
                                    ],
                                  ),
                                ),
                                SizedBox(height: ScreenSize.fSize_10()),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenSize.fSize_10(),
                                      right: ScreenSize.fSize_10()),
                                  child: const Divider(color: Color(0xFF768AAB)),
                                ),
                                SizedBox(height: ScreenSize.fSize_10()),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      textfunction("Period (Month)", "${TotalMonth}"),
                                      rowdivider(),
                                      textfunction("Monthly EMI", Result.value),
                                    ],
                                  ),
                                ),
                                SizedBox(height: ScreenSize.fSize_10()),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenSize.fSize_10(),
                                      right: ScreenSize.fSize_10()),
                                  child: const Divider(color: Color(0xFF768AAB)),
                                ),
                                SizedBox(height: ScreenSize.fSize_10()),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      textfunction(
                                          "Total Interest", Totalrate.value),
                                      rowdivider(),
                                      textfunction(
                                          "Total Payment", TotalPayment.value),
                                    ],
                                  ),
                                ),
                                SizedBox(height: ScreenSize.fSize_20()),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_70()),
                      ],
                    ),
                  )
                ],
              ),
            ),
            banner.getBN()
          ],
        ),
      ),
    );
  }

  emicalcualtion() {
    // ignore: non_constant_identifier_names
    int Principal = int.parse(arg[0]);
    // ignore: non_constant_identifier_names
    double Rate = double.parse(arg[1]);
    // ignore: non_constant_identifier_names
    int Year = int.parse(arg[3]);
    // ignore: non_constant_identifier_names
    // int Month = int.parse(arg[6]);

    double A = 0.0;
    int P = Principal;
    double r = Rate / 12 / 100;
    int n = Year * 12;
    // print("N valueee:  $n");

    A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

    // print("AAAA  $A");
    // print("PPPP  $P");
    // print("rrrr  $r");
    // print("nnnn  $n");

    Result.value = A.toStringAsFixed(0);
    // double FinalAmount = Principal + (Principal * Term * Rate) / 100;
    // double loanamount = FinalAmount / Term * 12;
    int totalrate = int.parse(Result.value) * n - Principal;
    // print("rateee:  $totalrate");

    int totalpayment = int.parse(Result.value) * n;
    // print("Result:  ${Result.value}");
    // print("payment:  $totalpayment");

    TotalMonth.value = n.toStringAsFixed(0);

    Totalrate.value = totalrate.toStringAsFixed(0);

    TotalPayment.value = totalpayment.toStringAsFixed(0);
    // print("TotalPayment.value:  ${TotalPayment.value}");
    // print("loanamount $Result\n\n");
    return Result;
  }
}
