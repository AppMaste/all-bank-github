import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';
import 'EMI in Advance result Screen.dart';

class EMIAdvanceScreen extends StatefulWidget {
  const EMIAdvanceScreen({Key? key}) : super(key: key);

  @override
  State<EMIAdvanceScreen> createState() => _EMIAdvanceScreenState();
}

class _EMIAdvanceScreenState extends State<EMIAdvanceScreen> {

  var id = 1.obs;
  var id2 = 1.obs;

  final List tenureTypes = ['Month', 'Year'];
  String tenureType = "Year";
  bool switchValue = false;

  var tenure;
  var month;

  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  TextEditingController tenureController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("timeeee $tenure");
    print("timeeee in month $month");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbarr,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                sameRow(context, "EMI in Advance Calculator"),
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
                        emiadvance(context, principalController, "₹",
                            ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Interest Rate : Max 50%",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(
                            context, rateController, "%", ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "FeesView",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(
                            context, feesController, "₹", ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Loan Tenure Year",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, tenureController, tenureType,
                            ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Obx(
                              () => Column(
                            children: [
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
                                        // setState(() {
                                        // radioButtonItem = 'ONE';
                                        id.value = 1;
                                        // });
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Year',
                                    style: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                              (states) => const Color(0xFF12356E)),
                                      activeColor: const Color(0xFF12356E),
                                      value: 2,
                                      groupValue: id.value,
                                      onChanged: (val) {
                                        // setState(() {
                                        // radioButtonItem = 'TWO';
                                        id.value = 2;
                                        // });
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Month',
                                    style: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
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
                                      groupValue: id2.value,
                                      onChanged: (val) {
                                        // setState(() {
                                        // radioButtonItem = 'ONE';
                                        id2.value = 1;
                                        // });
                                      },
                                    ),
                                  ),
                                  Text(
                                    'EMI in Arrears',
                                    style: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                              (states) => const Color(0xFF12356E)),
                                      activeColor: const Color(0xFF12356E),
                                      value: 2,
                                      groupValue: id2.value,
                                      onChanged: (val) {
                                        // setState(() {
                                        // radioButtonItem = 'TWO';
                                        id2.value = 2;
                                        // });
                                      },
                                    ),
                                  ),
                                  Text(
                                    'EMI in Advance',
                                    style: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              // ElevatedButton(
                              //   onPressed: () {
                              //     if (amount.value.text.isEmpty ||
                              //         rate.value.text.isEmpty ||
                              //         fees.value.text.isEmpty ||
                              //         year.value.text.isEmpty) {
                              //     } else {
                              //       Get.to(() => const CalculationScreen(), arguments: [
                              //         amount.value,
                              //         rate.value,
                              //         fees.value,
                              //         year.value,
                              //         id.value,
                              //         id2.value
                              //       ]);
                              //     }
                              //   },
                              //   child: const Text("--->"),
                              // ),
                            ],
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Transform.scale(
                        //       scale: 1.3,
                        //       child: Radio(
                        //         fillColor: MaterialStateColor.resolveWith(
                        //             (states) => const Color(0xFF12356E)),
                        //         activeColor: const Color(0xFF12356E),
                        //         value: 1,
                        //         groupValue: id.value,
                        //         onChanged: (val) {
                        //           switchValue = true;
                        //           setState(() {
                        //             // int data = int.parse(tenureController.text);
                        //             // tenure = data;
                        //             // radioButtonItem = 'ONE';
                        //             if (switchValue) {
                        //               tenureType = tenureTypes[1];
                        //             } else {
                        //               tenureType = tenureTypes[0];
                        //             }
                        //             id = 1;
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //     Text(
                        //       'Years',
                        //       style: GoogleFonts.ibmPlexSansThaiLooped(
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: ScreenSize.fSize_17(),
                        //       ),
                        //     ),
                        //     Transform.scale(
                        //       scale: 1.3,
                        //       child: Radio(
                        //         fillColor: MaterialStateColor.resolveWith(
                        //             (states) => const Color(0xFF12356E)),
                        //         activeColor: const Color(0xFF12356E),
                        //         value: 2,
                        //         groupValue: id,
                        //         onChanged: (val) {
                        //           switchValue = true;
                        //           setState(() {
                        //             // int data =
                        //             //     int.parse(tenureController.text) * 12;
                        //             // month = data;
                        //             // radioButtonItem = 'TWO';
                        //             if (switchValue == true) {
                        //               tenureType = tenureTypes[0];
                        //             } else {
                        //               tenureType = tenureTypes[1];
                        //             }
                        //             id = 2;
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //     Text(
                        //       'Months',
                        //       style: GoogleFonts.ibmPlexSansThaiLooped(
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: ScreenSize.fSize_17(),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Transform.scale(
                        //       scale: 1.3,
                        //       child: Radio(
                        //         fillColor: MaterialStateColor.resolveWith(
                        //             (states) => const Color(0xFF12356E)),
                        //         activeColor: const Color(0xFF12356E),
                        //         value: 1,
                        //         groupValue: id2,
                        //         onChanged: (val) {
                        //           setState(() {
                        //             // radioButtonItem = 'ONE';
                        //             id2 = 1;
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //     Text(
                        //       'EMI in Arrears',
                        //       style: GoogleFonts.ibmPlexSansThaiLooped(
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: ScreenSize.fSize_17(),
                        //       ),
                        //     ),
                        //     Transform.scale(
                        //       scale: 1.3,
                        //       child: Radio(
                        //         fillColor: MaterialStateColor.resolveWith(
                        //             (states) => const Color(0xFF12356E)),
                        //         activeColor: const Color(0xFF12356E),
                        //         value: 2,
                        //         groupValue: id2,
                        //         onChanged: (val) {
                        //           setState(() {
                        //             // radioButtonItem = 'TWO';
                        //             id2 = 2;
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //     Text(
                        //       'EMI in Advance',
                        //       style: GoogleFonts.ibmPlexSansThaiLooped(
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: ScreenSize.fSize_17(),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        emiadvancebutton(context, "EMI in Advance Calculator",
                            () {
                          if (principalController.text.isEmpty ||
                              rateController.text.isEmpty ||
                              feesController.text.isEmpty ||
                              tenureController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please fill in the blank",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            Get.to(() => const EMIAdvanceResultScreen(),
                                arguments: [
                                  principalController.text,
                                  rateController.text,
                                  feesController.text,
                                  tenureController.text,
                                  tenureType,
                                  tenureTypes,

                                  switchValue,
                                  id.value,
                                  id2.value,
                                ]);
                          }
                        }),
                        SizedBox(height: ScreenSize.fSize_70()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // banner.getBN()
        ],
      ),
    );
  }
}
