import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/Button Controller.dart';
import '../ScreenSize.dart';
import '../dbHelper/db Helper.dart';

class NetBankingScreen extends StatefulWidget {
  const NetBankingScreen({Key? key}) : super(key: key);

  @override
  State<NetBankingScreen> createState() => _NetBankingScreenState();
}

class _NetBankingScreenState extends State<NetBankingScreen> {
  Dbhelp dbhelp = Dbhelp();

  TextEditingController textEditingController = TextEditingController();

  List findbank = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findbank = data.value;
    loaddat();
  }

  loaddat() {
    setState(() {
      dbhelp.initdb();
    });
  }

  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = data.value;
    } else {
      results = data.value
          .where((user) => user["vName"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      findbank = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/NetBankingScreen");
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
                                  padding: EdgeInsets.only(
                                      left: ScreenSize.fSize_10()),
                                  child: Container(
                                    width: ScreenSize.horizontalBlockSize! * 80,
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: textEditingController,
                                      onChanged: (value) => _runFilter(value),
                                      // onChanged: onSearchTextChanged,
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
                         findbank.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: findbank.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        tapButton.button(
                                          context,
                                          "/NetBankingDetailScreen",
                                          [
                                            findbank[index]['vName'],
                                            findbank[index]['NetBanking'],
                                          ],
                                        );
                                        // Get.to(() => NetBankingDetailScreen(),
                                        //     arguments: [
                                        //       data[index]['vName'],
                                        //       data[index]['NetBanking'],
                                        //     ]);
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
                                              Radius.circular(
                                                  ScreenSize.fSize_15()),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: ScreenSize
                                                            .fSize_45(),
                                                        width: ScreenSize
                                                            .fSize_45(),
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xFFC7D8FF),
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 2.5),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                  color: Color(
                                                                      0xFFC7D8FF),
                                                                  blurRadius: 5,
                                                                  spreadRadius:
                                                                      2)
                                                            ]),
                                                        child: Center(
                                                            child: Text(
                                                          "${findbank[index]['vName'][0]}",
                                                          style: GoogleFonts
                                                              .ibmPlexSansThaiLooped(
                                                                  fontSize:
                                                                      ScreenSize
                                                                          .fSize_17(),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        )),
                                                      ),
                                                      SizedBox(
                                                          width: ScreenSize
                                                              .fSize_15()),
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        height: ScreenSize
                                                            .fSize_20(),
                                                        width: ScreenSize
                                                                .horizontalBlockSize! *
                                                            70,
                                                        child: Text(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          "${findbank[index]['vName']}",
                                                          style: GoogleFonts
                                                              .ibmPlexSansThaiLooped(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      ScreenSize
                                                                          .fSize_15()),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
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
      ),
    );
  }
}
