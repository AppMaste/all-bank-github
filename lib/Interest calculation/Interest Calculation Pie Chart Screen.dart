import 'dart:math';

import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math' as math;
// import 'package:syncfusion_flutter_charts/charts.dart';

import '../ScreenSize.dart';

class InterestCalculationPieChartScreen extends StatefulWidget {
  InterestCalculationPieChartScreen({Key? key}) : super(key: key);

  @override
  State<InterestCalculationPieChartScreen> createState() =>
      _InterestCalculationPieChartScreenState();
}

class _InterestCalculationPieChartScreenState
    extends State<InterestCalculationPieChartScreen> {
  var arg = Get.arguments;

  var interest = 0.0;
  var totalloan = 0.0.obs;
  var totalPayment;
  var totalinterest = 0.0;

  @override
  void initState() {
    super.initState();
    print("asfasfvgashcdfascdf $arg");
    interest = arg[4];
    calculation();
  }

  @override
  Widget build(BuildContext context) {
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
                                  // Get.to(() =>  LoanCalculatorDetailScreen());
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
                        "Total Payment ${NumberFormat.simpleCurrency(name: '').format(arg[3])}",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Text(
                                          "Loan Amount",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Container(
                                          width: ScreenSize.horizontalBlockSize! * 27,
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          child: Text(
                                            arg[1],
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                GoogleFonts.ibmPlexSansThaiLooped(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: ScreenSize.fSize_18()),
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
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Container(
                                          width: ScreenSize.horizontalBlockSize! * 20,
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          child: Text(
                                            interest.toStringAsFixed(0),
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                GoogleFonts.ibmPlexSansThaiLooped(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500),
                                          ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Text(
                                          "Period (Month)",
                                          style: GoogleFonts
                                              .ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Container(
                                          width: ScreenSize.horizontalBlockSize! * 25,
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          child: Text(
                                            arg[5].toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                GoogleFonts.ibmPlexSansThaiLooped(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500),
                                          ),
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
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Container(
                                          width: ScreenSize.horizontalBlockSize! * 25,
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          child: Text(
                                            totalloan.toStringAsFixed(0),
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                GoogleFonts.ibmPlexSansThaiLooped(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500),
                                          ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Text(
                                          "Total Interest",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Container(
                                          width: ScreenSize.horizontalBlockSize! * 25,
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          child: Text(
                                            totalinterest.toStringAsFixed(0),
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                GoogleFonts.ibmPlexSansThaiLooped(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: ScreenSize.fSize_20(),
                                          top: ScreenSize.fSize_4()),
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
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Container(
                                          width: ScreenSize.horizontalBlockSize! * 25,
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "$totalPayment",
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                GoogleFonts.ibmPlexSansThaiLooped(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500),
                                          ),
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

  calculation() {
    // ignore: non_constant_identifier_names
    int Emi = int.parse(arg[1]);
    // ignore: non_constant_identifier_names
    double Interest = double.parse(arg[4].toString()) / 1200;
    // ignore: non_constant_identifier_names
    int Year = int.parse(arg[6]) * 12;
    // ignore: non_constant_identifier_names
    int Month = int.parse(arg[7]);
    // ignore: non_constant_identifier_names
    int Period = Year + Month;
    // double P = double.parse(Period.toString()) / 12;
    totalloan.value =
        (Emi / Interest) * (1 - (1 / ((pow((1 + Interest), (Period))))));
    totalPayment = Emi * Period;
    totalinterest = totalPayment - totalloan.value;
  }
}
