import 'dart:developer';

import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Loan%20Calculator/Loan%20Calculator%20Detail%20Screen.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

var addData = [];

class LoanCalculatorHistoryScreen extends StatefulWidget {
  const LoanCalculatorHistoryScreen({Key? key}) : super(key: key);

  @override
  State<LoanCalculatorHistoryScreen> createState() =>
      _LoanCalculatorHistoryScreenState();
}

class _LoanCalculatorHistoryScreenState
    extends State<LoanCalculatorHistoryScreen> {
  var load = 100;
  var DATA;

  getvalue() async {
    var data = await SharedPreferences.getInstance();
    DATA = data.getString("key");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
  }

  @override
  Widget build(BuildContext context) {
    print('AAAAAA${DATA}');
    return Scaffold(
      appBar: appbarr,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  sameRow(context, "History"),
                  SizedBox(height: ScreenSize.fSize_20()),
                  addData.isNotEmpty
                      ? Container(
                          width: double.maxFinite,
                          decoration: decoration,
                          child: Column(
                            children: [
                              SizedBox(height: ScreenSize.fSize_30()),
                              ListView.builder(
                                  reverse: true,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: addData.length,
                                  itemBuilder: (_, index) {
                                    final getdata = addData[0];
                                    log(" addData[0] $getdata");
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      ScreenSize.fSize_15()),
                                                ),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 3),
                                                  )
                                                ]),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height: ScreenSize
                                                          .fSize_60()),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Interest",
                                                            style: GoogleFonts
                                                                .ibmPlexSansThaiLooped(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: const Color(
                                                                        0xFF768AAB)),
                                                          ),
                                                          Text(
                                                            "${addData[index][3]}",
                                                            style: GoogleFonts
                                                                .ibmPlexSansThaiLooped(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          width: ScreenSize
                                                              .fSize_20()),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Period (Months)",
                                                            style: GoogleFonts
                                                                .ibmPlexSansThaiLooped(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: const Color(
                                                                        0xFF768AAB)),
                                                          ),
                                                          Text(
                                                            "${addData[index][4]}",
                                                            style: GoogleFonts
                                                                .ibmPlexSansThaiLooped(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          width: ScreenSize
                                                                  .horizontalBlockSize! *
                                                              9.3),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: ScreenSize
                                                                    .fSize_6()),
                                                        child: Container(
                                                          width: ScreenSize.horizontalBlockSize! * 32,
                                                          color: Colors.transparent,
                                                          child: Text(
                                                            "${addData[index][2]} ${addData[index][1]}",
                                                            overflow: TextOverflow.ellipsis,
                                                            style: GoogleFonts
                                                                .ibmPlexSansThaiLooped(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: const Color(
                                                                        0xFF768AAB)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(
                                                        ScreenSize.fSize_4()),
                                                    child: const Divider(
                                                      color: Color(0xFF768AAB),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(() =>
                                                               LoanCalculatorDetailScreen());
                                                        },
                                                        child: Container(
                                                          width: ScreenSize
                                                                  .horizontalBlockSize! *
                                                              55,
                                                          height: ScreenSize
                                                              .fSize_38(),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xFF12356E),
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(
                                                                      ScreenSize
                                                                          .fSize_10()))),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "View more details",
                                                                style: GoogleFonts.ibmPlexSansThaiLooped(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              SizedBox(
                                                                  width: ScreenSize
                                                                      .fSize_4()),
                                                              const Image(
                                                                  image: AssetImage(
                                                                      "assets/icons/chevrons-right.png")),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          print("press");
                                                          _showAlertDialog(
                                                              context, index);
                                                        },
                                                        child: Image(
                                                            image: const AssetImage(
                                                                "assets/icons/Delete icon.png"),
                                                            height: ScreenSize
                                                                .fSize_30()),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: ScreenSize.fSize_50(),
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF12356E),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      ScreenSize.fSize_15()),
                                                  topRight: Radius.circular(
                                                      ScreenSize.fSize_15()),
                                                )),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Loan Calculator",
                                                    style: GoogleFonts
                                                        .ibmPlexSansThaiLooped(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.white),
                                                  ),
                                                  Text(
                                                    NumberFormat.simpleCurrency(
                                                            name: '')
                                                        .format(
                                                            addData[index][0]),
                                                    // "${addData[index][0]}",
                                                    style: GoogleFonts
                                                        .ibmPlexSansThaiLooped(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: ScreenSize
                                                                .fSize_20(),
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                              SizedBox(height: ScreenSize.fSize_60()),
                            ],
                          ),
                        )
                      : Center(
                          child: Text(
                            "Data Not Available",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontSize: ScreenSize.fSize_17(),
                                color: Colors.red,
                                fontWeight: FontWeight.w600),
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

  Future _showAlertDialog(BuildContext context, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Image(
              image: AssetImage("assets/icons/delete1 icon.png"), height: 50),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Want to Delete ?',
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: const Color(0xFF12356E),
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenSize.fSize_20()),
                    ),
                    Text(
                      'Are you sure you want to Delete this History ? you will not able to recover them.',
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: const Color(0xFF768AAB),
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenSize.fSize_12()),
                    ),
                    SizedBox(height: ScreenSize.fSize_10()),
                    const Divider(
                      color: Color(0xFF768AAB),
                    ),
                    SizedBox(height: ScreenSize.fSize_15()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        alertContainer(context, "Cancel", Colors.white,
                            const Color(0xFF12356E), () {
                          Navigator.of(context).pop();
                        }),
                        alertContainer(context, "Delete",
                            const Color(0xFF12356E), Colors.white, () {
                          setState(() {});
                          addData.remove(addData[index]);
                          Navigator.of(context).pop();
                        }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
