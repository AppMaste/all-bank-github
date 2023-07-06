import 'dart:developer';

import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';

class SimpleCalculationResultScreen extends StatefulWidget {
  const SimpleCalculationResultScreen({Key? key}) : super(key: key);

  @override
  State<SimpleCalculationResultScreen> createState() =>
      _SimpleCalculationResultScreenState();
}

class _SimpleCalculationResultScreenState
    extends State<SimpleCalculationResultScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  bool load = false;

  var getamount;
  var getinvestment;
  var period;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = getvalue[0];
    interestController = getvalue[1];
    yearController = getvalue[2];
  }

  var getvalue = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/SimpleCalculationResultScreen");
        return Future(() => false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appbarr,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  sameRow(context, "Simple Calculation"),
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
                          SizedBox(height: ScreenSize.fSize_20()),
                          compareContainer(
                            context,
                            "PPF Amount",
                            "Interest %",
                            "₹",
                            "%",
                            amountController,
                            interestController,
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Text(
                            "Period in Year",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          emiadvance(
                            context,
                            yearController,
                            "Year",
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              compareLoanContainer(context, "Simple Calculate",
                                  () {
                                if (amountController.text.isEmpty ||
                                    interestController.text.isEmpty ||
                                    yearController.text.isEmpty) {
                                  fluttertost();
                                } else {
                                  calculation();
                                  load = true;
                                  setState(() {});
                                }
                              }),
                              comparereset(context, "Reset", () {
                                amountController.clear();
                                interestController.clear();
                                yearController.clear();
                                load = false;
                                setState(() {});
                              }),
                            ],
                          ),
                          SizedBox(height: ScreenSize.fSize_30()),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(height: ScreenSize.fSize_20()),
                                          Text(
                                            "Investment Amount",
                                            style:
                                                GoogleFonts.ibmPlexSansThaiLooped(
                                              fontSize: ScreenSize.fSize_15(),
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF768AAB),
                                            ),
                                          ),
                                          Text(
                                            load == true
                                                ? getinvestment.toString()
                                                : "0.0",
                                            textAlign: TextAlign.center,
                                            style:
                                                GoogleFonts.ibmPlexSansThaiLooped(
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
                                            "Maturity Amount",
                                            style:
                                                GoogleFonts.ibmPlexSansThaiLooped(
                                              fontSize: ScreenSize.fSize_15(),
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF768AAB),
                                            ),
                                          ),
                                          Text(
                                            load == true
                                                ? "${amountController.text}.0"
                                                : "0.0",
                                            style:
                                                GoogleFonts.ibmPlexSansThaiLooped(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500),
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
                                      load == true ? getamount.toString() : "0.0",
                                      style: GoogleFonts.ibmPlexSansThaiLooped(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(height: ScreenSize.fSize_20())
                              ],
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          viewMoreDetail(context, () {
                            tapButton.button(
                                context, "/SimpleCalculationDetailScreen", [
                              amountController.text,
                              interestController.text,
                              getamount,
                              yearController.text,
                              getinvestment,
                              period,
                            ]);
                            /*  Get.to(
                              () =>  SimpleCalculationDetailScreen(),
                              arguments: [
                                amountController.text,
                                interestController.text,
                                getamount,
                                yearController.text,
                                getinvestment,
                                period,

                              ]
                            );*/
                          }),
                          SizedBox(height: ScreenSize.fSize_20()),
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
      ),
    );
  }

  calculation() {
    int Amount = int.parse(amountController.text);
    int Interest = int.parse(interestController.text);
    int Duration = int.parse(yearController.text);

    getamount = Amount * Interest * Duration / 100;
    getinvestment = Amount + getamount;
    var time = Duration * 12;
    period = time;
    log("Investment:----------------- $getinvestment");
    log("Investment:----------------- $getamount");
    log("Maturity Amount:----------------- $Amount");
  }
}
