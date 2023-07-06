import 'dart:convert';

import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';

class AllBankUSSDCodeScreen extends StatefulWidget {
  const AllBankUSSDCodeScreen({Key? key}) : super(key: key);

  @override
  State<AllBankUSSDCodeScreen> createState() => _AllBankUSSDCodeScreenState();
}

class _AllBankUSSDCodeScreenState extends State<AllBankUSSDCodeScreen> {
  List fullData = [];
  List searchData = [];

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/AllBankUSSDCodeScreen");
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
                        "USSD Banking",
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
                        SizedBox(height: ScreenSize.fSize_30()),
                        fullData.isEmpty
                            ? const Center(
                                child: CircularProgressIndicator(   ),
                              )
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: fullData.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height:
                                          ScreenSize.horizontalBlockSize! * 25,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  ScreenSize.fSize_15())),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5,
                                                offset: Offset(0, 4))
                                          ]),
                                      child: Row(
                                        children: [
                                          SizedBox(width: ScreenSize.fSize_10()),
                                          Container(
                                            height: ScreenSize.fSize_50(),
                                            width: ScreenSize.fSize_50(),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          const Color(0xFFCADDFF)
                                                              .withOpacity(0.6),
                                                      blurRadius: 5,
                                                      spreadRadius: 5)
                                                ],
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        "assets/icons/bank-icon.png"),
                                                    scale: 2.5),
                                                color: const Color(0xFFEBF1FE),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 4,
                                                    color: Colors.white)),
                                          ),
                                          SizedBox(width: ScreenSize.fSize_10()),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: ScreenSize.fSize_10()),
                                              Container(
                                                width: ScreenSize.fSize_170(),
                                                color: Colors.transparent,
                                                child: Text(
                                                  overflow: TextOverflow.ellipsis,
                                                  "${fullData[index]['bank_name']}",
                                                  style: GoogleFonts
                                                      .ibmPlexSansThaiLooped(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: ScreenSize
                                                              .fSize_15()),
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Short Name: ",
                                                      style: GoogleFonts
                                                          .ibmPlexSansThaiLooped(
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "${fullData[index]['bank_short_name']}",
                                                      style: GoogleFonts
                                                          .ibmPlexSansThaiLooped(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "4 letters IFSC: ",
                                                      style: GoogleFonts
                                                          .ibmPlexSansThaiLooped(
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    TextSpan(
                                                      text: "ABHY",
                                                      style: GoogleFonts
                                                          .ibmPlexSansThaiLooped(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: ScreenSize.fSize_20()),
                                          Container(
                                            color: Colors.transparent,
                                            width: ScreenSize.fSize_60(),
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "${fullData[index]['balance_number']}",
                                              style: GoogleFonts
                                                  .ibmPlexSansThaiLooped(
                                                      fontSize:
                                                          ScreenSize.fSize_15(),
                                                      fontWeight: FontWeight.w600,
                                                      color: const Color(
                                                          0xFF12356E)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                        SizedBox(height: ScreenSize.fSize_60())
                      ],
                    ),
                  )
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
