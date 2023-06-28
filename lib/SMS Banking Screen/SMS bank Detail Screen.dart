import 'dart:developer';

import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/SMS%20Banking%20Screen/Bank%20Balance/Help%20on%20usage.dart';
import 'package:all_bank/SMS%20Banking%20Screen/Bank%20Balance/Help.dart';
import 'package:all_bank/SMS%20Banking%20Screen/Bank%20Balance/change%20pin.dart';
import 'package:all_bank/SMS%20Banking%20Screen/Bank%20Balance/default%20account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';
import '../dbHelper/db Helper.dart';
import 'Bank Balance/Bank Balance.dart';
import 'Bank Balance/Mini Statement.dart';

// ignore: must_be_immutable
class SMSBankDetailScreen extends StatelessWidget {
  SMSBankDetailScreen({Key? key}) : super(key: key);

  var arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarr,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: ScreenSize.fSize_6()),
                    Container(
                      width: ScreenSize.horizontalBlockSize! * 95,
                      color: Colors.transparent,
                      child: Text(
                        "${arg[3]}",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ibmPlexSansThaiLooped(
                            color: const Color(0xFF12356E),
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenSize.fSize_20()),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.fSize_20()),
                Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF1FE),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(ScreenSize.fSize_30()),
                          topLeft: Radius.circular(ScreenSize.fSize_30())),
                    ),
                    child: arg[3] == arg[3]
                        ? Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: data2.length,
                                itemBuilder: (context, index) {
                                  // print("objectobject ${data2[index]['bankname']}");
                                  if (arg[3] == arg[3]) {
                                    return data2[index]['bankname'] == arg[3]
                                        ? GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                () => SMSBankBalanceScreen(),
                                                arguments: [
                                                  data2[index]['title'],
                                                  data2[index]['message']
                                                ],
                                              );
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: ScreenSize.fSize_50(),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                        ScreenSize.fSize_10(),
                                                      ),
                                                    ),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 5,
                                                          offset: Offset(0, 4))
                                                    ]),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: ScreenSize
                                                              .fSize_10()),
                                                      child: Container(
                                                        width: ScreenSize
                                                                .horizontalBlockSize! *
                                                            80,
                                                        color:
                                                            Colors.transparent,
                                                        child: Text(
                                                          data2[index]['title'],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .ibmPlexSansThaiLooped(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      ScreenSize
                                                                          .fSize_15(),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: ScreenSize
                                                            .fSize_8()),
                                                    Image.asset(
                                                      color: Colors.black,
                                                      "assets/icons/arrowright.png",
                                                      scale: 2.3,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        : const SizedBox();
                                  }
                                },
                              ),
                              SizedBox(height: ScreenSize.fSize_60())
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )
                    // Column(
                    //   children: [
                    //     SizedBox(height: ScreenSize.fSize_30()),
                    //     SMSContainer(context, () {
                    //       Get.to(() => const SMSBankBalanceScreen());
                    //     }, "Bank Balance"),
                    //     SMSContainer(context, () {
                    //       Get.to(() => const SMSMiniStatementScreen());
                    //     }, "Mini Statement"),
                    //     SMSContainer(context, () {
                    //       Get.to(() => const SMSChangePin());
                    //     }, "Change Mobile Banking PIN"),
                    //     SMSContainer(context, () {
                    //       Get.to(() => const SMSChangeAccountScreen());
                    //     }, "Change Default Account"),
                    //     SMSContainer(context, () {
                    //       Get.to(() => const SMSHelpOnUsageScreen());
                    //     }, "Help on Usage"),
                    //     SMSContainer(context, () {
                    //       Get.to(() => const SMSHelpScreen());
                    //     }, "Help"),
                    //     SizedBox(height: ScreenSize.fSize_30()),
                    //     // GestureDetector(
                    //     //   onTap: ontap,
                    //     //   child: Padding(
                    //     //     padding: const EdgeInsets.all(8.0),
                    //     //     child: Container(
                    //     //       height: ScreenSize.fSize_50(),
                    //     //       decoration: BoxDecoration(
                    //     //           color: Colors.white,
                    //     //           borderRadius: BorderRadius.all(
                    //     //             Radius.circular(
                    //     //               ScreenSize.fSize_10(),
                    //     //             ),
                    //     //           ),
                    //     //           boxShadow: const [
                    //     //             BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 4))
                    //     //           ]),
                    //     //       child: Row(
                    //     //         children: [
                    //     //           Padding(
                    //     //             padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
                    //     //             child: Container(
                    //     //               width: ScreenSize.horizontalBlockSize! * 80,
                    //     //               color: Colors.transparent,
                    //     //               child: Text(
                    //     //                 name,
                    //     //                 style: GoogleFonts.ibmPlexSansThaiLooped(
                    //     //                     color: Colors.black,
                    //     //                     fontSize: ScreenSize.fSize_15(),
                    //     //                     fontWeight: FontWeight.w500),
                    //     //               ),
                    //     //             ),
                    //     //           ),
                    //     //           SizedBox(width: ScreenSize.fSize_8()),
                    //     //           Image.asset(
                    //     //             color: Colors.black,
                    //     //             "assets/icons/arrowright.png",
                    //     //             scale: 2.3,
                    //     //           ),
                    //     //         ],
                    //     //       ),
                    //     //     ),
                    //     //   ),
                    //     // )
                    //   ],
                    // ),
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
