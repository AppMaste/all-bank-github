import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Loan Calculator Pie Chart Screen.dart';

class LoanCalculatorDetailScreen extends StatelessWidget {
  const LoanCalculatorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                        style: GoogleFonts.ibmPlexSansThaiLooped(
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
                                  Get.to(() =>  LoanCalculatorPieChartScreen());
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
                                          "Pie Chart",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                              color: const Color(0xFF768AAB),
                                              fontSize: ScreenSize.fSize_17(),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      offset: Offset(0, 3))
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenSize.fSize_15()),
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: ScreenSize.fSize_70()),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            emimonth(context, "1"),
                                            emimonth(context, "2"),
                                            emimonth(context, "3"),
                                            emimonth(context, "4"),
                                            emimonth(context, "5"),
                                            emimonth(context, "6"),
                                            emimonth(context, "7"),
                                            emimonth(context, "8"),
                                            emimonth(context, "9"),
                                            emimonth(context, "10"),
                                          ],
                                        ),
                                        emidetaildivider(),
                                        Column(
                                          children: [
                                            emimonth(context, "1875"),
                                            emimonth(context, "1878"),
                                            emimonth(context, "1881"),
                                            emimonth(context, "1884"),
                                            emimonth(context, "1887"),
                                            emimonth(context, "1890"),
                                            emimonth(context, "1894"),
                                            emimonth(context, "1897"),
                                            emimonth(context, "1900"),
                                            emimonth(context, "1903"),
                                          ],
                                        ),
                                        emidetaildivider(),
                                        Column(
                                          children: [
                                            emimonth(context, "125"),
                                            emimonth(context, "122"),
                                            emimonth(context, "119"),
                                            emimonth(context, "116"),
                                            emimonth(context, "113"),
                                            emimonth(context, "110"),
                                            emimonth(context, "106"),
                                            emimonth(context, "103"),
                                            emimonth(context, "100"),
                                            emimonth(context, "97"),
                                          ],
                                        ),
                                        emidetaildivider(),
                                        Column(
                                          children: [
                                            emimonth(context, "73583"),
                                            emimonth(context, "71705"),
                                            emimonth(context, "69824"),
                                            emimonth(context, "67940"),
                                            emimonth(context, "66053"),
                                            emimonth(context, "64163"),
                                            emimonth(context, "62269"),
                                            emimonth(context, "60372"),
                                            emimonth(context, "58472"),
                                            emimonth(context, "56569"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: ScreenSize.fSize_60()),
                                ],
                              ),
                            ),
                            Container(
                              height: ScreenSize.fSize_55(),
                              decoration: BoxDecoration(
                                  color: const Color(0xFF12356E),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(ScreenSize.fSize_15()),
                                    topRight:
                                        Radius.circular(ScreenSize.fSize_15()),
                                  )),
                              child: IntrinsicHeight(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      emidetailtext(context, "Month"),
                                      emidetaildivider(),
                                      emidetailtext(context, "Principle"),
                                      emidetaildivider(),
                                      emidetailtext(context, "Interest"),
                                      emidetaildivider(),
                                      emidetailtext(context, "Balance"),
                                    ],
                                  ),
                                ),
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
    );
  }
}
