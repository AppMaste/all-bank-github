import 'dart:math';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Loan%20Calculator/Loan%20Calculator%20History.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ScreenSize.dart';
import 'Loan Calculator Detail Screen.dart';

class LoanCalculatorResultScreen extends StatefulWidget {
  const LoanCalculatorResultScreen({Key? key}) : super(key: key);

  @override
  State<LoanCalculatorResultScreen> createState() =>
      _LoanCalculatorResultScreenState();
}

class _LoanCalculatorResultScreenState
    extends State<LoanCalculatorResultScreen> {
  Future<SharedPreferences> pref = SharedPreferences.getInstance();

  TextEditingController emiController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();

  bool load = false;

  var totalloan = 0.0.obs;

  // ignore: prefer_typing_uninitialized_variables
  var totalPayment;

  // ignore: prefer_typing_uninitialized_variables
  var totalinterest;

  // ignore: prefer_typing_uninitialized_variables
  var total;

  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  var Duration;

  var value = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emiController = value[0];
    interestController = value[1];
    yearController = value[2];
    monthController = value[3];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: loanCalculatorBar,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                sameRow(context, "Loan Calculator"),
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
                          "Loan EMI",
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
                        /*            Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            loanCalculatorContainer(
                                context, "Loan Year", "00", "Year"),
                            loanCalculatorContainer(
                                context, "Loan Month", "00", "Month"),
                          ],
                        ),*/
                        SizedBox(height: ScreenSize.fSize_30()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            compareLoanContainer(context, "Loan Calculate", () {
                              if (emiController.value.text.isEmpty ||
                                  interestController.value.text.isEmpty ||
                                  yearController.value.text.isEmpty ||
                                  monthController.value.text.isEmpty) {
                                fluttertost();
                              } else {
                                setState(() {
                                  load = true;
                                  loanCalculation();
                                  addData.add([
                                    totalloan.value,
                                    DateFormat("hh:mm a")
                                        .format(DateTime.now()),
                                    DateFormat("dd/MM/yyyy")
                                        .format(DateTime.now()),
                                    interestController.text,
                                    Duration,
                                  ]);
                                  // print("datedatedatedate $addData");
                                  totalloan.value;
                                });
                              }
                            }),
                            comparereset(context, "Reset", () {}),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_30()),
                        loanCalculator(
                            context,
                            int.parse(emiController.text).toStringAsFixed(2),
                            load == true
                                ? NumberFormat.simpleCurrency(name: '')
                                    .format(totalPayment)
                                : "00",
                            load == true
                                ? NumberFormat.simpleCurrency(name: '')
                                    .format(totalinterest)
                                : "00",
                            load == true
                                ? NumberFormat.simpleCurrency(name: '')
                                    .format(totalloan.value)
                                : "00"),
                        SizedBox(height: ScreenSize.fSize_20()),
                        viewMoreDetail(context, () {
                          Get.to(() => LoanCalculatorDetailScreen(),
                              arguments: [
                                emiController.value.text,
                                totalloan.value.toStringAsFixed(0),
                                interestController.value.text,
                                totalPayment,
                                Duration,
                                yearController.value.text,
                                monthController.value.text
                              ]);
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
    );
  }

  loanCalculation() {
    // ignore: non_constant_identifier_names
    int Emi = int.parse(emiController.text);
    // ignore: non_constant_identifier_names
    double Interest = double.parse(interestController.text) / 1200;
    // ignore: non_constant_identifier_names
    int Year = int.parse(yearController.text) * 12;
    // ignore: non_constant_identifier_names
    int Month = int.parse(monthController.text);
    // ignore: non_constant_identifier_names
    int Period = Year + Month;
    // double P = double.parse(Period.toString()) / 12;

    // print("EMI:--------- $Emi");
    // print("INTEREST:--------- $Interest");
    // print("YEAR:--------- $Year");
    // print("MONTH:--------- $Month");
    // print("PERIOD:--------- $Period");
    // print("IIII:--------- $Interest");
    // print("PPPP:--------- $P");

    totalloan.value =
        (Emi / Interest) * (1 - (1 / ((pow((1 + Interest), (Period))))));

    Duration = Period;
    totalPayment = Emi * Period;
    totalinterest = totalPayment - totalloan.value;
    // var data = totalloan * I * P / 100 + totalloan;
    // totalinterest = (1 / P) * (data / totalloan - 1) * 100;

    // totalPayment = (Emi * Period).toStringAsFixed(0);
    // print("TOTAL-Loan:------------ ${totalloan.value}");
    // print("TOTAL-Interest:------------ $totalinterest");
    // print("TOTAL-Payment:------------ $totalPayment\n");
  }
}
