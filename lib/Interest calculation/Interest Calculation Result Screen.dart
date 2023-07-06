import 'dart:developer';

import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Loan Calculator/Loan Calculator History.dart';

class InterestCalculationResultScreen extends StatefulWidget {
  const InterestCalculationResultScreen({Key? key}) : super(key: key);

  @override
  State<InterestCalculationResultScreen> createState() =>
      _InterestCalculationResultScreenState();
}

class _InterestCalculationResultScreenState
    extends State<InterestCalculationResultScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController emiController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();

  var monthlyemi;
  var totalpayment;
  var totalinterest;
  var interest = 0.0;
  var Duration;

  var arg = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = arg[0];
    emiController = arg[1];
    yearController = arg[2];
    monthController = arg[3];
    print("ararararar $arg");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/InterestCalculationResultScreen");
        return Future(() => false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: loanCalculatorBar,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  sameRow(context, "Interest Rate"),
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
                            "Loan Amount",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          emiadvance(
                            context,
                            amountController,
                            "₹",
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Text(
                            "EMI",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          emiadvance(
                            context,
                            emiController,
                            "₹",
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          SizedBox(height: ScreenSize.fSize_10()),
                          compareContainer(
                            context,
                            "Loan Year",
                            "Loan Month",
                            "Year",
                            "Month",
                            yearController,
                            monthController,
                          ),
                          SizedBox(height: ScreenSize.fSize_30()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              compareLoanContainer(
                                  context, "Interest Calculate", () {
                                var aaa =
                                    int.parse(amountController.value.text);
                                setState(() {});
                                calculation();
                                addData.add([
                                  aaa,
                                  DateFormat("hh:mm a").format(DateTime.now()),
                                  DateFormat("dd/MM/yyyy")
                                      .format(DateTime.now()),
                                  interest.toStringAsFixed(2),
                                  Duration,
                                  emiController.value.text,
                                  amountController.value.text,
                                  yearController.value.text,
                                  monthController.value.text,
                                  totalinterest,
                                  totalpayment,
                                  interest,
                                  Duration
                                ]);
                              }),
                              comparereset(context, "Reset", () {
                                emiController.clear();
                                amountController.clear();
                                yearController.clear();
                                monthController.clear();
                              }),
                            ],
                          ),
                          SizedBox(height: ScreenSize.fSize_30()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF12356E),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      ScreenSize.fSize_15(),
                                    ),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        offset: Offset(0, 3))
                                  ]),
                              child: Column(
                                children: [
                                  SizedBox(height: ScreenSize.fSize_15()),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ScreenSize.fSize_20()),
                                          child: Container(
                                            height: ScreenSize.fSize_70(),
                                            color: Colors.transparent,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                    height:
                                                        ScreenSize.fSize_20()),
                                                Text(
                                                  "Monthly EMI",
                                                  style: GoogleFonts
                                                      .ibmPlexSansThaiLooped(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        const Color(0xFF768AAB),
                                                  ),
                                                ),
                                                Text(
                                                  emiController.text,
                                                  style: GoogleFonts
                                                      .ibmPlexSansThaiLooped(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: ScreenSize.fSize_20()),
                                              child: const VerticalDivider(
                                                thickness: 1,
                                                color: Color(0xFF768AAB),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                                height: ScreenSize.fSize_20()),
                                            Text(
                                              "Total Payment",
                                              style: GoogleFonts
                                                  .ibmPlexSansThaiLooped(
                                                fontSize: ScreenSize.fSize_15(),
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF768AAB),
                                              ),
                                            ),
                                            Text(
                                              totalpayment.toString(),
                                              // NumberFormat.simpleCurrency(name: '')
                                              //     .format(totalpayment),
                                              style: GoogleFonts
                                                  .ibmPlexSansThaiLooped(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: ScreenSize.fSize_10()),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: ScreenSize.fSize_10(),
                                        right: ScreenSize.fSize_10()),
                                    child: const Divider(
                                      thickness: 1,
                                      color: Color(0xFF768AAB),
                                    ),
                                  ),
                                  SizedBox(height: ScreenSize.fSize_10()),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        SizedBox(width: ScreenSize.fSize_20()),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ScreenSize.fSize_15()),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                  height:
                                                      ScreenSize.fSize_10()),
                                              Text(
                                                "Total Interest",
                                                style: GoogleFonts
                                                    .ibmPlexSansThaiLooped(
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFF768AAB),
                                                ),
                                              ),
                                              Text(
                                                totalinterest.toString(),
                                                // NumberFormat.simpleCurrency(name: '')
                                                //     .format(totalinterest),
                                                style: GoogleFonts
                                                    .ibmPlexSansThaiLooped(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            width: ScreenSize
                                                    .horizontalBlockSize! *
                                                8.5),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ScreenSize.fSize_20()),
                                          child: const VerticalDivider(
                                            thickness: 1,
                                            color: Color(0xFF768AAB),
                                          ),
                                        ),
                                        SizedBox(
                                            width: ScreenSize
                                                    .horizontalBlockSize! *
                                                14),
                                        Container(
                                          width: ScreenSize.fSize_70(),
                                          color: Colors.transparent,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                  height:
                                                      ScreenSize.fSize_10()),
                                              Text(
                                                "Interest",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts
                                                    .ibmPlexSansThaiLooped(
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFF768AAB),
                                                ),
                                              ),
                                              Text(
                                                interest.toStringAsFixed(2),
                                                // NumberFormat.simpleCurrency(name: '')
                                                //     .format(interest),
                                                style: GoogleFonts
                                                    .ibmPlexSansThaiLooped(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: ScreenSize.fSize_20()),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          viewMoreDetail(context, () {
                            tapButton.button(
                              context,
                              "/InterestCalculationDetailScreen",
                              [
                                amountController.value.text,
                                emiController.value.text,
                                yearController.value.text,
                                monthController.value.text,
                                totalinterest,
                                totalpayment,
                                interest,
                                Duration
                              ],
                            );
                            /*  Get.to(() => InterestCalculationDetailScreen(),
                                arguments: [
                                  amountController.value.text,
                                  emiController.value.text,
                                  yearController.value.text,
                                  monthController.value.text,
                                  totalinterest,
                                  totalpayment,
                                  interest,
                                  Duration
                                ]);*/
                          }),
                          SizedBox(height: ScreenSize.fSize_70()),
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
      ),
    );
  }

  calculation() {
    int P = int.parse(amountController.text);
    int EMI = int.parse(emiController.text);
    int Y = int.parse(yearController.text);
    int M = int.parse(monthController.text);
    int Period = Y * 12 + M;
    double Year = Period / 12;
    log("Yearrrrr:--------------- $Year");

    monthlyemi = EMI;
    Duration = Period;
    totalpayment = EMI * Period;
    totalinterest = totalpayment - P;
    var Interest = (1 / Year) * ((totalpayment / P) - 1);
    interest = Interest * 100;
    // var Interest2 = interest / P * Year;
    // var Interest3 = Interest2 * 100 * 12;

    log("Monthly EMI:--------------- $monthlyemi");
    log("Total Payment:--------------- ${NumberFormat.simpleCurrency(name: '').format(totalpayment)}");
    log("Total interest:--------------- ${NumberFormat.simpleCurrency(name: '').format(totalinterest)}");
    // log("interest Rate2222:--------------- $Interest2");
    // log("interest Rate3333:--------------- $Interest3");
    log("interest Rate:--------------- $interest\n");
  }
}
