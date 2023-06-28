import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Bank Holidays.dart';

class BankHolidayScreen extends StatelessWidget {
  BankHolidayScreen({Key? key}) : super(key: key);

  List icon = [
    "assets/icons/bank-icon.png",
    "assets/icons/Stock Exchange icon.png",
    "assets/icons/international holiday icon.png",
    "assets/icons/public holiday icon.png",
  ];
  List name = [
    "Bank Holiday",
    "Stock Exchange",
    "International Holiday",
    "Public Holiday",
  ];
  List title = [
    "Check Bank Holidays in India",
    "Stock Market Holiday Calendar",
    "Best deals on international holiday",
    "List of public and Government Holidays",
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
                sameRow(context, "Bank Holiday"),
                SizedBox(height: ScreenSize.fSize_20()),
                Container(
                  width: double.maxFinite,
                  decoration: decoration,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ScreenSize.fSize_20()),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: const Color(0xFF12356E),
                              borderRadius: BorderRadius.all(
                                Radius.circular(ScreenSize.fSize_15()),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(0, 3))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: ScreenSize.fSize_15()),
                                Row(
                                  children: [
                                    SizedBox(width: ScreenSize.fSize_15()),
                                    Text(
                                      "Today",
                                      style: GoogleFonts.ibmPlexSansThaiLooped(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF768AAB)),
                                    ),
                                    SizedBox(width: ScreenSize.fSize_20()),
                                    Text(
                                      "No Holiday Today",
                                      style: GoogleFonts.ibmPlexSansThaiLooped(
                                        fontSize: ScreenSize.fSize_15(),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenSize.fSize_10(),
                                      right: ScreenSize.fSize_10()),
                                  child: const Divider(
                                    color: Color(0xFF768AAB),
                                  ),
                                ),
                                SizedBox(height: ScreenSize.fSize_10()),
                                Row(
                                  children: [
                                    SizedBox(width: ScreenSize.fSize_15()),
                                    Text(
                                      "Tomorrow",
                                      style: GoogleFonts.ibmPlexSansThaiLooped(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF768AAB)),
                                    ),
                                    SizedBox(width: ScreenSize.fSize_20()),
                                    Text(
                                      "No Holiday Tomorrow",
                                      style: GoogleFonts.ibmPlexSansThaiLooped(
                                        fontSize: ScreenSize.fSize_15(),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: ScreenSize.fSize_10())
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        // native.getNT("listTileMedium"),
                        SizedBox(height: ScreenSize.fSize_20()),
                        GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: icon.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: ScreenSize.fSize_14(),
                            crossAxisSpacing: ScreenSize.fSize_14(),
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => const BankHolidays());
                              },
                              child: Container(
                                height: ScreenSize.horizontalBlockSize! * 45,
                                width: ScreenSize.horizontalBlockSize! * 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(ScreenSize.fSize_15()),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        offset: Offset(0, 3)),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: ScreenSize.fSize_8(),
                                          top: ScreenSize.fSize_10()),
                                      child: Container(
                                        height: ScreenSize.fSize_50(),
                                        width: ScreenSize.fSize_50(),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: const Color(0xFFCADDFF)
                                                      .withOpacity(0.6),
                                                  blurRadius: 5,
                                                  spreadRadius: 5)
                                            ],
                                            image: DecorationImage(
                                                image: AssetImage(icon[index]),
                                                scale: 2.3),
                                            color: const Color(0xFFEBF1FE),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 4, color: Colors.white)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: ScreenSize.fSize_8(),
                                          top: ScreenSize.fSize_12()),
                                      child: Text(
                                        name[index],
                                        style:
                                            GoogleFonts.ibmPlexSansThaiLooped(
                                                fontSize: ScreenSize.fSize_14(),
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xFF12356E)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: ScreenSize.fSize_8(),
                                          top: ScreenSize.fSize_6()),
                                      child: Container(
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                12,
                                        color: Colors.transparent,
                                        child: Text(
                                          title[index],
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontWeight: FontWeight.w600,
                                            fontSize: ScreenSize.fSize_12(),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: ScreenSize.fSize_50()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          banner.getBN(),
        ],
      ),
    );
  }
}
