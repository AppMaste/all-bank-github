import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/FD%20Calculation/FD%20Calculation%20Result%20Screen.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FDCalculationScreen extends StatefulWidget {
  const FDCalculationScreen({Key? key}) : super(key: key);

  @override
  State<FDCalculationScreen> createState() => _FDCalculationScreenState();
}

class _FDCalculationScreenState extends State<FDCalculationScreen> {
  TextEditingController principalController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  int id = 1;

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
                sameRow(context, "FD Calculation"),
                SizedBox(height: ScreenSize.fSize_20()),
                Container(
                  width: double.maxFinite,
                  decoration: decoration,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Principal Amount",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_10()),
                        emiadvance(context, principalController, "₹",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Interest Rate",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, interestRateController, "%",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Period of Deposite",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, periodController, "",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Transform.scale(
                              scale: 1.3,
                              child: Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => const Color(0xFF12356E)),
                                activeColor: const Color(0xFF12356E),
                                value: 1,
                                groupValue: id,
                                onChanged: (val) {
                                  setState(() {
                                    // radioButtonItem = 'ONE';
                                    id = 1;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Years',
                              style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w600,
                                fontSize: ScreenSize.fSize_17(),
                              ),
                            ),
                            Transform.scale(
                              scale: 1.3,
                              child: Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => const Color(0xFF12356E)),
                                activeColor: const Color(0xFF12356E),
                                value: 2,
                                groupValue: id,
                                onChanged: (val) {
                                  setState(() {
                                    // radioButtonItem = 'TWO';
                                    id = 2;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Months',
                              style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w600,
                                fontSize: ScreenSize.fSize_17(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        emiadvancebutton(context, "FD Calculate", () {
                          if (principalController.text.isEmpty ||
                              interestRateController.text.isEmpty ||
                              periodController.text.isEmpty) {
                            fluttertost();
                          } else {
                            Get.to(() => const FDCalculationResultScreen(),
                                arguments: [
                                  principalController,
                                  interestRateController,
                                  periodController
                                ]);
                          }
                        }),
                        SizedBox(height: ScreenSize.fSize_20()),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // banner.getBN()
        ],
      ),
    );
  }
}
