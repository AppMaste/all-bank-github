import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ScreenSize.dart';

class SMSMiniStatementScreen extends StatelessWidget {
   SMSMiniStatementScreen({Key? key}) : super(key: key);


   TextEditingController controller = TextEditingController();

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
                      "Bank Balance",
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ScreenSize.fSize_30()),
                      SMSBankbalance(context, "For Primary Account"),
                      SizedBox(height: ScreenSize.fSize_8()),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenSize.fSize_8()),
                        child: Text(
                          "LATRAN <MPIN>",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenSize.fSize_17(),
                              color: const Color(0xFF12356E)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenSize.fSize_8()),
                        child: Text(
                          "Example : LATRAN 4567",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w600, color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_10()),
                      SMSBankbalance2(context, controller,'asvdghasd'),
                      SizedBox(height: ScreenSize.fSize_20()),
                      SMSSendMessage(context, () {
                      }),
                      SizedBox(height: ScreenSize.fSize_40()),
                      SMSBankbalance(context, "For Non-Primary Account"),
                      SizedBox(height: ScreenSize.fSize_8()),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenSize.fSize_8()),
                        child: Text(
                          "LATRAN <A/C No> <MPIN>",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenSize.fSize_17(),
                              color: const Color(0xFF12356E)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenSize.fSize_8()),
                        child: Text(
                          "Example : LATRAN 52XXXXXXXXXX 4567",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w600, color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_10()),
                      SMSBankbalance2(context, controller,'ashgdchgascd'),
                      SizedBox(height: ScreenSize.fSize_20()),
                      SMSSendMessage(context, () {}),
                      SizedBox(height: ScreenSize.fSize_70()),
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
