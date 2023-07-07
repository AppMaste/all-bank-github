import 'package:all_bank/ScreenSize.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/Button Controller.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  var adload;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adload = native.getNT("listTileMedium");
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_20()),
                  native.getNT("listTileMedium"),
                  SizedBox(height: ScreenSize.fSize_10()),
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
                        SizedBox(height: ScreenSize.fSize_20()),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenSize.fSize_20()),
                          child: Text(
                            "All Bank Account Balance Check",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF12356E),
                                fontSize: ScreenSize.fSize_34()),
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Padding(
                          padding: EdgeInsets.all(ScreenSize.fSize_30()),
                          child: Text(
                            "All bank account balance app helps you check bank account balance anytime. With this one app you can check balance of all bank ...",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontSize: ScreenSize.fSize_17()),
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_15()),
                        Row(
                          children: [
                            SizedBox(width: ScreenSize.fSize_28()),
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFF93B0E0),
                                  shape: BoxShape.circle),
                              height: ScreenSize.fSize_10(),
                              width: ScreenSize.fSize_10(),
                            ),
                            SizedBox(width: ScreenSize.fSize_10()),
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFF93B0E0),
                                  shape: BoxShape.circle),
                              height: ScreenSize.fSize_10(),
                              width: ScreenSize.fSize_10(),
                            ),
                            SizedBox(width: ScreenSize.fSize_10()),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(ScreenSize.fSize_20())),
                                color: const Color(0xFF12356E),
                              ),
                              height: ScreenSize.horizontalBlockSize! * 2.4,
                              width: ScreenSize.fSize_30(),
                            ),
                            SizedBox(width: ScreenSize.fSize_170()),
                            GestureDetector(
                              onTap: () {
                                tapButton.button(context, "/HomeScreen", '');
                                // Get.to(() => const HomeScreen());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      ScreenSize.fSize_30(),
                                    ),
                                  ),
                                  color: const Color(0xFF12356E),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/Arrow - Right.png"),
                                      scale: 1.8),
                                ),
                                height: ScreenSize.fSize_55(),
                                width: ScreenSize.fSize_55(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_90()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          banner.getBN()
        ],
      ),
    );
  }
}
