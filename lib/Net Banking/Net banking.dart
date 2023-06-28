import 'dart:convert';

import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';
import '../dbHelper/db Helper.dart';
import 'Net Banking webview screen.dart';
import 'Net banking detail scren.dart';

class NetBankingScreen extends StatefulWidget {
  const NetBankingScreen({Key? key}) : super(key: key);

  @override
  State<NetBankingScreen> createState() => _NetBankingScreenState();
}

class _NetBankingScreenState extends State<NetBankingScreen> {
  Dbhelp dbhelp = Dbhelp();

  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddat();
  }

  loaddat() {
    setState(() {
      dbhelp.initdb();
    });
  }

  onSearchTextChanged(String text) async {}

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
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
                    Text(
                      "Net Banking",
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: const Color(0xFF12356E),
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenSize.fSize_20()),
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
                  child: Column(
                    children: [
                      SizedBox(height: ScreenSize.fSize_28()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: ScreenSize.fSize_50(),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
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
                                padding:
                                    EdgeInsets.only(left: ScreenSize.fSize_10()),
                                child: Container(
                                  width: ScreenSize.horizontalBlockSize! * 80,
                                  color: Colors.transparent,
                                  child: TextField(
                                    controller: textEditingController,
                                    onChanged: onSearchTextChanged,
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      hintText: "Search Bank Name",
                                      hintStyle: GoogleFonts.ibmPlexSansThaiLooped(
                                          color: const Color(0xFF768AAB),
                                          fontWeight: FontWeight.w500),
                                      border: InputBorder.none,
                                    ),
                                    textInputAction: TextInputAction.done,
                                  ),
                                ),
                              ),
                              SizedBox(width: ScreenSize.fSize_8()),
                              Image.asset(
                                "assets/icons/search icon.png",
                                scale: 2.3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_10()),
                      Obx(
                        () => data.value.isEmpty
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(() => NetBankingDetailScreen(),
                                          arguments: [
                                            data[index]['vName'],
                                            data[index]['NetBanking'],
                                          ]);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5,
                                                offset: Offset(0, 3))
                                          ],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(ScreenSize.fSize_15()),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: ScreenSize.fSize_45(),
                                                      width: ScreenSize.fSize_45(),
                                                      decoration: BoxDecoration(
                                                          color:
                                                          const Color(0xFFC7D8FF),
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                              color: Colors.white,
                                                              width: 2.5),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                                color:
                                                                Color(0xFFC7D8FF),
                                                                blurRadius: 5,
                                                                spreadRadius: 2)
                                                          ]),
                                                      child: Center(
                                                          child: Text(
                                                        "${data[index]['vName'][0]}",
                                                        style: GoogleFonts
                                                            .ibmPlexSansThaiLooped(
                                                                fontSize: ScreenSize
                                                                    .fSize_17(),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      )),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            ScreenSize.fSize_15()),
                                                    Container(
                                                      color: Colors.transparent,
                                                      height: ScreenSize.fSize_20(),
                                                      width: ScreenSize
                                                              .horizontalBlockSize! *
                                                          70,
                                                      child: Text(
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        "${data[index]['vName']}",
                                                        style: GoogleFonts
                                                            .ibmPlexSansThaiLooped(
                                                                fontWeight:
                                                                    FontWeight.w600,
                                                                fontSize: ScreenSize
                                                                    .fSize_15()),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              // Padding(
                                              //   padding: const EdgeInsets.all(8.0),
                                              //   child: Text(
                                              //       "Bank id: ${data[index]['iBankDetailsId']}"),
                                              // ),
                                              // Padding(
                                              //   padding: const EdgeInsets.all(8.0),
                                              //   child: Text(
                                              //       "Bank Name: ${data[index]['vName']}"),
                                              // ),
                                              // Padding(
                                              //   padding: const EdgeInsets.all(8.0),
                                              //   child: Text(
                                              //       "Bank Balance: ${data[index]['vBalance']}"),
                                              // ),
                                              // Padding(
                                              //   padding: const EdgeInsets.all(8.0),
                                              //   child: Text(
                                              //       "Bank Statement:  ${data[index]['vStatement']}"),
                                              // ),
                                              // TextButton(
                                              //   onPressed: () {
                                              //     Get.to(
                                              //       () => const NetBankingWebScreen(),
                                              //       arguments: data[index]
                                              //           ['NetBanking'],
                                              //     );
                                              //   },
                                              //   child: Text(
                                              //       "Bank Net-banking: ${data[index]['NetBanking']}"),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                      SizedBox(height: ScreenSize.fSize_60()),
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
