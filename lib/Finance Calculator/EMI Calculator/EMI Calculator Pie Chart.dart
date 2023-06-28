import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Finance%20Calculator/EMI%20Calculator/EMI%20Calculator%20Bar%20Chart.dart';
import 'package:all_bank/Finance%20Calculator/EMI%20Calculator/EMI%20Calculator%20Detaila.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EMICalculatorPieChartScreen extends StatelessWidget {
  const EMICalculatorPieChartScreen({Key? key}) : super(key: key);

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
                                        "Pie Chart",
                                        style: GoogleFonts.ibmPlexSansThaiLooped(
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
                                  Get.to(() => const EMICalculatorBarChartScreen());
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
                      SizedBox(height: ScreenSize.fSize_30()),
                      Stack(
                        children: [
                          Container(
                            height: ScreenSize.horizontalBlockSize! * 65,
                            width: ScreenSize.horizontalBlockSize! * 65,
                            decoration: const BoxDecoration(
                              color: Color(0xFF5B83C5),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(ScreenSize.fSize_50()),
                              child: Container(
                                height: ScreenSize.fSize_50(),
                                width: ScreenSize.fSize_50(),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: const Color(0xFF8CB6FB), width: 10),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(height: ScreenSize.fSize_50()),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenSize.horizontalBlockSize! * 53),
                                child: Text(
                                  "4",
                                  style: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontSize: ScreenSize.fSize_24(),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                  height: ScreenSize.horizontalBlockSize! * 43),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenSize.horizontalBlockSize! * 8),
                                child: Text(
                                  "96",
                                  style: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontSize: ScreenSize.fSize_24(),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenSize.fSize_20()),
                      Row(
                        children: [
                          SizedBox(width: ScreenSize.fSize_70()),
                          Container(
                            height: ScreenSize.fSize_24(),
                            width: ScreenSize.fSize_24(),
                            decoration: BoxDecoration(
                                color: const Color(0xFF5B83C4),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(ScreenSize.fSize_6()))),
                          ),
                          SizedBox(width: ScreenSize.fSize_10()),
                          Text(
                            "INTEREST",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontSize: ScreenSize.fSize_15(),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: ScreenSize.fSize_20()),
                          Container(
                            height: ScreenSize.fSize_24(),
                            width: ScreenSize.fSize_24(),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDD8839),
                              borderRadius: BorderRadius.all(
                                Radius.circular(ScreenSize.fSize_6()),
                              ),
                            ),
                          ),
                          SizedBox(width: ScreenSize.fSize_10()),
                          Text(
                            "PRINCIPAL",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontSize: ScreenSize.fSize_15(),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenSize.fSize_20()),
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
                                      padding:  EdgeInsets.only(right: ScreenSize.fSize_18()),
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
                                      padding: EdgeInsets.only(left: ScreenSize.fSize_20(),top: ScreenSize.fSize_4()),
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
