import 'dart:math';

import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../ScreenSize.dart';

class LoanPeriodResultScreen extends StatefulWidget {
  const LoanPeriodResultScreen({Key? key}) : super(key: key);

  @override
  State<LoanPeriodResultScreen> createState() => _LoanPeriodResultScreenState();
}

class _LoanPeriodResultScreenState extends State<LoanPeriodResultScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController emiController = TextEditingController();

  var emi;
  var payment;
  var interest;
  var period = 0.0;
  var months;

  bool load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = arg[0];
    interestController = arg[1];
    emiController = arg[2];
  }

  var arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // print("LoanPeriodResultScreenarg $arg");
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/LoanPeriodResultScreen");
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
                  sameRow(context, "Loan Period"),
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
                            "Interest %",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          emiadvance(
                            context,
                            interestController,
                            "%",
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
                          SizedBox(height: ScreenSize.fSize_30()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              compareLoanContainer(
                                  context, "Loan Period Calculate", () {
                                load = true;
                                calculation();
                                setState(() {});
                              }),
                              comparereset(context, "Reset", () {
                                load = false;
                                amountController.clear();
                                interestController.clear();
                                emiController.clear();
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
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ScreenSize.fSize_15()),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                  height:
                                                      ScreenSize.fSize_20()),
                                              Text(
                                                "Monthly EMI",
                                                style: stylee,
                                              ),
                                              Container(
                                                width: ScreenSize
                                                        .horizontalBlockSize! *
                                                    30,
                                                color: Colors.transparent,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  load == true
                                                      ? emiController.text
                                                      : "0.0",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: style2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ScreenSize.fSize_10()),
                                          child: const VerticalDivider(
                                            thickness: 1,
                                            color: Color(0xFF768AAB),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                                height: ScreenSize.fSize_20()),
                                            Text(
                                              "Total Payment",
                                              style: stylee,
                                            ),
                                            Container(
                                              width: ScreenSize
                                                      .horizontalBlockSize! *
                                                  30,
                                              color: Colors.transparent,
                                              alignment: Alignment.center,
                                              child: Text(
                                                load == true
                                                    ? payment.toString()
                                                    : "00",
                                                overflow: TextOverflow.ellipsis,
                                                style: style2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: ScreenSize.fSize_10()),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: ScreenSize.fSize_15(),
                                        right: ScreenSize.fSize_15()),
                                    child: const Divider(
                                      thickness: 1,
                                      color: Color(0xFF768AAB),
                                    ),
                                  ),
                                  SizedBox(height: ScreenSize.fSize_10()),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                                height: ScreenSize.fSize_20()),
                                            Text(
                                              "Total Interest",
                                              style: stylee,
                                            ),
                                            Container(
                                              width: ScreenSize
                                                      .horizontalBlockSize! *
                                                  30,
                                              color: Colors.transparent,
                                              alignment: Alignment.center,
                                              child: Text(
                                                load == true
                                                    ? interest.toString()
                                                    : "00",
                                                overflow: TextOverflow.ellipsis,
                                                style: style2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: ScreenSize.fSize_15()),
                                          child: const VerticalDivider(
                                            thickness: 1,
                                            color: Color(0xFF768AAB),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: ScreenSize.fSize_13()),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                  height:
                                                      ScreenSize.fSize_20()),
                                              Text(
                                                "Period",
                                                style: stylee,
                                              ),
                                              Container(
                                                width: ScreenSize
                                                        .horizontalBlockSize! *
                                                    15,
                                                color: Colors.transparent,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  load == true
                                                      ? period
                                                          .toStringAsFixed(2)
                                                      : "00",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: style2,
                                                ),
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
                            if (load == false) {
                              tost();
                            } else {
                              tapButton.button(
                                context,
                                "/LoanPeriodDetailScreen",
                                [
                                  amountController.text,
                                  interestController.text,
                                  emiController.text,
                                  payment,
                                  interest,
                                  period,
                                  months,
                                ],
                              );
                            }
                            /* Get.to(() => LoanPeriodDetailScreen(), arguments: [
                              amountController.text,
                              interestController.text,
                              emiController.text,
                              payment,
                              interest,
                              period
                            ]);*/
                          }),
                          SizedBox(height: ScreenSize.fSize_70()),
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
    int P = int.parse(amountController.text);
    double R = double.parse(interestController.text) / 12 / 100;
    int E = int.parse(emiController.text);

    int time = (log(E) - log(E - (P * R))) ~/ log(1 + R);
    period = time / 12;
    payment = E * time;
    months = time;
    interest = payment - P;
    // var data = (1 / monthlyrate) *
    //     ((monthlypay / (monthlypay - (amount * monthlyrate))));
    print("period_period $period");
    print("payment_payment $payment");
    print("time_time $time");
  }
}
