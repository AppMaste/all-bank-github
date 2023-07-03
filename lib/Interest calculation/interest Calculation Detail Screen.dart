
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Interest%20calculation/Interest%20Calculation%20Pie%20Chart%20Screen.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';

class InterestCalculationDetailScreen extends StatefulWidget {
  InterestCalculationDetailScreen({Key? key}) : super(key: key);

  @override
  State<InterestCalculationDetailScreen> createState() =>
      _InterestCalculationDetailScreenState();
}

class _InterestCalculationDetailScreenState
    extends State<InterestCalculationDetailScreen> {
  var arg = Get.arguments;

  @override
  void initState() {
    super.initState();
    calculation();
  }

  var textstyl1 = const TextStyle(color: Colors.white);

  var textstyle =
      TextStyle(fontWeight: FontWeight.w500, fontSize: ScreenSize.fSize_12());

  var divider = const VerticalDivider(
    color: Color(0xFF768AAB),
    thickness: 1,
  );
  var rate = 0.0;
  var monthlyemi;
  var totalpayment;
  var totalinterest;
  var interest = 0.0;
  var Duration;

  List demo = [
    3.12,
    4.45,
    5.18,
    6.75,
    7.48,
    8.12,
    9.45,
    10.79,
    11.41,
    12.89,
    13.75
  ];

  List month = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  List month2 = [
    3.12,
    4.45,
    5.18,
    6.75,
    7.48,
    8.12,
    9.45,
    10.79,
    11.41,
    12.89,
    13.75
  ];

  @override
  Widget build(BuildContext context) {
    print("gyqwetrtwetwteytwue $arg");
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
                                        "Details",
                                        style:
                                            GoogleFonts.ibmPlexSansThaiLooped(
                                                color: Colors.white,
                                                fontSize: ScreenSize.fSize_17(),
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () =>
                                         InterestCalculationPieChartScreen(),
                                    arguments: [
                                      arg[0],
                                      arg[1],
                                      arg[4],
                                      arg[5],
                                      arg[6],
                                      arg[7],
                                      arg[2],
                                      arg[3]
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
                                          "Pie Chart",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                                  color:
                                                      const Color(0xFF768AAB),
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
                      SizedBox(height: ScreenSize.fSize_20()),
                      Column(
                        children: [
                          SizedBox(height: ScreenSize.fSize_20()),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenSize.fSize_6()),
                            child: Container(
                              height: ScreenSize.fSize_60(),
                              decoration: BoxDecoration(
                                color: Color(0xFF12356E),
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(ScreenSize.fSize_15()),
                                  topRight:
                                      Radius.circular(ScreenSize.fSize_15()),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Month",
                                        style: textstyl1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: divider,
                                      ),
                                      Text(
                                        "Principal",
                                        style: textstyl1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: divider,
                                      ),
                                      Text(
                                        "Interest",
                                        style: textstyl1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: divider,
                                      ),
                                      Text(
                                        "Balance",
                                        style: textstyl1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenSize.fSize_6()),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(
                                          ScreenSize.fSize_15()),
                                      bottomLeft: Radius.circular(
                                          ScreenSize.fSize_15())),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 3),
                                        blurRadius: 5)
                                  ]),
                              child: Stack(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: demo.length,
                                    itemBuilder: (context, index) {
                                      rate = double.parse(arg[1]) - demo[index];
                                      var RR =
                                          rate / 100 / 1200 * month2[index];
                                      var cal2 = double.parse(arg[0]) - rate;
                                      print("casdyasgd $RR");
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            top: ScreenSize.fSize_10(),
                                            left: ScreenSize.fSize_17(),
                                            right: ScreenSize.fSize_12(),
                                            bottom: ScreenSize.fSize_12()),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width: ScreenSize
                                                        .horizontalBlockSize! *
                                                    8,
                                                color: Colors.transparent,
                                                child: Text(
                                                  "${month[index]}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: textstyle,
                                                ),
                                              ),
                                              divider,
                                              Container(
                                                alignment: Alignment.center,
                                                width: ScreenSize
                                                        .horizontalBlockSize! *
                                                    12,
                                                color: Colors.transparent,
                                                child: Text(
                                                  "${arg[0]}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: textstyle,
                                                ),
                                              ),
                                              divider,
                                              Container(
                                                alignment: Alignment.center,
                                                width: ScreenSize
                                                        .horizontalBlockSize! *
                                                    12,
                                                color: Colors.transparent,
                                                child: Text(
                                                  rate.toStringAsFixed(0),
                                                  overflow: TextOverflow.fade,
                                                  style: textstyle,
                                                ),
                                              ),
                                              divider,
                                              Container(
                                                alignment: Alignment.center,
                                                width: ScreenSize
                                                        .horizontalBlockSize! *
                                                    13,
                                                color: Colors.transparent,
                                                child: Text(
                                                  cal2.toStringAsFixed(0),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize:
                                                          ScreenSize.fSize_11(),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
    int P = int.parse(arg[0]);
    int EMI = int.parse(arg[1]);
    int Y = int.parse(arg[2]);
    int M = int.parse(arg[3]);
    int Period = Y * 12 + M;
    double Year = Period / 12;

    monthlyemi = EMI;
    Duration = Period;
    totalpayment = EMI * Period;
    totalinterest = totalpayment - P;
    var Interest = (1 / Year) * ((totalpayment / P) - 1);
    interest = Interest * 100;
    // var Interest2 = interest / P * Year;
    // var Interest3 = Interest2 * 100 * 12;

    // log("interest Rate2222:--------------- $Interest2");
    // log("interest Rate3333:--------------- $Interest3");
  }
}
