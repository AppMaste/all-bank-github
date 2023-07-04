import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Finance%20Calculator/EMI%20Calculator/EMI%20Calculator%20Bar%20Chart.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

// ignore: must_be_immutable
class EMICalculatorPieChartScreen extends StatelessWidget {
  EMICalculatorPieChartScreen({Key? key}) : super(key: key);

  final colorList = <Color>[
    const Color(0xff5b83c5),
    const Color(0xffdd8839),
  ];

  var arg = Get.arguments;

  textfunction(String title, String title2) {
    print("ttttttttttttttttt $arg");
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

  @override
  Widget build(BuildContext context) {
    print("afvjavsfhgascfhas $arg");
    double aa = 100 - double.parse(arg[1]);
    double arggg = double.parse(arg[1]);
    final dataMap = <String, double>{
      "INTEREST": aa,
      "PRINCIPAL": arggg,
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
                sameRow(context, "EMI Details"),
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
                                  // Get.to(() => EMICalculatorDetailScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(9),
                                  child: Text(
                                    "Details",
                                    style: GoogleFonts.ibmPlexSansThaiLooped(
                                        color: const Color(0xFF768AAB),
                                        fontSize: ScreenSize.fSize_15(),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: ScreenSize.fSize_120(),
                                    height: ScreenSize.fSize_50(),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF12356E),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                ScreenSize.fSize_10()))),
                                    child: Center(
                                      child: Text(
                                        "Pie Chart",
                                        style:
                                            GoogleFonts.ibmPlexSansThaiLooped(
                                                color: Colors.white,
                                                fontSize: ScreenSize.fSize_15(),
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() =>
                                      const EMICalculatorBarChartScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Bar Chart",
                                    style: GoogleFonts.ibmPlexSansThaiLooped(
                                        color: const Color(0xFF768AAB),
                                        fontSize: ScreenSize.fSize_15(),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_30()),
                      chart,
                      SizedBox(height: ScreenSize.fSize_20()),
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
                                    textfunction("Loan Amount", "${arg[2]}"),
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
                                    textfunction("Period (Month)", "${arg[3]}"),
                                    rowdivider(),
                                    textfunction("Monthly EMI", "${arg[0]}"),
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
                                        "Total Interest", "${arg[6]}"),
                                    rowdivider(),
                                    textfunction(
                                        "Total Payment", "${arg[5]}"),
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
}
