import 'dart:math';

import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FDCalculationResultScreen extends StatefulWidget {
  const FDCalculationResultScreen({Key? key}) : super(key: key);

  @override
  State<FDCalculationResultScreen> createState() =>
      _FDCalculationResultScreenState();
}

class _FDCalculationResultScreenState extends State<FDCalculationResultScreen> {
  int id = 1;

  var data = Get.arguments;

  bool load = false;

  var interest;
  var total;

  TextEditingController principalController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController periodController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    principalController = data[0];
    interestRateController = data[1];
    periodController = data[2];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        emiadvance(context, data[0], "₹",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Interest Rate",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, data[1], "%",),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Period of Deposite",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, data[2], "",),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            compareLoanContainer(context, "FD Calculate", () {
                              if (principalController.text.isEmpty ||
                                  interestRateController.text.isEmpty ||
                                  periodController.text.isEmpty) {
                                fluttertost();
                              } else {
                                setState(() {
                                  load = true;
                                  fdCalculation();
                                });
                              }
                            }),
                            comparereset(context, "Reset", () {
                              setState(() {});
                              load = false;
                              principalController.clear();
                              interestRateController.clear();
                              periodController.clear();
                            }),
                          ],
                        ),
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
                                    offset: Offset(0, 3)),
                              ]),
                          child: Column(
                            children: [
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Text(
                                          "Investment Amount",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          textAlign: TextAlign.center,
                                          "Maturity Amount =\n${load == true ? total : "0.0"}",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
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
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Text(
                                          "Total Investment Value",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          "Interest = ${load == true ? interest : "0.0"}",
                                          style: GoogleFonts.ibmPlexSansThaiLooped(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: ScreenSize.fSize_20())
                            ],
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_60()),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          banner.getBN()
        ],
      ),
    );
  }

  fdCalculation() {
    int Principal = int.parse(principalController.text);
    int Rate = int.parse(interestRateController.text);
    int Period = int.parse(periodController.text);

    print("Principal:--- $Principal");
    print("Rate:-------- $Rate");
    print("Period:------ $Period");

    var FD = (Principal * Rate * Period) / 100;

    var T = (FD + Principal);

    interest = FD;
    print("interest:---- $interest");

    total = T;
    print("total:---- $total");
  }
}
