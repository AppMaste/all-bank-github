import 'dart:convert';

import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/Missed%20Call%20Bank%20List/Bank%20statement%20Detail%20Screen.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class MissedCallBankScreen extends StatefulWidget {
  const MissedCallBankScreen({Key? key}) : super(key: key);

  @override
  State<MissedCallBankScreen> createState() => _MissedCallBankScreenState();
}

class _MissedCallBankScreenState extends State<MissedCallBankScreen> {
  List fullData = [];
  List searchData = [];
  TextEditingController textEditingController = TextEditingController();

  @override
  initState() {
    super.initState();
    getLocalJsonData();
  }

  getLocalJson() {
    return rootBundle
        .loadString('assets/banklist.json'); // Read your local Data
  }

  Future getLocalJsonData() async {
    final response = json.decode(await getLocalJson());
    List tempList = [];
    for (var i in response['data']) {
      tempList.add(i); // Create a list and add data one by one
    }

    fullData = tempList;
    setState(() {});
  }

  onSearchTextChanged(String text) async {
    searchData.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    fullData.forEach((data) {
      if (data['bank_name']
          .toString()
          .toLowerCase()
          .contains(text.toLowerCase().toString())) {
        searchData.add(
            data); // If not empty then add search data into search data list
      }
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/MissedCallBankScreen");
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
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_6()),
                      Text(
                        "Bank List",
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
                                  padding: EdgeInsets.only(
                                      left: ScreenSize.fSize_10()),
                                  child: Container(
                                    width: ScreenSize.horizontalBlockSize! * 80,
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: textEditingController,
                                      onChanged: onSearchTextChanged,
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        hintText: "Search Bank Name",
                                        hintStyle:
                                            GoogleFonts.ibmPlexSansThaiLooped(
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
                        searchData
                                .isEmpty // Check SearchData list is empty or not if empty then show full data else show search data
                            ? fullData.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: fullData.length,
                                    itemBuilder: (context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          tapButton.button(
                                            context,
                                            "/BankStatementScreen",
                                            [
                                              fullData[index]['bank_name'],
                                              fullData[index]['balance_number'],
                                              fullData[index]['mini_number'],
                                              fullData[index]['care_number'],
                                            ],
                                          );
                                          /*  Get.to(
                                      () => BankStatementScreen(),
                                  arguments: [
                                    fullData[index]['bank_name'],
                                    fullData[index]['balance_number'],
                                    fullData[index]['mini_number'],
                                    fullData[index]['care_number'],
                                  ],
                                );*/
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    ScreenSize.fSize_10()),
                                              ),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 2))
                                              ]),
                                          margin: const EdgeInsets.all(10),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: ScreenSize.fSize_45(),
                                                  height: ScreenSize.fSize_45(),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFC7D8FF),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2.5),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color: Color(
                                                                0xFFC7D8FF),
                                                            blurRadius: 5,
                                                            spreadRadius: 2)
                                                      ]),
                                                  child: Center(
                                                    child: Text(
                                                      "${fullData[index]['bank_name'][0]}",
                                                      style: GoogleFonts
                                                          .ibmPlexSansThaiLooped(
                                                              fontSize: ScreenSize
                                                                  .fSize_17(),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        ScreenSize.fSize_10()),
                                                Container(
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      70,
                                                  color: Colors.transparent,
                                                  child: Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    "${fullData[index]['bank_name']}",
                                                    style: GoogleFonts
                                                        .ibmPlexSansThaiLooped(
                                                            fontSize: ScreenSize
                                                                .fSize_15(),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: searchData.length,
                                itemBuilder: (context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => BankStatementScreen(),
                                        arguments: [
                                          searchData[index]['bank_name'],
                                          searchData[index]['balance_number'],
                                          searchData[index]['mini_number'],
                                          searchData[index]['care_number'],
                                        ],
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                ScreenSize.fSize_10()),
                                          ),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5,
                                                offset: Offset(0, 2))
                                          ]),
                                      margin: const EdgeInsets.all(10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: ScreenSize.fSize_45(),
                                              height: ScreenSize.fSize_45(),
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
                                                  "${searchData[index]['bank_name'][0]}",
                                                  style: GoogleFonts
                                                      .ibmPlexSansThaiLooped(
                                                          fontSize: ScreenSize
                                                              .fSize_17(),
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                width: ScreenSize.fSize_10()),
                                            Container(
                                              width: ScreenSize
                                                      .horizontalBlockSize! *
                                                  70,
                                              color: Colors.transparent,
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                "${searchData[index]['bank_name']}",
                                                style: GoogleFonts
                                                    .ibmPlexSansThaiLooped(
                                                        fontSize: ScreenSize
                                                            .fSize_15(),
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                        SizedBox(height: ScreenSize.fSize_28()),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenSize.fSize_50()),
                ],
              ),
            ),
            banner.getBN()
          ],
        ),
      ),
    );
  }
}
