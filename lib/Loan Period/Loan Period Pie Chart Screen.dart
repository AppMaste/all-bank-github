import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math' as math;
// import 'package:syncfusion_flutter_charts/charts.dart';


class LoanPeriodPieChartScreen extends StatelessWidget {
   LoanPeriodPieChartScreen({Key? key}) : super(key: key);


  var arg = Get.arguments;


  @override
  Widget build(BuildContext context) {
    print("================= $arg");
    final dataMap = <String, double>{
      "Loan (null)": 100,
      "Interest (null)": 30,
    };
    final colorList = <Color>[
      const Color(0xff12356e),
      const Color(0xff7ec1ff),
    ];
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
                                  // Get.to(() =>   LoanPeriodDetailScreen());
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      width: ScreenSize.horizontalBlockSize! * 43,
                                      height: ScreenSize.fSize_50(),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(ScreenSize.fSize_10()),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Details",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                              color: const Color(0xFF768AAB),
                                              fontSize: ScreenSize.fSize_17(),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                                        style: GoogleFonts.ibmPlexSansThaiLooped(
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
                          width: double.maxFinite,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(height: ScreenSize.fSize_15()),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Text(
                                          "Loan Amount",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          "100000.00",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(right: ScreenSize.fSize_18()),
                                      child: const VerticalDivider(
                                        thickness: 1,
                                        color: Color(0xFF768AAB),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Text(
                                          "Interest",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          "2.00",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: ScreenSize.fSize_10()),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenSize.fSize_15(),
                                    right: ScreenSize.fSize_15()),
                                child: const Divider(
                                  thickness: 1,
                                  color: Color(0xFF768AAB),
                                ),
                              ),
                              SizedBox(height: ScreenSize.fSize_10()),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Padding(
                                          padding:  EdgeInsets.only(left: ScreenSize.fSize_15()),
                                          child: Text(
                                            "Period (Month)",
                                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                              fontSize: ScreenSize.fSize_15(),
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF768AAB),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "42",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    VerticalDivider(
                                      thickness: 1,
                                      color: Color(0xFF768AAB),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Text(
                                          "Monthly EMI",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          "2500.00",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: ScreenSize.fSize_10()),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenSize.fSize_15(),
                                    right: ScreenSize.fSize_15()),
                                child: const Divider(
                                  thickness: 1,
                                  color: Color(0xFF768AAB),
                                ),
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Text(
                                          "Total Interest",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          "5000.00",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: ScreenSize.fSize_20(),top: ScreenSize.fSize_4()),
                                      child: const VerticalDivider(
                                        thickness: 1,
                                        color: Color(0xFF768AAB),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Text(
                                          "Total Payment",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          "105000.00",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
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
