import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EPFBalancePassbookScreen extends StatelessWidget {
  const EPFBalancePassbookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarr,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                sameRow(context, "EPF Balance Check"),
                SizedBox(height: ScreenSize.fSize_20()),
                Container(
                  width: double.maxFinite,
                  decoration: decoration,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.fSize_20()),
                        epfContainer(context, "Check Balance (SMS)"),
                        SizedBox(height: ScreenSize.fSize_20()),
                        native.getNT("listTileMedium"),
                        SizedBox(height: ScreenSize.fSize_20()),
                        epfContainer(context, "Check Balance (Call)"),
                        SizedBox(height: ScreenSize.fSize_20()),
                        epfContainer(context, "Check Balance (Online)"),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF12356E),
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
                            padding: EdgeInsets.all(ScreenSize.fSize_10()),
                            child: Text(
                              "Pre-Requisite for availing Missed Call Facility. Mobile Number must be activated with UAN at Unified Portal. Any one of the following KYC must be available against the UAN Bank A/C Number or Aadhar or PAN.",
                              style: GoogleFonts.ibmPlexSansThaiLooped(
                                  fontSize: ScreenSize.fSize_15(),
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_60()),
                      ],
                    ),
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
