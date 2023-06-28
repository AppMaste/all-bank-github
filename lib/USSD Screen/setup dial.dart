import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ScreenSize.dart';

class SetUpDialScreen extends StatelessWidget {
  SetUpDialScreen({Key? key}) : super(key: key);

  TextEditingController dialController = TextEditingController();

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
                    Text(
                      "Setup Dial *99#",
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
                      Text(
                        "Setup Language & Link Bank",
                        style: GoogleFonts.ibmPlexSansThaiLooped(
                            letterSpacing: 1,
                            fontSize: ScreenSize.fSize_20(),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF12356E)),
                      ),
                      SizedBox(height: ScreenSize.fSize_10()),
                      Container(
                        width: ScreenSize.horizontalBlockSize! * 70,
                        color: Colors.transparent,
                        child: Text(
                          textAlign: TextAlign.center,
                          "If using First time Dial *99# to Setup your Language and Bank Account",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontSize: ScreenSize.fSize_13(),
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_18()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
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
                              ]),
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: ScreenSize.fSize_8()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: ScreenSize.fSize_15()),
                                Text(
                                  "Welcome to *99#",
                                  style: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontSize: ScreenSize.fSize_17(),
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF12356E)),
                                ),
                                Text(
                                  "Enter your banks",
                                  style: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontSize: ScreenSize.fSize_17(),
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF12356E)),
                                ),
                                SizedBox(height: ScreenSize.fSize_8()),
                                Text(
                                  "A) Bank Name or",
                                  style: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  "B) First 4 letters of IFSC or",
                                  style: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  "C) 2 digit Numeric code",
                                  style: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                SizedBox(height: ScreenSize.fSize_15()),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: ScreenSize.fSize_6()),
                                  child: Container(
                                    width: double.maxFinite,
                                    height: ScreenSize.fSize_50(),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFEBF1FE),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 2,
                                              offset: const Offset(0, -2))
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                ScreenSize.fSize_10()))),
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(
                                        left: ScreenSize.fSize_10()),
                                    child: TextField(
                                      controller: dialController,
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        hintText: "ABHY",
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
                                SizedBox(height: ScreenSize.fSize_14()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Cancel",
                                      style: GoogleFonts.ibmPlexSansThaiLooped(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: ScreenSize.fSize_10()),
                                    Container(
                                      width: ScreenSize.fSize_80(),
                                      height: ScreenSize.fSize_40(),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF12356E),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              ScreenSize.fSize_10()),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Send",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                                  fontSize:
                                                      ScreenSize.fSize_14(),
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: ScreenSize.fSize_8()),
                                  ],
                                ),
                                SizedBox(height: ScreenSize.fSize_15()),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_15()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.maxFinite,
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
                              ]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: ScreenSize.fSize_55(),
                                  width: ScreenSize.fSize_55(),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFFCADDFF)
                                                .withOpacity(0.6),
                                            blurRadius: 5,
                                            spreadRadius: 5)
                                      ],
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/icons/Banklist-icon.png"),
                                          scale: 2.5),
                                      color: const Color(0xFFEBF1FE),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 4, color: Colors.white)),
                                ),
                              ),
                              SizedBox(width: ScreenSize.fSize_10()),
                              Text(
                                "Bank’s Short Name & Codes List",
                                style: GoogleFonts.ibmPlexSansThaiLooped(
                                    fontSize: ScreenSize.fSize_15(),
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF768AAB)),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_15()),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Note: ",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                color: const Color(0xFF12356E)),
                          ),
                          TextSpan(
                            text: "Your mobile no must be registered with bank",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                color: const Color(0xFF768AAB)),
                          ),
                        ]),
                      ),
                      SizedBox(height: ScreenSize.fSize_20()),
                      GestureDetector(
                        onTap: () {
                          openDialPad();
                        },
                        child: Container(
                          height: ScreenSize.fSize_50(),
                          width: ScreenSize.fSize_120(),
                          decoration: BoxDecoration(
                              color: const Color(0xFF12356E),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenSize.fSize_10()))),
                          child: Center(
                            child: Text(
                              "Dial *99#",
                              style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontSize: ScreenSize.fSize_14(),
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_80()),
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

  openDialPad() async {
    const url = "tel: *99#";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
/*openDialPad(String phoneNumber) async {
    Uri url = Uri(scheme: "tel", path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Can't open dial pad.");
    }
  }*/
}
