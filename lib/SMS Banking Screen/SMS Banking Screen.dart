import 'dart:convert';

import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/SMS%20Banking%20Screen/SMS%20bank%20Detail%20Screen.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dbHelper/db Helper.dart';

List Bankdata = [
  "Axis Bank",
  "Andhra Bank",
  "Allahabad Bank",
  "Bank of Baroda (BOB)",
  "Bhartiya Mahila Bank",
  "Canara Bank",
  "Central Bank Of India (CBI)",
  "Dhanlaxmi Bank",
  "HDFC Bank",
  "ICICI Bank",
  "IDBI Bank",
  "Indian Bank",
  "Karnataka Bank",
  "Kotak Mahindra Bank",
  "Punjab National Bank (PNB)",
  "State Bank of India (SBI)",
  "UCO Bank",
  "Union Bank of India",
  "Vijaya Bank",
  "Yes Bank",
  "Syndicate Bank",
  "Bank of Maharashtra",
  "Citi Bank",
  "Corporation Bank",
  "Cosmos Bank",
  "Dena Bank",
  "Federal Bank",
  "Indian Overseas Bank (IOB)",
  "IndusInd Bank",
  "ING VYSYA Bank",
  "Karur Vysya Bank",
  "Saraswat Bank",
  "Standard Chartered",
  "State Bank of Hyderabad",
  "IDFC Bank",
  "Standard Chartered Bank",
  "Bandhan Bank",
  "South India Bank",
  "HSBC Bank",
  "Punjab & Sindh Bank",
  "State Bank of Bikaner & Jaipur",
  "Deutsche Bank",
  "State Bank of Travancore ",
  "United Bank Of India",
  "Tamilnad Mercantile",
];

class SMSBankingScreen extends StatefulWidget {
  const SMSBankingScreen({Key? key}) : super(key: key);

  @override
  State<SMSBankingScreen> createState() => _SMSBankingScreenState();
}

class _SMSBankingScreenState extends State<SMSBankingScreen> {
  List fullData = [];
  List searchData = [];
  Dbhelp dbhelp = Dbhelp();
  TextEditingController textEditingController = TextEditingController();

  List banks = Bankdata;

  @override
  initState() {
    super.initState();
    // getLocalJsonData();
    loaddata();
  }

  loaddata() {
    setState(() {
      dbhelp.initdb();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                    onChanged: Search,
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
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: banks.length,
                        itemBuilder: (context, int index) {
                          return GestureDetector(
                            onTap: () async {
                              Get.to(
                                () => SMSBankDetailScreen(),
                                arguments: [
                                  data2[index]['message'],
                                  data2[index]['bankname'],
                                  data2[index]['id'],
                                  Bankdata[index]
                                ],
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(ScreenSize.fSize_10()),
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
                                              color: Colors.white, width: 2.5),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Color(0xFFC7D8FF),
                                                blurRadius: 5,
                                                spreadRadius: 2)
                                          ]),
                                      child: Center(
                                        child: Text(
                                          "${Bankdata[index][0]}",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                                  fontSize:
                                                      ScreenSize.fSize_17(),
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: ScreenSize.fSize_10()),
                                    Container(
                                      width:
                                          ScreenSize.horizontalBlockSize! * 70,
                                      color: Colors.transparent,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        "${Bankdata[index]}",
                                        style:
                                            GoogleFonts.ibmPlexSansThaiLooped(
                                                fontSize: ScreenSize.fSize_15(),
                                                fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
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

  Search(String query) {
    final suggestion = Bankdata.where((bank) {
      final title = bank.toLowerCase();
      final input = query.toLowerCase();

      return title.contains(input);
    }).toList();

    setState(() => banks = suggestion);
  }
}
