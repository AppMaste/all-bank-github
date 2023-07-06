import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dbHelper/db Helper.dart';

class SMSBankingScreen extends StatefulWidget {
  const SMSBankingScreen({Key? key}) : super(key: key);

  @override
  State<SMSBankingScreen> createState() => _SMSBankingScreenState();
}

class _SMSBankingScreenState extends State<SMSBankingScreen> {
  final List<Map<String, dynamic>> _allUsers = [
    {"name": "Axis Bank"},
    {"name": "Andhra Bank"},
    {"name": "Allahabad Bank"},
    {"name": "Bank of Baroda (BOB)"},
    {"name": "Bhartiya Mahila Bank"},
    {"name": "Canara Bank"},
    {"name": "Central Bank Of India (CBI)"},
    {"name": "Dhanlaxmi Bank"},
    {"name": "HDFC Bank"},
    {"name": "ICICI Bank"},
    {"name": "IDBI Bank"},
    {"name": "Indian Bank"},
    {"name": "Karnataka Bank"},
    {"name": "Kotak Mahindra Bank"},
    {"name": "Punjab National Bank (PNB)"},
    {"name": "State Bank of India (SBI)"},
    {"name": "UCO Bank"},
    {"name": "Union Bank of India"},
    {"name": "Vijaya Bank"},
    {"name": "Yes Bank"},
    {"name": "Syndicate Bank"},
    {"name": "Bank of Maharashtra"},
    {"name": "Citi Bank"},
    {"name": "Corporation Bank"},
    {"name": "Cosmos Bank"},
    {"name": "Dena Bank"},
    {"name": "Federal Bank"},
    {"name": "Indian Overseas Bank (IOB)"},
    {"name": "IndusInd Bank"},
    {"name": "ING VYSYA Bank"},
    {"name": "Karur Vysya Bank"},
    {"name": "Saraswat Bank"},
    {"name": "Standard Chartered"},
    {"name": "State Bank of Hyderabad"},
    {"name": "IDFC Bank"},
    {"name": "Standard Chartered Bank"},
    {"name": "Bandhan Bank"},
    {"name": "South India Bank"},
    {"name": "HSBC Bank"},
    {"name": "Punjab & Sindh Bank"},
    {"name": "State Bank of Bikaner & Jaipur"},
    {"name": "Deutsche Bank"},
    {"name": "State Bank of Travancore "},
    {"name": "United Bank Of India"},
    {"name": "Tamilnad Mercantile"},
  ];
  Dbhelp dbhelp = Dbhelp();
  TextEditingController textEditingController = TextEditingController();

  @override
  initState() {
    super.initState();
    _foundUsers = _allUsers;
    loaddata();
  }

  loaddata() {
    setState(() {
      dbhelp.initdb();
    });
  }

  List<Map<String, dynamic>> _foundUsers = [];

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/SMSBankingScreen");
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
                        "SMS Banking",
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
                                      // onChanged: Search,
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
                        _foundUsers.isNotEmpty
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _foundUsers.length,
                                itemBuilder: (context, int index) =>
                                    GestureDetector(
                                  onTap: () async {
                                    tapButton.button(
                                      context,
                                      "/SMSBankDetailScreen",
                                      [
                                        data2[index]['message'],
                                        data2[index]['bankname'],
                                        data2[index]['id'],
                                        _foundUsers[index]["name"]
                                      ],
                                    );
                                    // Get.to(
                                    //   () => SMSBankDetailScreen(),
                                    //   arguments: [
                                    //     data2[index]['message'],
                                    //     data2[index]['bankname'],
                                    //     data2[index]['id'],
                                    //     allbankdata[index]['name']
                                    //   ],
                                    // );
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
                                                color: const Color(0xFFC7D8FF),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2.5),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Color(0xFFC7D8FF),
                                                      blurRadius: 5,
                                                      spreadRadius: 2)
                                                ]),
                                            child: Center(
                                              child: Text(
                                                "${_foundUsers[index]["name"][0]}",
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
                                              "${_foundUsers[index]['name']}",
                                              style: GoogleFonts
                                                  .ibmPlexSansThaiLooped(
                                                      fontSize:
                                                          ScreenSize.fSize_15(),
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
