import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Finance%20Calculator/EMI%20Calculator/EMI%20Calculator%20Bar%20Chart.dart';
import 'package:all_bank/Finance%20Calculator/EMI%20Calculator/EMI%20Calculator%20Pie%20Chart.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class EMICalculatorDetailScreen extends StatelessWidget {
  EMICalculatorDetailScreen({Key? key}) : super(key: key);

  List demo = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100];
  List month = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  @override
  Widget build(BuildContext context) {
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
                                      const EMICalculatorPieChartScreen());
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
                              child: Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: demo.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_30()),
                                        Text(
                                          month[index].toString(),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              // child: Column(
                              //   children: [
                              //     SizedBox(height: ScreenSize.fSize_70()),
                              //     IntrinsicHeight(
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceEvenly,
                              //         children: [
                              //           Column(
                              //             children: [
                              //               emimonth(context, "1"),
                              //               emimonth(context, "2"),
                              //               emimonth(context, "3"),
                              //               emimonth(context, "4"),
                              //               emimonth(context, "5"),
                              //               emimonth(context, "6"),
                              //               emimonth(context, "7"),
                              //               emimonth(context, "8"),
                              //               emimonth(context, "9"),
                              //               emimonth(context, "10"),
                              //               emimonth(context, "11"),
                              //             ],
                              //           ),
                              //           emidetaildivider(),
                              //           Column(
                              //             children: [
                              //               emimonth(context, "142"),
                              //               emimonth(context, "142"),
                              //               emimonth(context, "142"),
                              //               emimonth(context, "142"),
                              //               emimonth(context, "143"),
                              //               emimonth(context, "143"),
                              //               emimonth(context, "143"),
                              //               emimonth(context, "144"),
                              //               emimonth(context, "144"),
                              //               emimonth(context, "144"),
                              //               emimonth(context, "145"),
                              //             ],
                              //           ),
                              //           emidetaildivider(),
                              //           Column(
                              //             children: [
                              //               emimonth(context, "10"),
                              //               emimonth(context, "10"),
                              //               emimonth(context, "9"),
                              //               emimonth(context, "9"),
                              //               emimonth(context, "9"),
                              //               emimonth(context, "8"),
                              //               emimonth(context, "8"),
                              //               emimonth(context, "8"),
                              //               emimonth(context, "8"),
                              //               emimonth(context, "7"),
                              //               emimonth(context, "7"),
                              //             ],
                              //           ),
                              //           emidetaildivider(),
                              //           Column(
                              //             children: [
                              //               emimonth(context, "4857"),
                              //               emimonth(context, "4715"),
                              //               emimonth(context, "4572"),
                              //               emimonth(context, "4429"),
                              //               emimonth(context, "4286"),
                              //               emimonth(context, "4143"),
                              //               emimonth(context, "3999"),
                              //               emimonth(context, "3855"),
                              //               emimonth(context, "3710"),
                              //               emimonth(context, "3565"),
                              //               emimonth(context, "3420"),
                              //             ],
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     SizedBox(height: ScreenSize.fSize_60()),
                              //   ],
                              // ),
                            ),
                            Container(
                              height: ScreenSize.fSize_55(),
                              decoration: BoxDecoration(
                                  color: const Color(0xFF12356E),
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(ScreenSize.fSize_15()),
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
                      SizedBox(height: ScreenSize.fSize_24()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          banner.getBN()
        ],
      ),
    );
  }
}
