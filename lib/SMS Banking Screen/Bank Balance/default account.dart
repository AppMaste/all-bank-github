import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ScreenSize.dart';

class SMSChangeAccountScreen extends StatelessWidget {
   SMSChangeAccountScreen({Key? key}) : super(key: key);

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
                      "Change Default Account",
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
                      SizedBox(height: ScreenSize.fSize_20()),
                      form3(context, "CACC <New A/C> <Old A/C> <MPIN>"),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenSize.fSize_8()),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "Example : CACC 45XXXXXXXXXX 52XXXXXXXXXX 4567",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_20()),
                      SMSBankbalance2(context, controller,"asdf"),
                      SizedBox(height: ScreenSize.fSize_20()),
                      SMSSendMessage(context, () {
                      }),
                      SizedBox(height: ScreenSize.fSize_40()),
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
