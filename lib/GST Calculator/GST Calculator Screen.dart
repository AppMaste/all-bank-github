import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'GST Calculator Result Screen.dart';

class GSTCalculatorScreen extends StatefulWidget {
  const GSTCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<GSTCalculatorScreen> createState() => _GSTCalculatorScreenState();
}

class _GSTCalculatorScreenState extends State<GSTCalculatorScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  var id = 1.0.obs;

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
                sameRow(context, "GST Calculate"),
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
                          "Investment Amount",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_10()),
                        emiadvance(context, amountController, "₹",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Rate of GST",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, rateController, "₹",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => const Color(0xFF12356E)),
                                activeColor: const Color(0xFF12356E),
                                value: 1,
                                groupValue: id.value,
                                onChanged: (val) {
                                  setState(() {
                                    // radioButtonItem = 'ONE';
                                    id.value = 1;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Add GST',
                              style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w600,
                                fontSize: ScreenSize.fSize_15(),
                              ),
                            ),
                            SizedBox(width: ScreenSize.fSize_40()),
                            Transform.scale(
                              scale: 1.3,
                              child: Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => const Color(0xFF12356E)),
                                activeColor: const Color(0xFF12356E),
                                value: 2,
                                groupValue: id.value,
                                onChanged: (val) {
                                  setState(() {
                                    // radioButtonItem = 'TWO';
                                    id.value = 2;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Remove GST',
                              style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w600,
                                fontSize: ScreenSize.fSize_17(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        emiadvancebutton(context, "GST Calculate", () {
                          if (amountController.text.isEmpty ||
                              rateController.text.isEmpty) {
                            fluttertost();
                          } else {
                            Get.to(
                              () => const GSTCalculatorResultScreen(),
                              arguments: [
                                amountController,
                                rateController,
                                id.value
                              ],
                            );
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
