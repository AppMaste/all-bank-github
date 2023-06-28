import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Finance%20Calculator/EMI%20Calculator/EMI%20Calculator%20Detaila.dart';
import 'package:all_bank/Finance%20Calculator/EMI%20Calculator/EMI%20Calculator%20Pie%20Chart.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EMICalculatorBarChartScreen extends StatelessWidget {
  const EMICalculatorBarChartScreen({Key? key}) : super(key: key);

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
                              GestureDetector(
                                onTap: () {
                                  Get.to(() =>  EMICalculatorDetailScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(9),
                                  child: Text(
                                    "Details",
                                    style: GoogleFonts.ibmPlexSansThaiLooped(
                                        color: const Color(0xFF768AAB),
                                        fontSize: ScreenSize.fSize_15(),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const EMICalculatorPieChartScreen());
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
                              Stack(
                                children: [
                                  Container(
                                    width: ScreenSize.fSize_120(),
                                    height: ScreenSize.fSize_50(),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF12356E),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                ScreenSize.fSize_10()))),
                                    child: Center(
                                      child: Text(
                                        "Bar Chart",
                                        style: GoogleFonts.ibmPlexSansThaiLooped(
                                            color: Colors.white,
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_40()),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: ScreenSize.horizontalBlockSize! * 75,
                            ),
                            child: Text(
                              "98",
                              style: GoogleFonts.ibmPlexSansThaiLooped(
                                  fontSize: ScreenSize.fSize_17(),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Stack(
                            children: [
                              Column(
                                children: [
                                  barchart(context, "100"),
                                  barchart2(context, "90"),
                                  barchart2(context, "80"),
                                  barchart2(context, "70"),
                                  barchart2(context, "60"),
                                  barchart2(context, "50"),
                                  barchart2(context, "40"),
                                  barchart2(context, "30"),
                                  barchart2(context, "20"),
                                  barchart2(context, "10"),
                                  Stack(
                                    children: [
                                      barchart2(context, "  0"),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: ScreenSize.fSize_80(),
                                            top: ScreenSize.fSize_3()),
                                        child: Container(
                                          width: ScreenSize.fSize_50(),
                                          height: ScreenSize.fSize_8(),
                                          color: Color(0xFFDD8839),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenSize.horizontalBlockSize! * 72,
                                    top: ScreenSize.horizontalBlockSize! * 7),
                                child: Container(
                                  width: ScreenSize.fSize_50(),
                                  height: ScreenSize.horizontalBlockSize! * 54.5,
                                  color: Color(0xFF5B83C4),
                                ),
                              ),
                              Positioned(
                                left: ScreenSize.horizontalBlockSize! * 26,
                                bottom: ScreenSize.fSize_15(),
                                child: Text(
                                  "2",
                                  style: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontSize: ScreenSize.fSize_17(),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenSize.fSize_6(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: ScreenSize.fSize_70()),
                          Container(
                            height: ScreenSize.fSize_15(),
                            width: ScreenSize.fSize_15(),
                            decoration: BoxDecoration(
                                color: const Color(0xFFDD8839),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(ScreenSize.fSize_2()))),
                          ),
                          SizedBox(width: ScreenSize.fSize_6()),
                          Container(
                            height: ScreenSize.fSize_15(),
                            width: ScreenSize.fSize_15(),
                            decoration: BoxDecoration(
                                color: const Color(0xFF5B83C4),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(ScreenSize.fSize_2()))),
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenSize.fSize_8()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "INTEREST",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "PRINCIPAL",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w600),
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
                                          "2000",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
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
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          "2.5",
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
                                        Text(
                                          "Period (Month)",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          "34",
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
                                          "60.99",
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
                                          "73.78",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
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
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          "2073.78",
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
