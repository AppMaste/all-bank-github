import 'package:all_bank/Loan%20Calculator/Loan%20Calculator%20Detail%20Screen.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/ads.dart';
import '../ScreenSize.dart';

class LoanCalculatorPieChartScreen extends StatelessWidget {
  LoanCalculatorPieChartScreen({Key? key}) : super(key: key);

  List<ChartData> chartData = [
    ChartData('David', 95, const Color(0xFF12356E)),
    ChartData('Steve', 5, const Color(0xFF7EC1FF)),
  ];

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
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => const LoanCalculatorDetailScreen());
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
                              GestureDetector(
                                onTap: () {
                                  // Get.to(() => const LoanCalculatorPieChartScreen());
                                },
                                child: Stack(
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
                                          "Pie Chart",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                                  color: Colors.white,
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
                      SizedBox(height: ScreenSize.fSize_15()),
                      Text(
                        "Total Payment 78000.00",
                        style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenSize.fSize_15(),
                            color: const Color(0xFF12356E)),
                      ),
                      // SfCircularChart(
                      //   series: [
                      //     // Render pie chart
                      //     PieSeries<ChartData, String>(
                      //         animationDuration: 1000,
                      //         dataLabelSettings: DataLabelSettings(
                      //           isVisible: true,
                      //           textStyle: GoogleFonts.ibmPlexSansThaiLooped(
                      //             fontWeight: FontWeight.w600,
                      //             color: Colors.black,
                      //             fontSize: 20,
                      //           ),
                      //         ),
                      //         dataSource: chartData,
                      //         pointColorMapper: (ChartData data, _) =>
                      //             data.color,
                      //         xValueMapper: (ChartData data, _) => data.x,
                      //         yValueMapper: (ChartData data, _) => data.y)
                      //   ],
                      // ),
                      Row(
                        children: [
                          SizedBox(width: ScreenSize.fSize_80()),
                          Container(
                            height: ScreenSize.fSize_20(),
                            width: ScreenSize.fSize_20(),
                            decoration: BoxDecoration(
                              color: Color(0xFF12356E),
                              borderRadius: BorderRadius.all(
                                Radius.circular(ScreenSize.fSize_6()),
                              ),
                            ),
                          ),
                          SizedBox(width: ScreenSize.fSize_8()),
                          Text(
                            "Loan (null)",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w600,
                                fontSize: ScreenSize.fSize_15()),
                          ),
                          SizedBox(width: ScreenSize.fSize_17()),
                          Container(
                            height: ScreenSize.fSize_20(),
                            width: ScreenSize.fSize_20(),
                            decoration: BoxDecoration(
                              color: const Color(0xFF7EC1FF),
                              borderRadius: BorderRadius.all(
                                Radius.circular(ScreenSize.fSize_6()),
                              ),
                            ),
                          ),
                          SizedBox(width: ScreenSize.fSize_8()),
                          Text(
                            "Interest (null)",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w600,
                                fontSize: ScreenSize.fSize_15()),
                          ),
                        ],
                      ),
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
                                        Text(
                                          "2000",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
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
                                        Text(
                                          "2.5",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ScreenSize.fSize_15()),
                                          child: Text(
                                            "Period (Month)",
                                            style: GoogleFonts
                                                .ibmPlexSansThaiLooped(
                                              fontSize: ScreenSize.fSize_15(),
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF768AAB),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "34",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
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
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          "60.99",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
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
                                        Text(
                                          "73.78",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
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
                                        Text(
                                          "2073.78",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
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

class ChartData {
  ChartData(this.x, this.y, [this.color]);

   String x;
  final num y;
  final Color? color;
}
