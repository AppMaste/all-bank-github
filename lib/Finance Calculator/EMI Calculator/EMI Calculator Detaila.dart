import 'dart:math';

import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'EMI Calculator Pie Chart.dart';

class EMICalculatorDetailScreen extends StatefulWidget {
  EMICalculatorDetailScreen({Key? key}) : super(key: key);

  @override
  State<EMICalculatorDetailScreen> createState() =>
      _EMICalculatorDetailScreenState();
}

class _EMICalculatorDetailScreenState extends State<EMICalculatorDetailScreen> {
  var arg = Get.arguments;

  @override
  void initState() {
    super.initState();
    handleclaculation();
  }

  var divider = const VerticalDivider(
    color: Color(0xFF768AAB),
    thickness: 1,
  );

  var rate;

  var textstyl1 = const TextStyle(color: Colors.white);

  var textstyle = const TextStyle(fontWeight: FontWeight.w500);

  List demo = [0, 0, 1, 1, 1, 2, 2, 2, 2, 3, 3];

  List month = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  List month2 = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

  var Result = "".obs;

  // ignore: non_constant_identifier_names
  var Totalrate = "".obs;

  // ignore: non_constant_identifier_names
  var TotalMonth = "".obs;

  // ignore: non_constant_identifier_names
  var TotalPayment = "".obs;

  @override
  Widget build(BuildContext context) {
    // print("savhjsgfasuvasnfasi $arg");
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/EMICalculatorDetailScreen");
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
                                Stack(
                                  children: [
                                    Container(
                                      width: ScreenSize.fSize_120(),
                                      height: ScreenSize.fSize_50(),
                                      decoration: BoxDecoration(
                                          color: Color(0xFF12356E),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  ScreenSize.fSize_10()))),
                                      child: Center(
                                        child: Text(
                                          "Details",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                                  color: Colors.white,
                                                  fontSize:
                                                      ScreenSize.fSize_15(),
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => EMICalculatorPieChartScreen(),
                                        arguments: [
                                          Result.value,
                                          arg[1],
                                          arg[0],
                                          arg[3],
                                          TotalMonth.value,
                                          TotalPayment.value,
                                          Totalrate.value,
                                          arg[6],
                                          arg[7]
                                        ]);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Pie Chart",
                                      style: GoogleFonts.ibmPlexSansThaiLooped(
                                          color: const Color(0xFF768AAB),
                                          fontSize: ScreenSize.fSize_15(),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    tapButton.button(context,
                                        "/EMICalculatorBarChartScreen", '');
                                    // Get.to(() =>
                                    //     const EMICalculatorBarChartScreen());
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
                                        rate = int.parse(arg[1]) - demo[index];
                                        var RR =
                                            rate / 100 / 1200 * month2[index];
                                        var cal = double.parse(arg[2]) * RR;
                                        var cal2 =
                                            double.parse(arg[2]) * cal / 100;
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              top: ScreenSize.fSize_10(),
                                              left: ScreenSize.fSize_17(),
                                              right: ScreenSize.fSize_12(),
                                              bottom: ScreenSize.fSize_12()),
                                          child: IntrinsicHeight(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                    "$rate",
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
                                                    cal2.toStringAsFixed(2),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: textstyle,
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
                        SizedBox(height: ScreenSize.fSize_60()),
                      ],
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

  handleclaculation() {
    int Principal = int.parse(arg[0]);
    double Rate = double.parse(arg[1]);
    int Year = int.parse(arg[6]);
    int Month = int.parse(arg[7]);

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
