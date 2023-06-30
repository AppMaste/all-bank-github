import 'package:all_bank/Loan%20Calculator/Loan%20Calculator%20History.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'Finance Calculator/EMI Calculator/EMI Calculator Screen.dart';

fluttertost() {
  return Fluttertoast.showToast(
      msg: "Please fill the blank",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xFF12356E),
      textColor: Colors.white,
      fontSize: 16.0);
}

List bankname = [
  "Abhyudaya Co-op Bank",
  "Abu Dhabi Commercial Bank",
  "Akola District Central Co-op Bank",
  "Akola Janata Commercial Co-op Bank",
  "Allahabad Bank",
  "Almora Urban Co-op Bank",
];

List SMS = [
  "A. P. Mahesh Co-op. Bank",
  "ADC Bank",
  "Akhand Anand Co-op. Bank",
  "Allahabad  Bank",
  "Andhra Bank",
  "Axis Bank",
  "Bandhan Bank",
  "Bank of Baroda ",
];

List selectbank = [
  "A P MAHESH COOPERATIVE URBAN BANK",
  "ABHYUDAYA COOPERATIVE BANK",
  "AHMEDABAD MERCANTILE COOPRATIVE..",
  "AHMEDNAGAR DISTRICT CENTRAL CO O..",
  "AHMEDNAGAR MERCHANTS COOP BANK",
  "AIRTEL PAYMENTS BANK",
  "AJARA URBAN CO OP BANK",
  "AKOLA DISTRICT CENTRAL COOPERATIV..",
];

List bankbalance = [
  "Bank Balance",
  "Mini Statement",
  "Customer Care Number",
];
List banknumber = [
  "18004195511",
  "18003135235",
  "1800223131",
];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
homescrencontainer(
    BuildContext context, String icon, String name, String detail) {
  return Column(
    children: [
      SizedBox(height: ScreenSize.fSize_24()),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 8),
                    )
                  ],
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(ScreenSize.fSize_15()))),
              height: ScreenSize.horizontalBlockSize! * 67,
              width: ScreenSize.horizontalBlockSize! * 45,
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_15()),
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_15()),
                      Container(
                        height: ScreenSize.fSize_50(),
                        width: ScreenSize.fSize_50(),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xFFCADDFF).withOpacity(0.6),
                                  blurRadius: 5,
                                  spreadRadius: 5)
                            ],
                            image: DecorationImage(
                                image: AssetImage(icon), scale: 2.5),
                            color: const Color(0xFFEBF1FE),
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_10()),
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_15()),
                      Container(
                        color: Colors.transparent,
                        height: ScreenSize.fSize_60(),
                        width: ScreenSize.fSize_120(),
                        child: Text(
                          name,
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontSize: ScreenSize.fSize_20(),
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF12356E)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: ScreenSize.fSize_15(),
                        top: ScreenSize.fSize_13()),
                    child: Text(
                      detail,
                      style: GoogleFonts.ibmPlexSansThaiLooped(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

rightarrowcontroller(BuildContext context, var ontap, double size) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding:
          EdgeInsets.only(top: ScreenSize.horizontalBlockSize! * 67, left: size
              // left: ScreenSize.horizontalBlockSize! * 17,
              ),
      child: Container(
        height: ScreenSize.fSize_50(),
        width: ScreenSize.fSize_50(),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/icons/Arrow - Right.png"),
                scale: 2.0),
            color: const Color(0xFF12356E),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 6))
            ]),
      ),
    ),
  );
}

smscontrolller(BuildContext context, String icon, String name, var ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 8),
            )
          ],
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenSize.fSize_24()))),
      height: ScreenSize.horizontalBlockSize! * 40,
      width: ScreenSize.horizontalBlockSize! * 30,
      child: Column(
        children: [
          SizedBox(height: ScreenSize.fSize_15()),
          Row(
            children: [
              SizedBox(width: ScreenSize.fSize_15()),
              Container(
                height: ScreenSize.fSize_50(),
                width: ScreenSize.fSize_50(),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFFCADDFF).withOpacity(0.6),
                          blurRadius: 5,
                          spreadRadius: 5)
                    ],
                    image: DecorationImage(image: AssetImage(icon), scale: 2.5),
                    color: const Color(0xFFEBF1FE),
                    shape: BoxShape.circle,
                    border: Border.all(width: 4, color: Colors.white)),
              ),
            ],
          ),
          SizedBox(height: ScreenSize.fSize_10()),
          Row(
            children: [
              SizedBox(width: ScreenSize.fSize_15()),
              Container(
                color: Colors.transparent,
                height: ScreenSize.fSize_60(),
                width: ScreenSize.fSize_90(),
                child: Text(
                  name,
                  style: GoogleFonts.ibmPlexSansThaiLooped(
                      fontSize: ScreenSize.fSize_18(),
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF12356E)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

financeController(var ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 4)),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              ScreenSize.fSize_20(),
            ),
          ),
        ),
        height: ScreenSize.horizontalBlockSize! * 39,
        child: Row(
          children: [
            SizedBox(width: ScreenSize.fSize_10()),
            Image.asset("assets/logo/finance calculator illustrator.png",
                scale: 1.1),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.fSize_17()),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_15()),
                  Text(
                    "Finance Calculator",
                    style: GoogleFonts.ibmPlexSansThaiLooped(
                        color: const Color(0xFF12356E),
                        fontSize: ScreenSize.fSize_18(),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: ScreenSize.fSize_6()),
                  Container(
                    height: ScreenSize.horizontalBlockSize! * 20,
                    width: ScreenSize.horizontalBlockSize! * 45,
                    color: Colors.transparent,
                    child: Text(
                      "Loan Calculator, FD Calculator, GST Calculator, EMI Calculator Etc..",
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

statementController(
    BuildContext context, String name, String number, double size, var ontap) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: ScreenSize.fSize_80(),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenSize.fSize_15())),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 4))
          ]),
      child: Row(
        children: [
          SizedBox(width: ScreenSize.fSize_10()),
          Container(
            height: ScreenSize.fSize_50(),
            width: ScreenSize.fSize_50(),
            decoration: BoxDecoration(
                color: const Color(0xFFCADDFF),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xFFCADDFF).withOpacity(0.6),
                      blurRadius: 5,
                      spreadRadius: 5)
                ],
                image: const DecorationImage(
                    image: AssetImage("assets/icons/call-icon.png"),
                    scale: 2.1)),
          ),
          SizedBox(width: ScreenSize.fSize_24()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenSize.fSize_8()),
              Text(
                name,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenSize.fSize_16(),
                    color: const Color(0xFF12356E)),
              ),
              Text(
                number,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                    fontWeight: FontWeight.w600, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(width: size),
          GestureDetector(
            onTap: ontap,
            child: Image(
                image: const AssetImage("assets/icons/share-icon.png"),
                height: ScreenSize.horizontalBlockSize! * 6.9),
          )
        ],
      ),
    ),
  );
}

ifsc2Controller(BuildContext context, String name, var ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: ScreenSize.fSize_70(),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenSize.fSize_15())),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
            ]),
        child: Row(
          children: [
            SizedBox(width: ScreenSize.fSize_10()),
            Container(
              height: ScreenSize.fSize_45(),
              width: ScreenSize.fSize_45(),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/icons/locate-icon.png"),
                      scale: 2.8),
                  color: Color(0xFFEBF1FE),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFEBF1FE),
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: Offset(0, 3))
                  ]),
            ),
            SizedBox(width: ScreenSize.fSize_10()),
            Flexible(
              child: Text(
                overflow: TextOverflow.ellipsis,
                name,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                    fontSize: ScreenSize.fSize_15(),
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

form3(BuildContext context, String name) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text(
          name,
          style: GoogleFonts.ibmPlexSansThaiLooped(
              color: const Color(0xFF12356E),
              fontWeight: FontWeight.bold,
              fontSize: ScreenSize.fSize_17()),
        ),
      ],
    ),
  );
}

form2Container(BuildContext context, var ontap, String name) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
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
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 4))
            ]),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
              child: Container(
                width: ScreenSize.horizontalBlockSize! * 80,
                color: Colors.transparent,
                child: Text(
                  name,
                  style: GoogleFonts.ibmPlexSansThaiLooped(
                      color: Colors.grey,
                      fontSize: ScreenSize.fSize_15(),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(width: ScreenSize.fSize_8()),
            Image.asset(
              "assets/icons/arrowright.png",
              scale: 2.3,
            ),
          ],
        ),
      ),
    ),
  );
}

SMSContainer(BuildContext context, var ontap, String name) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
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
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 4))
            ]),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
              child: Container(
                width: ScreenSize.horizontalBlockSize! * 80,
                color: Colors.transparent,
                child: Text(
                  name,
                  style: GoogleFonts.ibmPlexSansThaiLooped(
                      color: Colors.black,
                      fontSize: ScreenSize.fSize_15(),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(width: ScreenSize.fSize_8()),
            Image.asset(
              color: Colors.black,
              "assets/icons/arrowright.png",
              scale: 2.3,
            ),
          ],
        ),
      ),
    ),
  );
}

SMSContainer2(BuildContext context, var ontap, String name1, String name2) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
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
                      color: Colors.grey, blurRadius: 5, offset: Offset(0, 4))
                ]),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
                  child: Container(
                    width: ScreenSize.horizontalBlockSize! * 80,
                    color: Colors.transparent,
                    child: Text(
                      name1,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: Colors.black,
                          fontSize: ScreenSize.fSize_15(),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(width: ScreenSize.fSize_8()),
                Image.asset(
                  color: Colors.black,
                  "assets/icons/arrowright.png",
                  scale: 2.3,
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenSize.fSize_20()),
          Container(
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
                      color: Colors.grey, blurRadius: 5, offset: Offset(0, 4))
                ]),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
                  child: Container(
                    width: ScreenSize.horizontalBlockSize! * 80,
                    color: Colors.transparent,
                    child: Text(
                      name2,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: Colors.black,
                          fontSize: ScreenSize.fSize_15(),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(width: ScreenSize.fSize_8()),
                Image.asset(
                  color: Colors.black,
                  "assets/icons/arrowright.png",
                  scale: 2.3,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

searchController(BuildContext context, String name, var ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: ScreenSize.fSize_50(),
      width: ScreenSize.horizontalBlockSize! * 40,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenSize.fSize_15())),
          color: const Color(0xFF12356E)),
      child: Center(
        child: Text(
          name,
          style: GoogleFonts.ibmPlexSansThaiLooped(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: ScreenSize.fSize_15()),
        ),
      ),
    ),
  );
}

shareController(BuildContext context, String name, String name2, double size) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.maxFinite,
      height: size,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenSize.fSize_15())),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenSize.fSize_10()),
          Padding(
            padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
            child: Text(
              name,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontSize: ScreenSize.fSize_18(),
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF12356E)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
            child: Text(
              name2,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w700, color: const Color(0xFF768AAB)),
            ),
          ),
        ],
      ),
    ),
  );
}

share2Controller(BuildContext context, String name, String name2) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: ScreenSize.horizontalBlockSize! * 45,
      height: ScreenSize.fSize_80(),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenSize.fSize_15())),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenSize.fSize_10()),
          Padding(
            padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
            child: Text(
              name,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontSize: ScreenSize.fSize_18(),
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF12356E)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
            child: Text(
              name2,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w700, color: const Color(0xFF768AAB)),
            ),
          ),
        ],
      ),
    ),
  );
}

settingContoller(
    BuildContext context, String name, String detail, String icon, var ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: ScreenSize.fSize_100(),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
            ],
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenSize.fSize_15()))),
        child: Row(
          children: [
            SizedBox(width: ScreenSize.fSize_12()),
            Container(
              height: ScreenSize.fSize_60(),
              width: ScreenSize.fSize_60(),
              decoration: BoxDecoration(
                  color: const Color(0xFFCADDFF),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFFCADDFF).withOpacity(0.6),
                        blurRadius: 5,
                        spreadRadius: 5)
                  ],
                  image: DecorationImage(image: AssetImage(icon), scale: 2.1)),
            ),
            SizedBox(width: ScreenSize.fSize_20()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenSize.fSize_24()),
                Text(
                  name,
                  style: GoogleFonts.ibmPlexSansThaiLooped(
                      fontWeight: FontWeight.w600,
                      fontSize: ScreenSize.fSize_18(),
                      color: const Color(0xFF12356E)),
                ),
                Container(
                  color: Colors.transparent,
                  width: ScreenSize.horizontalBlockSize! * 65,
                  child: Text(
                    detail,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.ibmPlexSansThaiLooped(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

SMSBankbalance(BuildContext context, String name) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: ScreenSize.fSize_50(),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(ScreenSize.fSize_10()),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
          ]),
      child: Center(
        child: Text(
          name,
          style: GoogleFonts.ibmPlexSansThaiLooped(
              fontWeight: FontWeight.w600,
              fontSize: ScreenSize.fSize_17(),
              color: const Color(0xFF12356E)),
        ),
      ),
    ),
  );
}

SMSBankbalance2(BuildContext context, var name, var hint) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      alignment: Alignment.centerLeft,
      width: double.maxFinite,
      height: ScreenSize.fSize_50(),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(ScreenSize.fSize_10()),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
        child: TextFormField(
          controller: name,
          decoration: InputDecoration(border: InputBorder.none, hintText: hint),
          style: GoogleFonts.ibmPlexSansThaiLooped(
              fontWeight: FontWeight.w600,
              fontSize: ScreenSize.fSize_15(),
              color: Colors.grey),
        ),
      ),
    ),
  );
}

SMSSendMessage(BuildContext context, var ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Center(
      child: Container(
        height: ScreenSize.fSize_50(),
        width: ScreenSize.horizontalBlockSize! * 50,
        decoration: BoxDecoration(
          color: Color(0xFF12356E),
          borderRadius: BorderRadius.all(
            Radius.circular(ScreenSize.fSize_10()),
          ),
        ),
        child: Center(
            child: Text(
          "Send Message",
          style: GoogleFonts.ibmPlexSansThaiLooped(
              fontSize: ScreenSize.fSize_15(),
              fontWeight: FontWeight.w600,
              color: Colors.white),
        )),
      ),
    ),
  );
}

ussdContainer(
    BuildContext context, String name, String name2, String icon, var ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: ScreenSize.horizontalBlockSize! * 45,
      width: ScreenSize.horizontalBlockSize! * 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenSize.fSize_15()),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: ScreenSize.fSize_12(), top: ScreenSize.fSize_8()),
            child: Container(
              height: ScreenSize.fSize_50(),
              width: ScreenSize.fSize_50(),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFFCADDFF).withOpacity(0.6),
                        blurRadius: 5,
                        spreadRadius: 5)
                  ],
                  image: DecorationImage(image: AssetImage(icon), scale: 2.5),
                  color: const Color(0xFFEBF1FE),
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Colors.white)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenSize.fSize_14(), top: ScreenSize.fSize_12()),
            child: Text(
              name,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontSize: ScreenSize.fSize_15(),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF12356E)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenSize.fSize_14(), top: ScreenSize.fSize_6()),
            child: Container(
              height: ScreenSize.horizontalBlockSize! * 12,
              color: Colors.transparent,
              child: Text(
                name2,
                style: GoogleFonts.ibmPlexSansThaiLooped(
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
}

ussdContainer2(
    BuildContext context, String name, String name2, String number, var ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: ScreenSize.horizontalBlockSize! * 38,
      width: ScreenSize.horizontalBlockSize! * 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenSize.fSize_15()),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: ScreenSize.fSize_12(), top: ScreenSize.fSize_8()),
            child: Container(
              height: ScreenSize.fSize_50(),
              width: ScreenSize.fSize_50(),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFFCADDFF).withOpacity(0.6),
                        blurRadius: 5,
                        spreadRadius: 5)
                  ],
                  color: const Color(0xFFEBF1FE),
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Colors.white)),
              child: Center(
                child: Text(
                  number,
                  style: GoogleFonts.ibmPlexSansThaiLooped(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF12356E)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenSize.fSize_14(), top: ScreenSize.fSize_12()),
            child: Container(
              width: ScreenSize.horizontalBlockSize! * 40,
              height: ScreenSize.fSize_30(),
              color: Colors.transparent,
              child: Text(
                overflow: TextOverflow.ellipsis,
                name,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                    fontSize: ScreenSize.fSize_17(),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF12356E)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenSize.fSize_14()),
            child: Text(
              overflow: TextOverflow.ellipsis,
              name2,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

sameRow(BuildContext context, String name) {
  return Row(
    children: [
      SizedBox(width: ScreenSize.fSize_6()),
      Text(
        name,
        style: GoogleFonts.ibmPlexSansThaiLooped(
            color: const Color(0xFF12356E),
            fontWeight: FontWeight.bold,
            fontSize: ScreenSize.fSize_20()),
      ),
    ],
  );
}

compareContainer(BuildContext context, String title, String title2,
    String loanamount, String interest, var controllerA, var controllerB) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.ibmPlexSansThaiLooped(
              fontSize: ScreenSize.fSize_12(),
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: ScreenSize.fSize_50(),
            width: ScreenSize.horizontalBlockSize! * 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(ScreenSize.fSize_10()),
              ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: ScreenSize.fSize_90(),
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.only(top: ScreenSize.fSize_15()),
                      child: TextFormField(
                        controller: controllerA,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please Enter $loanamount";
                          }
                        },
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "00",
                          hintStyle: GoogleFonts.ibmPlexSansThaiLooped(
                              color: const Color(0xFF768AAB),
                              fontWeight: FontWeight.w500),
                          border: InputBorder.none,
                        ),
                        // textInputAction: TextInputAction,
                      ),
                    ),
                  ),
                  Text(
                    loanamount,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.ibmPlexSansThaiLooped(
                      fontSize: ScreenSize.fSize_12(),
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF768AAB),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title2,
            style: GoogleFonts.ibmPlexSansThaiLooped(
              fontSize: ScreenSize.fSize_12(),
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: ScreenSize.fSize_50(),
            width: ScreenSize.horizontalBlockSize! * 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(ScreenSize.fSize_10()),
              ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: ScreenSize.fSize_90(),
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.only(top: ScreenSize.fSize_15()),
                      child: TextFormField(
                        controller: controllerB,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please Enter $title2";
                          }
                        },
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "00",
                          hintStyle: GoogleFonts.ibmPlexSansThaiLooped(
                              color: const Color(0xFF768AAB),
                              fontWeight: FontWeight.w500),
                          border: InputBorder.none,
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ),
                  Text(
                    interest,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.ibmPlexSansThaiLooped(
                      fontSize: ScreenSize.fSize_12(),
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF768AAB),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

compareContainer2(BuildContext context, String title, String title2,
    String loanamount, String interest, String amount, String intere) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: ScreenSize.fSize_50(),
              width: ScreenSize.horizontalBlockSize! * 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(ScreenSize.fSize_10()),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      amount,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF768AAB),
                      ),
                    ),
                    Text(
                      loanamount,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF768AAB),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title2,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: ScreenSize.fSize_50(),
              width: ScreenSize.horizontalBlockSize! * 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(ScreenSize.fSize_10()),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      intere,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF768AAB),
                      ),
                    ),
                    Text(
                      interest,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF768AAB),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

compareLoanContainer(BuildContext context, String name, var ontap) {
  return Center(
    child: GestureDetector(
      onTap: ontap,
      child: Container(
        width: ScreenSize.horizontalBlockSize! * 50,
        height: ScreenSize.fSize_50(),
        decoration: BoxDecoration(
            color: const Color(0xFF12356E),
            borderRadius: BorderRadius.all(
              Radius.circular(ScreenSize.fSize_10()),
            ),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
            ]),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.ibmPlexSansThaiLooped(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: ScreenSize.fSize_15()),
          ),
        ),
      ),
    ),
  );
}

compareLoanContainer222(BuildContext context, String name, var ontap, var arg) {
  return Center(
    child: GestureDetector(
      onTap: () {
        Get.to(ontap, arguments: [arg]);
      },
      child: Container(
        width: ScreenSize.horizontalBlockSize! * 55,
        height: ScreenSize.fSize_50(),
        decoration: BoxDecoration(
            color: const Color(0xFF12356E),
            borderRadius: BorderRadius.all(
              Radius.circular(ScreenSize.fSize_10()),
            ),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
            ]),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.ibmPlexSansThaiLooped(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: ScreenSize.fSize_15()),
          ),
        ),
      ),
    ),
  );
}

comparereset(BuildContext context, String name, var ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: ScreenSize.horizontalBlockSize! * 40,
      height: ScreenSize.fSize_50(),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
        ],
        color: const Color(0xFFC7DBFF),
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenSize.fSize_10()),
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: GoogleFonts.ibmPlexSansThaiLooped(
              fontWeight: FontWeight.w600, fontSize: ScreenSize.fSize_15()),
        ),
      ),
    ),
  );
}

loan1(BuildContext context, String name, String loan, String loan2,
    String deference) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      IntrinsicWidth(
        stepWidth: ScreenSize.horizontalBlockSize! * 95,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenSize.fSize_20()),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenSize.fSize_10(), top: ScreenSize.fSize_8()),
              child: Text(
                name,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Divider(
                color: Color(0xFF768AAB),
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
              child: Text(
                loan,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Divider(
                color: Color(0xFF768AAB),
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
              child: Text(
                loan2,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Divider(
                color: Color(0xFF768AAB),
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
              child: Text(
                textAlign: TextAlign.center,
                deference,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: ScreenSize.fSize_20()),
          ],
        ),
      ),
    ],
  );
}

loan2(BuildContext context, String name, String loan, String loan2,
    String deference) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: ScreenSize.fSize_10()),
      IntrinsicWidth(
        stepWidth: ScreenSize.horizontalBlockSize! * 95,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
              child: Text(
                name,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenSize.fSize_10(),
                  top: ScreenSize.horizontalBlockSize! * 5),
              child: Text(
                loan,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenSize.fSize_10(),
                  top: ScreenSize.horizontalBlockSize! * 6),
              child: Text(
                loan2,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenSize.fSize_10(),
                  top: ScreenSize.horizontalBlockSize! * 7),
              child: Text(
                textAlign: TextAlign.center,
                deference,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

emidetailtext(BuildContext context, String text) {
  return Text(
    text,
    style: GoogleFonts.ibmPlexSansThaiLooped(
        color: Colors.white,
        fontSize: ScreenSize.fSize_15(),
        fontWeight: FontWeight.w600),
  );
}

emidetailtext2(BuildContext context, String text) {
  return Text(
    text,
    style: GoogleFonts.ibmPlexSansThaiLooped(
        color: Colors.black,
        fontSize: ScreenSize.fSize_15(),
        fontWeight: FontWeight.w600),
  );
}

// ignore: non_constant_identifier_names
GSTCalculationContainer(BuildContext context, String netValue, String amount,
    String totalAmount, String cgstRate, String cgstValue) {
  return Container(
    decoration: BoxDecoration(
        color: const Color(0xFF12356E),
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenSize.fSize_10()),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
        ]),
    child: Column(
      children: [
        SizedBox(height: ScreenSize.fSize_20()),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_10()),
                  Text(
                    "Net Amount",
                    style: GoogleFonts.ibmPlexSansThaiLooped(
                      fontSize: ScreenSize.fSize_15(),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF768AAB),
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    netValue,
                    style: GoogleFonts.ibmPlexSansThaiLooped(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: VerticalDivider(
                  thickness: 1,
                  color: Color(0xFF768AAB),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_10()),
                  Text(
                    "GST Amount",
                    style: GoogleFonts.ibmPlexSansThaiLooped(
                      fontSize: ScreenSize.fSize_15(),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF768AAB),
                    ),
                  ),
                  Text(
                    amount,
                    style: GoogleFonts.ibmPlexSansThaiLooped(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            color: Color(0xFF768AAB),
          ),
        ),
        Column(
          children: [
            SizedBox(height: ScreenSize.fSize_10()),
            Text(
              "Total Amount",
              style: GoogleFonts.ibmPlexSansThaiLooped(
                fontSize: ScreenSize.fSize_15(),
                fontWeight: FontWeight.w500,
                color: const Color(0xFF768AAB),
              ),
            ),
            Text(
              totalAmount,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: ScreenSize.fSize_20(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "CGST : $cgstRate = $cgstValue",
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenSize.fSize_13(),
                  color: Colors.white),
            ),
            Text(
              "SGST : $cgstRate = $cgstValue",
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenSize.fSize_13(),
                  color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: ScreenSize.fSize_20())
      ],
    ),
  );
}

emidetaildivider() {
  return const Padding(
    padding: EdgeInsets.all(9),
    child: VerticalDivider(
      thickness: 1,
      color: Color(0xFF768AAB),
    ),
  );
}

emimonth(BuildContext context, String number) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      number,
      style: GoogleFonts.ibmPlexSansThaiLooped(fontWeight: FontWeight.w600),
    ),
  );
}

barchart(BuildContext context, String number) {
  return IntrinsicHeight(
    child: Row(
      children: [
        SizedBox(width: ScreenSize.fSize_40()),
        Text(
          number,
          style: GoogleFonts.ibmPlexSansThaiLooped(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: ScreenSize.fSize_6()),
        Container(
          width: ScreenSize.horizontalBlockSize! * 70,
          child: const Divider(
            color: Colors.black,
          ),
        )
      ],
    ),
  );
}

barchart2(BuildContext context, String number) {
  return IntrinsicHeight(
    child: Row(
      children: [
        SizedBox(width: ScreenSize.fSize_45()),
        Text(
          number,
          style: GoogleFonts.ibmPlexSansThaiLooped(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: ScreenSize.fSize_6()),
        Container(
          width: ScreenSize.horizontalBlockSize! * 70,
          child: const Divider(
            color: Colors.black,
          ),
        )
      ],
    ),
  );
}

barchart3(BuildContext context, String number) {
  return IntrinsicHeight(
    child: Row(
      children: [
        SizedBox(width: ScreenSize.fSize_50()),
        Text(
          number,
          style: GoogleFonts.ibmPlexSansThaiLooped(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: ScreenSize.fSize_6()),
        Container(
          width: ScreenSize.horizontalBlockSize! * 70,
          child: const Divider(
            color: Colors.black,
          ),
        )
      ],
    ),
  );
}

emiadvance(
  BuildContext context,
  var controller,
  sign,
) {
  return Container(
    height: ScreenSize.fSize_45(),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
          offset: Offset(0, 3),
        )
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(ScreenSize.fSize_11()),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: ScreenSize.fSize_200(),
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.only(top: ScreenSize.fSize_10()),
              child: TextFormField(
                controller: controller,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please Enter $value";
                  }
                },
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "00",
                  hintStyle: GoogleFonts.ibmPlexSansThaiLooped(
                      color: const Color(0xFF768AAB),
                      fontWeight: FontWeight.w500),
                  border: InputBorder.none,
                ),
                // textInputAction: textInputAction,
              ),
            ),
          ),
          // Text(
          //   number,
          //   style: GoogleFonts.ibmPlexSansThaiLooped(
          //       color: const Color(0xFF768AAB), fontWeight: FontWeight.w600),
          // ),
          Text(
            sign,
            style: GoogleFonts.ibmPlexSansThaiLooped(
                color: const Color(0xFF768AAB), fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}

ppfCalculation(BuildContext context, var controller) {
  return Container(
    height: ScreenSize.fSize_45(),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
          offset: Offset(0, 3),
        )
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(ScreenSize.fSize_11()),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: ScreenSize.fSize_200(),
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.only(top: ScreenSize.fSize_10()),
              child: TextFormField(
                controller: controller,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please Enter $value";
                  }
                },
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "00",
                  hintStyle: GoogleFonts.ibmPlexSansThaiLooped(
                      color: const Color(0xFF768AAB),
                      fontWeight: FontWeight.w500),
                  border: InputBorder.none,
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
          ),
          // Text(
          //   number,
          //   style: GoogleFonts.ibmPlexSansThaiLooped(
          //       color: const Color(0xFF768AAB), fontWeight: FontWeight.w600),
          // ),
          Padding(
            padding: EdgeInsets.only(right: ScreenSize.fSize_10()),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset("assets/icons/down-arrow.png"),
            ),
          ),
          /* Text(
            sign,
            style: GoogleFonts.ibmPlexSansThaiLooped(
                color: const Color(0xFF768AAB), fontWeight: FontWeight.w600),
          ),*/
        ],
      ),
    ),
  );
}

emiadvancebutton(BuildContext context, String name, var ontap) {
  return Center(
    child: GestureDetector(
      onTap: ontap,
      child: Container(
        width: ScreenSize.horizontalBlockSize! * 65,
        height: ScreenSize.fSize_50(),
        decoration: BoxDecoration(
            color: const Color(0xFF12356E),
            borderRadius: BorderRadius.all(
              Radius.circular(ScreenSize.fSize_10()),
            ),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
            ]),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.ibmPlexSansThaiLooped(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: ScreenSize.fSize_15()),
          ),
        ),
      ),
    ),
  );
}

loanCalculatorContainer(
    BuildContext context, String name, String number, sign) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: ScreenSize.fSize_6()),
        child: Text(
          name,
          style: GoogleFonts.ibmPlexSansThaiLooped(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      SizedBox(height: ScreenSize.fSize_10()),
      Container(
        height: ScreenSize.fSize_45(),
        width: ScreenSize.horizontalBlockSize! * 45,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(ScreenSize.fSize_11()),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                number,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                    color: const Color(0xFF768AAB),
                    fontWeight: FontWeight.w600),
              ),
              Text(
                sign,
                style: GoogleFonts.ibmPlexSansThaiLooped(
                    color: const Color(0xFF768AAB),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

viewMoreDetail(BuildContext context, var ontap) {
  return Center(
    child: GestureDetector(
      onTap: ontap,
      child: Container(
        width: ScreenSize.horizontalBlockSize! * 55,
        height: ScreenSize.fSize_50(),
        decoration: BoxDecoration(
            color: const Color(0xFF12356E),
            borderRadius: BorderRadius.all(
              Radius.circular(ScreenSize.fSize_10()),
            ),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
            ]),
        child: Center(
          child: Text(
            "View more details",
            style: GoogleFonts.ibmPlexSansThaiLooped(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                fontSize: ScreenSize.fSize_15()),
          ),
        ),
      ),
    ),
  );
}

alertContainer(BuildContext context, String title, var boxcolor, var fontcolor,
    var ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: ScreenSize.fSize_45(),
      width: ScreenSize.horizontalBlockSize! * 31,
      decoration: BoxDecoration(
          color: boxcolor,
          border: Border.all(color: const Color(0xFF12356E)),
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenSize.fSize_10()))),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.ibmPlexSansThaiLooped(
            color: fontcolor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

epfContainer(BuildContext context, String title) {
  return Container(
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
            offset: Offset(0, 3),
          )
        ]),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.ibmPlexSansThaiLooped(
                fontSize: ScreenSize.fSize_15(), fontWeight: FontWeight.w600),
          ),
          Image.asset(
            "assets/icons/arrowright.png",
            scale: 2.0,
            color: Colors.black,
          )
        ],
      ),
    ),
  );
}

holidaycontainer(
    BuildContext context, String name, String name2, String icon, var ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: ScreenSize.horizontalBlockSize! * 45,
      width: ScreenSize.horizontalBlockSize! * 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenSize.fSize_15()),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: ScreenSize.fSize_12(), top: ScreenSize.fSize_8()),
            child: Container(
              height: ScreenSize.fSize_50(),
              width: ScreenSize.fSize_50(),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFFCADDFF).withOpacity(0.6),
                        blurRadius: 5,
                        spreadRadius: 5)
                  ],
                  image: DecorationImage(image: AssetImage(icon), scale: 2.3),
                  color: const Color(0xFFEBF1FE),
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Colors.white)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenSize.fSize_14(), top: ScreenSize.fSize_12()),
            child: Text(
              name,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontSize: ScreenSize.fSize_14(),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF12356E)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenSize.fSize_14(), top: ScreenSize.fSize_6()),
            child: Container(
              height: ScreenSize.horizontalBlockSize! * 12,
              color: Colors.transparent,
              child: Text(
                name2,
                style: GoogleFonts.ibmPlexSansThaiLooped(
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
}

emiAdvanceCalculation(
    BuildContext context,
    String interest,
    String payment,
    String principal,
    String emi,
    String interestValue,
    String paymentValue,
    String principalValue,
    String emiValue) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: const Color(0xFF12356E),
          borderRadius: BorderRadius.all(
            Radius.circular(
              ScreenSize.fSize_15(),
            ),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
          ]),
      child: Column(
        children: [
          SizedBox(height: ScreenSize.fSize_15()),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(width: ScreenSize.fSize_14()),
                Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Text(
                      interest,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                        fontSize: ScreenSize.fSize_14(),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF768AAB),
                      ),
                    ),
                    Text(
                      // NumberFormat.currency(name: '')
                      //     .format(int.parse(interestValue)),
                      interestValue,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                // SizedBox(width: ScreenSize.fSize_10()),
                Stack(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: VerticalDivider(
                        thickness: 1,
                        color: Color(0xFF768AAB),
                      ),
                    ),
                  ],
                ),
                // SizedBox(width: ScreenSize.fSize_14()),
                Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Text(
                      payment,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                        fontSize: ScreenSize.fSize_14(),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF768AAB),
                      ),
                    ),
                    Text(
                      // NumberFormat.currency(name: '')
                      //     .format(int.parse(paymentValue)),
                      paymentValue,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenSize.fSize_10()),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenSize.fSize_10(), right: ScreenSize.fSize_10()),
            child: const Divider(
              thickness: 1,
              color: Color(0xFF768AAB),
            ),
          ),
          SizedBox(height: ScreenSize.fSize_10()),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(width: ScreenSize.fSize_14()),
                Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Text(
                      principal,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                        fontSize: ScreenSize.fSize_14(),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF768AAB),
                      ),
                    ),
                    Text(
                      // NumberFormat.currency(name: '')
                      //     .format(int.parse(principalValue)),
                      principalValue,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                // SizedBox(width: ScreenSize.fSize_20()),
                Stack(
                  children: const [
                    VerticalDivider(
                      thickness: 1,
                      color: Color(0xFF768AAB),
                    ),
                  ],
                ),
                // SizedBox(width: ScreenSize.fSize_30()),
                Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Text(
                      emi,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                        fontSize: ScreenSize.fSize_14(),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF768AAB),
                      ),
                    ),
                    Text(
                      // NumberFormat.currency(name: "")
                      //     .format(int.parse(emiValue))
                      //     .toString(),
                      emiValue,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenSize.fSize_20()),
        ],
      ),
    ),
  );
}

emiAdvanceCalculation2(
    BuildContext context,
    String interest,
    String payment,
    String principal,
    String emi,
    String interestValue,
    String paymentValue,
    String principalValue,
    String emiValue) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: const Color(0xFF12356E),
          borderRadius: BorderRadius.all(
            Radius.circular(
              ScreenSize.fSize_15(),
            ),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
          ]),
      child: Column(
        children: [
          SizedBox(height: ScreenSize.fSize_15()),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: ScreenSize.fSize_10()),
                Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Container(
                      width: ScreenSize.horizontalBlockSize! * 40,
                      color: Colors.transparent,
                      child: Text(
                        interest,
                        style: GoogleFonts.ibmPlexSansThaiLooped(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF768AAB),
                        ),
                      ),
                    ),
                    Text(
                      // NumberFormat.currency(name: 'INR ')
                      //     .format(int.parse(interestValue)),
                      interestValue,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Stack(
                  children: const [
                    VerticalDivider(
                      thickness: 1,
                      color: Color(0xFF768AAB),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Container(
                      alignment: Alignment.center,
                      width: ScreenSize.horizontalBlockSize! * 40,
                      color: Colors.transparent,
                      child: Text(
                        payment,
                        style: GoogleFonts.ibmPlexSansThaiLooped(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF768AAB),
                        ),
                      ),
                    ),
                    Text(
                      // NumberFormat.currency(name: 'INR ')
                      //     .format(int.parse(paymentValue)),
                      paymentValue,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenSize.fSize_10()),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenSize.fSize_10(), right: ScreenSize.fSize_10()),
            child: const Divider(
              thickness: 1,
              color: Color(0xFF768AAB),
            ),
          ),
          SizedBox(height: ScreenSize.fSize_10()),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: ScreenSize.fSize_10()),
                Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Container(
                      width: ScreenSize.horizontalBlockSize! * 40,
                      color: Colors.transparent,
                      child: Text(
                        principal,
                        style: GoogleFonts.ibmPlexSansThaiLooped(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF768AAB),
                        ),
                      ),
                    ),
                    Text(
                      // NumberFormat.currency(name: 'INR ')
                      //     .format(int.parse(interestValue)),
                      principalValue,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Stack(
                  children: const [
                    VerticalDivider(
                      thickness: 1,
                      color: Color(0xFF768AAB),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Container(
                      alignment: Alignment.center,
                      width: ScreenSize.horizontalBlockSize! * 40,
                      color: Colors.transparent,
                      child: Text(
                        emi,
                        style: GoogleFonts.ibmPlexSansThaiLooped(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF768AAB),
                        ),
                      ),
                    ),
                    Text(
                      // NumberFormat.currency(name: 'INR ')
                      //     .format(int.parse(paymentValue)),
                      emiValue,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenSize.fSize_20()),
        ],
      ),
    ),
  );
}

loanCalculator(BuildContext context, var emivalue, var paymentValue,
    var interestValue, var loan) {
  return Container(
    width: double.maxFinite,
    decoration: BoxDecoration(
        color: const Color(0xFF12356E),
        borderRadius: BorderRadius.all(
          Radius.circular(
            ScreenSize.fSize_15(),
          ),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
        ]),
    child: IntrinsicHeight(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: ScreenSize.fSize_15()),
              Row(
                children: [
                  SizedBox(
                    width: ScreenSize.fSize_38(),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: ScreenSize.fSize_70(),
                    width: ScreenSize.horizontalBlockSize! * 30,
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Monthly EMI",
                          style: style,
                        ),
                        Text(
                          emivalue,
                          style: style2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: ScreenSize.horizontalBlockSize! * 20,
                  ),
                  Container(
                    color: Colors.transparent,
                    height: ScreenSize.fSize_70(),
                    width: ScreenSize.horizontalBlockSize! * 30,
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Total Payment",
                          style: style,
                        ),
                        Text(
                          paymentValue,
                          style: style2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenSize.fSize_20()),
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenSize.fSize_15(), right: ScreenSize.fSize_15()),
                child: const Divider(
                  thickness: 1,
                  color: Color(0xFF768AAB),
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    SizedBox(
                      width: ScreenSize.fSize_34(),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: ScreenSize.fSize_70(),
                      width: ScreenSize.horizontalBlockSize! * 30,
                      child: Column(
                        children: [
                          SizedBox(height: ScreenSize.fSize_20()),
                          Text(
                            "Total Interest",
                            overflow: TextOverflow.clip,
                            style: style,
                          ),
                          Text(
                            interestValue,
                            style: style2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.horizontalBlockSize! * 20,
                    ),
                    Container(
                      color: Colors.transparent,
                      height: ScreenSize.fSize_70(),
                      width: ScreenSize.horizontalBlockSize! * 30,
                      child: Column(
                        children: [
                          SizedBox(height: ScreenSize.fSize_20()),
                          Text(
                            "Loan",
                            style: style,
                          ),
                          Text(
                            loan,
                            style: style2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ScreenSize.fSize_20()),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenSize.fSize_24(),
                left: ScreenSize.horizontalBlockSize! * 50),
            child: SizedBox(
              height: ScreenSize.horizontalBlockSize! * 20,
              child: const VerticalDivider(
                thickness: 1,
                color: Color(0xFF768AAB),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenSize.horizontalBlockSize! * 35,
                left: ScreenSize.horizontalBlockSize! * 50),
            child: SizedBox(
              height: ScreenSize.horizontalBlockSize! * 20,
              child: const VerticalDivider(
                thickness: 1,
                color: Color(0xFF768AAB),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

EMICALCULATION(String title, String subtitle, String title2, String subtitle2,
    var controller, var controller2) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: ScreenSize.fSize_50(),
              width: ScreenSize.horizontalBlockSize! * 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(ScreenSize.fSize_10()),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: ScreenSize.fSize_90(),
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(top: ScreenSize.fSize_15()),
                        child: TextField(
                          controller: controller,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "00",
                            hintStyle: GoogleFonts.ibmPlexSansThaiLooped(
                                color: const Color(0xFF768AAB),
                                fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                        fontSize: ScreenSize.fSize_12(),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF768AAB),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title2,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: ScreenSize.fSize_50(),
              width: ScreenSize.horizontalBlockSize! * 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(ScreenSize.fSize_10()),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: ScreenSize.fSize_90(),
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(top: ScreenSize.fSize_15()),
                        child: TextField(
                          controller: controller2,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "00",
                            hintStyle: GoogleFonts.ibmPlexSansThaiLooped(
                                color: const Color(0xFF768AAB),
                                fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                    Text(
                      subtitle2,
                      style: GoogleFonts.ibmPlexSansThaiLooped(
                        fontSize: ScreenSize.fSize_12(),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF768AAB),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

List<String> ifsc_list = [
  'Abhyudaya Co-op Bank.txt',
  'Abu Dhabi Commercial Bank.txt',
  'Akola District Central Co-op Bank.txt',
  'Akola Janata Commercial Co-op Bank.txt',
  'Allahabad Bank.txt',
  'Almora Urban Co-op Bank.txt',
  'Andhra Bank.txt',
  'Andhra Pragathi Grameena Bank.txt',
  'Apna Sahakari Bank Ltd.txt',
  'Australia & New Zealand Banking Group Ltd.txt',
  'Axis Bank.txt',
  'Bandhan Bank Ltd.txt',
  'Bank Internasional Indonesia.txt',
  'Bank of America.txt',
  'Bank of Bahrain & Kuwait.txt',
  'Bank of Baroda.txt',
  'Bank of Ceylon.txt',
  'Bank of India.txt',
  'Bank of Maharashtra.txt',
  'Bank of Tokyo-Mitsubishi Ufj Ltd.txt',
  'Barclays Bank.txt',
  'Bassein Catholic Co-op Bank.txt',
  'Bharatiya Mahila Bank.txt',
  'BNP Paribas.txt',
  'Calyon Bank.txt',
  'Canara Bank.txt',
  'Capital Local Area Bank.txt',
  'Catholic Syrian Bank.txt',
  'Central Bank of India.txt',
  'Chinatrust Commercial Bank.txt',
  'Citibank.txt',
  'Citizencredit Co-op Bank.txt',
  'City Union Bank.txt',
  'Commonwealth Bank of Australia.txt',
  'Corporation Bank.txt',
  'Credit Suisse.txt',
  'DBS Bank.txt',
  'Dena Bank.txt',
  'Deutsche Bank.txt',
  'Deutsche Securities India Pvt. Ltd.txt',
  'Development Credit Bank Ltd.txt',
  'Dhanlaxmi Bank Ltd.txt',
  'DICGC.txt',
  'Doha Bank.txt',
  'Dombivli Nagari Sahakari Bank Ltd.txt',
  'Export Import Bank of India.txt',
  'Firstrand Bank Ltd.txt',
  'Gurgaon Gramin Bank.txt',
  'HDFC BANK.txt',
  'HSBC.txt',
  'ICICI Bank.txt',
  'IDBI Bank.txt',
  'IDFC Bank.txt',
  'IDRBT.txt',
  'Indian Bank.txt',
  'Indian Overseas Bank.txt',
  'Indusind Bank.txt',
  'Industrial & Commercial Bank of China Ltd.txt',
  'Industrial Bank of Korea.txt',
  'ING Vysya Bank.txt',
  'Jalgaon Janata Sahkari Bank Ltd.txt',
  'Janakalyan Sahakari Bank Ltd.txt',
  'Janaseva Sahakari Bank (Borivli) Ltd.txt',
  'Janaseva Sahakari Bank Ltd (Pune).txt',
  'Janata Sahakari Bank Ltd (Pune).txt',
  'JPMorgan Chase.txt',
  'Kallappanna Awade Ich Janata S Bank.txt',
  'Kapol Co-op Bank.txt',
  'Karnataka Bank Ltd.txt',
  'Karnataka Vikas Grameena Bank.txt',
  'Karur Vysya Bank.txt',
  'KEB Hana Bank.txt',
  'Kerala Gramin Bank.txt',
  'Kotak Mahindra Bank.txt',
  'Mahanagar Co-op Bank Ltd.txt',
  'Maharashtra State Co-op Bank.txt',
  'Mashreq Bank.txt',
  'Mizuho Corporate Bank Ltd.txt',
  'Nagar Urban Co-op Bank.txt',
  'Nagpur Nagrik Sahakari Bank Ltd.txt',
  'National Australia Bank.txt',
  'National Bank Of Abu Dhabi PJSC.txt',
  'New India Co-op Bank Ltd.txt',
  'NKGSB Co-op Bank Ltd.txt',
  'North Malabar Gramin Bank.txt',
  'Nutan Nagarik Sahakari Bank Ltd.txt',
  'Oman International Bank Saog.txt',
  'Oriental Bank Of Commerce.txt',
  'Parsik Janata Sahakari Bank Ltd.txt',
  'Pragathi Krishna Gramin Bank.txt',
  'Prathama Bank.txt',
  'Prime Co-op Bank Ltd.txt',
  'Punjab & Maharashtra Co-op Bank Ltd.txt',
  'Punjab & Sind Bank.txt',
  'Punjab National Bank.txt',
  'Rabobank International (ccrb).txt',
  'Rajgurunagar Sahakari Bank Ltd.txt',
  'Rajkot Nagarik Sahakari Bank Ltd.txt',
  'Reserve Bank of India.txt',
  'Samarth Sahakari Bank Ltd.txt',
  'SBER Bank.txt',
  'Shikshak Sahakari Bank Ltd.txt',
  'Shinhan Bank.txt',
  'Shivalik Mercantile Co-op Bank Ltd.txt',
  'Shri Chhatrapati Rajashri Shahu Urban Co-op Bank Ltd.txt',
  'Societe Generale.txt',
  'Solapur Janata Sahkari Bank Ltd.Solapur.txt',
  'South Indian Bank.txt',
  'Standard Chartered Bank.txt',
  'State Bank of Bikaner & Jaipur.txt',
  'State Bank of Hyderabad.txt',
  'State Bank of India - SBI.txt',
  'State Bank of Mauritius Ltd.txt',
  'State Bank of Mysore.txt',
  'State Bank of Patiala.txt',
  'State Bank of Travancore.txt',
  'Sumitomo Mitsui Banking Corporation.txt',
  'Surat National Co-op Bank Ltd.txt',
  'Syndicate Bank.txt',
  'Tamilnad Mercantile Bank Ltd.txt',
  'The A P Mahesh Co-op Urban Bank Ltd.txt',
  'The Ahmedabad Mercantile Co-op Bank Ltd.txt',
  'The Andhra Pradesh State Co-op Bank Ltd.txt',
  'The Bank of Nova Scotia.txt',
  'The Bank of Rajasthan Ltd.txt',
  'The Bharat Co-op Bank (Mumbai) Ltd.txt',
  'The Cosmos Co-op Bank Ltd.txt',
  'The Delhi State Co-op Bank Ltd.txt',
  'The Federal Bank Ltd.txt',
  'The Gadchiroli District Central Co-op Bank Ltd.txt',
  'The Greater Bombay Co-op Bank Ltd.txt',
  'The Gujarat State Co-op Bank Ltd.txt',
  'The Hasti Coop Bank Ltd.txt',
  'The Jalgaon Peoples Co-op Bank.txt',
  'The Jammu & Kashmir Bank Ltd.txt',
  'The Kalupur Commercial Co-Op Bank Ltd.txt',
  'The Kalyan Janata Sahakari Bank Ltd.txt',
  'The Kangra Central Co-op Bank Ltd.txt',
  'The Kangra Co-op Bank Ltd.txt',
  'The Karad Urban Co-op Bank Ltd.txt',
  'The Karanataka State Co-op Apex Bank Ltd.txt',
  'The Kurmanchal Nagar Sahakari Bank Ltd.txt',
  'The Lakshmi Vilas Bank Ltd.txt',
  'The Mehsana Urban Co-op Bank Ltd.txt',
  'The Mumbai District Central Co-op Bank Ltd.txt',
  'The Municipal Co-op Bank Ltd Mumbai.txt',
  'The Nainital Bank Ltd.txt',
  'The Nasik Merchants Co-op Bank Ltd (Nashik).txt',
  'The Pandharpur Urban Co-op Bank Ltd (Pandharpur).txt',
  'The Rajasthan State Co-op Bank Ltd.txt',
  'The Ratnakar Bank Ltd.txt',
  'The Royal Bank of Scotland N.V.txt',
  'The Sahebrao Deshmukh Co-op Bank Ltd.txt',
  'The Saraswat Co-op Bank Ltd.txt',
  'The Seva Vikas Co-op Bank Ltd (Svb).txt',
  'The Shamrao Vithal Co-op Bank Ltd.txt',
  'The Surat District Co-op Bank Ltd.txt',
  'The Surat Peoples Co-op Bank Ltd.txt',
  'The Sutex Co-Op Bank Ltd.txt',
  'The Tamilnadu State Apex Co-op Bank Ltd.txt',
  'The Thane Bharat Sahakari Bank Ltd.txt',
  'The Thane District Central Co-op Bank Ltd.txt',
  'The Varachha Co-op Bank Ltd.txt',
  'The Vishweshwar Sahakari Bank Ltd (Pune).txt',
  'The West Bengal State Co-op Bank Ltd.txt',
  'The Zoroastrian Co-op Bank Ltd.txt',
  'TJSB Sahakari Bank Ltd.txt',
  'Tumkur Grain Merchants Co-op Bank Ltd.txt',
  'UBS AG.txt',
  'UCO Bank.txt',
  'Union Bank of India.txt',
  'United Bank of India.txt',
  'United Overseas Bank.txt',
  'Vasai Vikas Sahakari Bank Ltd.txt',
  'Vijaya Bank.txt',
  'Westpac Banking Corporation.txt',
  'Woori Bank.txt',
  'Yes Bank.txt',
  'Zila Sahkari Bank Ltd Ghaziabad.txt'
];

List holiday = [
  "Makar Sankranti/Pongal",
  "Republic Day",
  "Vasant Panchami",
  "Guru Ravidas Jayanti",
  "Maharishi Dayanand Saraswati Jayanti",
  "Maha Shivaratri/Shivaratri",
  "Holika Dahana/Hazarat Ali Birthday",
];

List holidaydate = [
  "Jan 14, 2022",
  "Jan 26, 2022",
  "Fab 5, 2022",
  "Fab 16, 2022",
  "Fab 26, 2022",
  "March 1, 2022",
  "March 17, 2022",
];

var appbarr = AppBar(
  leading: GestureDetector(
    onTap: () {
      Get.back();
    },
    child: Icon(Icons.arrow_back_rounded,
        color: const Color(0xFF12356E), size: ScreenSize.fSize_30()),
  ),
  elevation: 0,
  backgroundColor: Colors.transparent,
);

var loanCalculatorBar = AppBar(
  actions: [
    GestureDetector(
      onTap: () {
        Get.to(() => const LoanCalculatorHistoryScreen());
      },
      child: Padding(
        padding: EdgeInsets.only(right: ScreenSize.fSize_10()),
        child: Image(
          image: const AssetImage("assets/icons/history icon.png"),
          width: ScreenSize.fSize_30(),
        ),
      ),
    ),
  ],
  leading: GestureDetector(
    onTap: () {
      Get.back();
    },
    child: Icon(Icons.arrow_back_rounded,
        color: const Color(0xFF12356E), size: ScreenSize.fSize_30()),
  ),
  elevation: 0,
  backgroundColor: Colors.transparent,
);

var emiappbar = AppBar(
  actions: [
    GestureDetector(
      onTap: () {
        Get.to(() => const LoanCalculatorHistoryScreen());
      },
      child: Padding(
        padding: EdgeInsets.only(right: ScreenSize.fSize_10()),
        child: Image(
          image: const AssetImage("assets/icons/share-icon.png"),
          width: ScreenSize.fSize_30(),
        ),
      ),
    ),
  ],
  leading: GestureDetector(
    onTap: () {
      Get.back();
    },
    child: Icon(Icons.arrow_back_rounded,
        color: const Color(0xFF12356E), size: ScreenSize.fSize_30()),
  ),
  elevation: 0,
  backgroundColor: Colors.transparent,
);

var decoration = BoxDecoration(
  color: const Color(0xFFEBF1FE),
  borderRadius: BorderRadius.only(
      topRight: Radius.circular(ScreenSize.fSize_30()),
      topLeft: Radius.circular(ScreenSize.fSize_30())),
);

var style = GoogleFonts.ibmPlexSansThaiLooped(
  fontSize: ScreenSize.fSize_12(),
  fontWeight: FontWeight.w500,
  color: const Color(0xFF768AAB),
);

var style2 = GoogleFonts.ibmPlexSansThaiLooped(
    fontSize: ScreenSize.fSize_14(),
    color: Colors.white,
    fontWeight: FontWeight.w500);
