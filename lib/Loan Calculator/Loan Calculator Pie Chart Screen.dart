import 'dart:math';

import 'package:all_bank/Loan%20Calculator/Loan%20Calculator%20Detail%20Screen.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Controller/ads.dart';
import 'dart:math' as math;
import '../ScreenSize.dart';

class LoanCalculatorPieChartScreen extends StatefulWidget {
  LoanCalculatorPieChartScreen({Key? key}) : super(key: key);

  @override
  State<LoanCalculatorPieChartScreen> createState() =>
      _LoanCalculatorPieChartScreenState();
}

class _LoanCalculatorPieChartScreenState
    extends State<LoanCalculatorPieChartScreen> {
  @override
  void initState() {
    super.initState();
    emicalcualtion();
  }

  var arg = Get.arguments;

  final colorList = <Color>[
    const Color(0xff12356e),
    const Color(0xff7ec1ff),
  ];

  textfunction(String title, String title2) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: ScreenSize.fSize_90(),
          color: Colors.transparent,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF768AAB)),
          ),
        ),
        SizedBox(height: ScreenSize.fSize_8()),
        Container(
          alignment: Alignment.center,
          width: ScreenSize.fSize_50(),
          color: Colors.transparent,
          child: Text(
            title2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  rowdivider() {
    return const VerticalDivider(
      color: Color(0xFF768AAB),
      thickness: 1,
    );
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
    print("LoanCalculatorPieChartScreenarg $arg");
    double aa = 100 - double.parse(arg[2]);
    double arggg = double.parse(arg[2]);
    final dataMap = <String, double>{
      "Loan (null)": aa,
      "Interest (null)": arggg,
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
    return Scaffold(
      appBar: appbarr,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                sameRow(context, "Loan Details"),
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
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => LoanCalculatorDetailScreen(),
                                    arguments: [
                                      arg[0],
                                      arg[1],
                                      arg[2],
                                      arg[3],
                                      arg[4],
                                      arg[5],
                                      arg[6],
                                    ],
                                  );
                                },
                                child: Stack(
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
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Get.to(() => const LoanCalculatorPieChartScreen());
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      width:
                                          ScreenSize.horizontalBlockSize! * 43,
                                      height: ScreenSize.fSize_50(),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF12356E),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              ScreenSize.fSize_10()),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Pie Chart",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                                  color: Colors.white,
                                                  fontSize:
                                                      ScreenSize.fSize_17(),
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_15()),
                      Text(
                        "Total Payment ${arg[3]}",
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
                              color: Color(0xFF12356E),
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
                                    textfunction("Interest", "${arg[2]}"),
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
                                    textfunction("Period (Month)", "${arg[4]}"),
                                    rowdivider(),
                                    textfunction(
                                        "Monthly EMI", "${Result.value}"),
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
                                        "Total Interest", "${Totalrate.value}"),
                                    rowdivider(),
                                    textfunction("Total Payment",
                                        "${TotalPayment.value}"),
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
    );
  }

  emicalcualtion() {
    int Principal = int.parse(arg[0]);
    double Rate = double.parse(arg[2]);
    int Year = int.parse(arg[5]);
    int Month = int.parse(arg[6]);

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

class ChartData {
  ChartData(this.x, this.y, [this.color]);

  String x;
  final num y;
  final Color? color;
}
