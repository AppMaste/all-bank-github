import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Loan%20Period/Loan%20Period%20Pie%20Chart%20Screen.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanPeriodDetailScreen extends StatelessWidget {
  const LoanPeriodDetailScreen({Key? key}) : super(key: key);

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
                                  Get.to(() =>  LoanPeriodPieChartScreen());
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
                                            emimonth(context, "166"),
                                            emimonth(context, "170"),
                                            emimonth(context, "175"),
                                            emimonth(context, "180"),
                                            emimonth(context, "184"),
                                            emimonth(context, "189"),
                                            emimonth(context, "194"),
                                            emimonth(context, "199"),
                                            emimonth(context, "205"),
                                            emimonth(context, "210"),
                                          ],
                                        ),
                                        emidetaildivider(),
                                        Column(
                                          children: [
                                            emimonth(context, "1334"),
                                            emimonth(context, "1330"),
                                            emimonth(context, "1325"),
                                            emimonth(context, "1320"),
                                            emimonth(context, "1316"),
                                            emimonth(context, "1311"),
                                            emimonth(context, "1306"),
                                            emimonth(context, "1301"),
                                            emimonth(context, "1295"),
                                            emimonth(context, "1290"),
                                          ],
                                        ),
                                        emidetaildivider(),
                                        Column(
                                          children: [
                                            emimonth(context, "49834"),
                                            emimonth(context, "49664"),
                                            emimonth(context, "49489"),
                                            emimonth(context, "49309"),
                                            emimonth(context, "49125"),
                                            emimonth(context, "48936"),
                                            emimonth(context, "48742"),
                                            emimonth(context, "48543"),
                                            emimonth(context, "48338"),
                                            emimonth(context, "48128"),
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
