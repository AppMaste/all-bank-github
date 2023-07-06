import 'package:all_bank/Controller/AppController.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoScreen extends StatelessWidget {
  LogoScreen({Key? key}) : super(key: key);

  AppController myAppController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFfafbff),
              Color(0xFF8dbde4),
              // Colors.blueGrey.shade100
            ],
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage("assets/logo/logo (2).png"),
                  height: ScreenSize.fSize_150(),
                ),
                SizedBox(height: ScreenSize.fSize_60()),
                Row(
                  children: [
                    SizedBox(width: ScreenSize.fSize_20()),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "All Bank\n",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontSize: ScreenSize.fSize_38(),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF12356E),
                            ),
                          ),
                          TextSpan(
                            text: "Balance Check",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontSize: ScreenSize.fSize_38(),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.fSize_20(),),
              ],
            ),
             Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: ScreenSize.fSize_15()),
                child: const CircularProgressIndicator(
                  color: Color(0xFF12356E),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
