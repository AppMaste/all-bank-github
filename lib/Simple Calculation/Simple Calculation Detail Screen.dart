import 'dart:developer';

import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';
import 'Simple Calculation Pie Chart Screen.dart';

class SimpleCalculationDetailScreen extends StatelessWidget {
  SimpleCalculationDetailScreen({Key? key}) : super(key: key);

  var arg = Get.arguments;

  List rate =
      [2.04, 4.08, 6.12, 8.16, 10.20, 12.24, 14.28, 16.32, 18.36, 20.40].obs;
  List month = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].obs;

  @override
  Widget build(BuildContext context) {
    // print("SimpleCalculationDetailScreen $arg");
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/SimpleCalculationDetailScreen");
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
                                        color: const Color(0xFF12356E),
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
                                                  color: Colors.white,
                                                  fontSize:
                                                      ScreenSize.fSize_17(),
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        () => SimpleCalculationPieChartScreen(),
                                        arguments: [
                                          arg[0],
                                          arg[1],
                                          arg[2],
                                          arg[3],
                                          arg[4],
                                          arg[5],
                                        ]);
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: ScreenSize.horizontalBlockSize! *
                                            43,
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
                                            style: GoogleFonts
                                                .ibmPlexSansThaiLooped(
                                                    color:
                                                        const Color(0xFF768AAB),
                                                    fontSize:
                                                        ScreenSize.fSize_17(),
                                                    fontWeight:
                                                        FontWeight.w600),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(height: ScreenSize.fSize_20()),
                              Container(
                                height: ScreenSize.fSize_50(),
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 3),
                                          blurRadius: 5)
                                    ],
                                    color: const Color(0xFF12356E),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            ScreenSize.fSize_10()),
                                        topLeft: Radius.circular(
                                            ScreenSize.fSize_10()))),
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Month",
                                        style: style,
                                      ),
                                      Padding(
                                        padding: padding,
                                        child: dividerr,
                                      ),
                                      Text(
                                        "Principle",
                                        style: style,
                                      ),
                                      Padding(
                                        padding: padding,
                                        child: dividerr,
                                      ),
                                      Text(
                                        "Interest",
                                        style: style,
                                      ),
                                      Padding(
                                        padding: padding,
                                        child: dividerr,
                                      ),
                                      Text(
                                        "Balance",
                                        style: style,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: ScreenSize.horizontalBlockSize! * 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 3),
                                          blurRadius: 5),
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          ScreenSize.fSize_15()),
                                      bottomRight: Radius.circular(
                                          ScreenSize.fSize_15()),
                                    )),
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: month.length,
                                  itemBuilder: (context, index) {
                                    final aa = int.parse(arg[0]) *
                                        (int.parse(arg[1]) + rate[index]) /
                                        100;
                                    // final bb = ;
                                    final tt = int.parse(arg[0]) + aa;
                                    log("aaaaaaaaaaaa $aa");
                                    log("tttttttttttt $tt");

                                    // log("Principal $bb");
                                    // log("Balance $cc\n\n");
                                    return IntrinsicHeight(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: ScreenSize.fSize_20()),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: ScreenSize.fSize_30(),
                                              alignment: Alignment.center,
                                              color: Colors.transparent,
                                              child: Text(
                                                "${month[index]}",
                                                style: style1,
                                              ),
                                            ),
                                            dividerr2,
                                            Container(
                                              width: ScreenSize.fSize_45(),
                                              alignment: Alignment.center,
                                              color: Colors.transparent,
                                              child: Text(
                                                "${arg[0]}",
                                                style: style1,
                                              ),
                                            ),
                                            dividerr2,
                                            Container(
                                              width: ScreenSize.fSize_30(),
                                              alignment: Alignment.center,
                                              color: Colors.transparent,
                                              child: Text(
                                                aa.toStringAsFixed(0),
                                                overflow: TextOverflow.ellipsis,
                                                style: style1,
                                              ),
                                            ),
                                            dividerr2,
                                            Container(
                                              width: ScreenSize.fSize_45(),
                                              alignment: Alignment.center,
                                              color: Colors.transparent,
                                              child: Text(
                                                tt.toStringAsFixed(0),
                                                style: style1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
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
}
