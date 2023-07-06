import 'dart:convert';

import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/Model/Bank%20Holiday%20Model.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/Button Controller.dart';

class BankHolidays extends StatelessWidget {
  const BankHolidays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, '/BankHolidays');
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
                  sameRow(context, "Bank Holidays"),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Container(
                    width: double.maxFinite,
                    decoration: decoration,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            "2022",
                                            style: GoogleFonts
                                                .ibmPlexSansThaiLooped(
                                                    color: Colors.white,
                                                    fontSize:
                                                        ScreenSize.fSize_15(),
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: FutureBuilder(
                              future: DefaultAssetBundle.of(context)
                                  .loadString("assets/bankholiday.json"),
                              builder: (context, snapshot) {
                                var jsondata =
                                    json.decode(snapshot.data.toString());
                                if (snapshot.hasData) {
                                  return bankholiday(jsondata);
                                } else {
                                  return const Text("No data");
                                }
                              },
                            ),
                          ),
                          // ListView.builder(
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   itemCount: holiday.length,
                          //   shrinkWrap: true,
                          //   itemBuilder: (context, index) {
                          //     return Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Container(
                          //         decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           borderRadius: BorderRadius.all(
                          //             Radius.circular(ScreenSize.fSize_15()),
                          //           ),
                          //           boxShadow: const [
                          //             BoxShadow(
                          //               color: Colors.grey,
                          //               blurRadius: 5,
                          //               offset: Offset(0, 4)
                          //             )
                          //           ]
                          //         ),
                          //         child: Padding(
                          //           padding: EdgeInsets.only(
                          //               top: ScreenSize.fSize_10(),
                          //               bottom: ScreenSize.fSize_10(),
                          //               left: ScreenSize.fSize_10()),
                          //           child: Column(
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: [
                          //               Text(
                          //                 holiday[index],
                          //                 style: GoogleFonts.ibmPlexSansThaiLooped(
                          //                   fontWeight: FontWeight.w600,
                          //                   fontSize: ScreenSize.fSize_15(),
                          //                   color: const Color(0xFF12356E),
                          //                 ),
                          //               ),
                          //               Text(
                          //                 holidaydate[index],
                          //                 style: GoogleFonts.ibmPlexSansThaiLooped(
                          //                   fontWeight: FontWeight.w600,
                          //                   color: const Color(0xFF768AAB),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),
                          SizedBox(height: ScreenSize.fSize_60()),
                        ],
                      ),
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

  Widget bankholiday(users) {
    BankHolidaylist user = BankHolidaylist.fromJson(users);
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: user.bankHoliDay!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(ScreenSize.fSize_15()),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(0, 4))
                ]),
            child: Padding(
              padding: EdgeInsets.only(
                  top: ScreenSize.fSize_10(),
                  bottom: ScreenSize.fSize_10(),
                  left: ScreenSize.fSize_10()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.bankHoliDay![index].holiDayName.toString(),
                    style: GoogleFonts.ibmPlexSansThaiLooped(
                      fontWeight: FontWeight.w600,
                      fontSize: ScreenSize.fSize_15(),
                      color: const Color(0xFF12356E),
                    ),
                  ),
                  Text(
                    user.bankHoliDay![index].fulltDate.toString(),
                    style: GoogleFonts.ibmPlexSansThaiLooped(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF768AAB),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
