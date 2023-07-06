import 'dart:math';

import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CompareLoanResultScreen extends StatefulWidget {
  CompareLoanResultScreen({Key? key}) : super(key: key);

  @override
  State<CompareLoanResultScreen> createState() =>
      _CompareLoanResultScreenState();
}

class _CompareLoanResultScreenState extends State<CompareLoanResultScreen> {
  var data = Get.arguments;

  var load = false.obs;

  var Result = "0".obs;
  var Totalrate = "0".obs;
  var TotalMonth = "0".obs;
  var TotalPayment = "0".obs;

  var Result2 = "0".obs;
  var Totalrate2 = "0".obs;
  var TotalMonth2 = "0".obs;
  var TotalPayment2 = "0".obs;

  var deferenceEMI = 0.obs;
  var deferenceRATE = 0.obs;
  var deferenceTOTAL = 0.obs;

  var Aloanamount = TextEditingController().obs;
  var Ainterest = TextEditingController().obs;
  var Aloanyear = TextEditingController().obs;
  var Aloanmonth = TextEditingController().obs;
  var Bloanamount = TextEditingController().obs;
  var Binterest = TextEditingController().obs;
  var Bloanyear = TextEditingController().obs;
  var Bloanmonth = TextEditingController().obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Aloanamount.value.text = data[0];
    Ainterest.value.text = data[1];
    Aloanyear.value.text = data[2];
    Aloanmonth.value.text = data[3];
    Bloanamount.value.text = data[4];
    Binterest.value.text = data[5];
    Bloanyear.value.text = data[6];
    Bloanmonth.value.text = data[7];
  }

  @override
  Widget build(BuildContext context) {
    // print("objecttttt ${data}");
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/CompareLoanResultScreen");
        return Future(() => false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appbarr,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: [
                    sameRow(context, "Compare Loan"),
                    SizedBox(height: ScreenSize.fSize_20()),
                    Container(
                      width: double.maxFinite,
                      decoration: decoration,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: ScreenSize.fSize_20()),
                            Center(
                              child: Text(
                                "Loan A",
                                style: GoogleFonts.ibmPlexSansThaiLooped(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF12356E),
                                    fontSize: ScreenSize.fSize_20()),
                              ),
                            ),
                            SizedBox(height: ScreenSize.fSize_20()),
                            compareContainer(context, "Loan Amount", "Interest %",
                                "₹", "%", Aloanamount.value, Ainterest.value,),
                            compareContainer(context, "Loan Year", "Loan Month",
                                "Year", "Month", Aloanyear.value, Aloanmonth.value),
                            SizedBox(height: ScreenSize.fSize_20()),
                            Center(
                              child: Text(
                                "Loan B",
                                style: GoogleFonts.ibmPlexSansThaiLooped(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF12356E),
                                    fontSize: ScreenSize.fSize_20()),
                              ),
                            ),
                            SizedBox(height: ScreenSize.fSize_20()),
                            compareContainer(context, "Loan Amount", "Interest %",
                                "₹", "%", Bloanamount.value, Binterest.value,),
                            compareContainer(context, "Loan Year", "Loan Month",
                                "Year", "Month", Bloanyear.value, Bloanmonth.value,),
                            SizedBox(height: ScreenSize.fSize_20()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                compareLoanContainer(context, "Compare Loan", () {
                                  if (Aloanamount.value.text.isEmpty ||
                                      Ainterest.value.text.isEmpty ||
                                      Aloanyear.value.text.isEmpty ||
                                      Aloanmonth.value.text.isEmpty ||
                                      Bloanamount.value.text.isEmpty ||
                                      Binterest.value.text.isEmpty ||
                                      Bloanyear.value.text.isEmpty ||
                                      Bloanmonth.value.text.isEmpty) {
                                    fluttertost();
                                  } else {
                                    loan1Calculation();
                                    loan2Calculation();
                                    deference();
                                    load.value = true;
                                  }
                                }),
                                comparereset(context, "Reset", () {
                                  load.value = false;
                                  Aloanamount.value.clear();
                                  Ainterest.value.clear();
                                  Aloanyear.value.clear();
                                  Aloanmonth.value.clear();
                                  Bloanamount.value.clear();
                                  Binterest.value.clear();
                                  Bloanyear.value.clear();
                                  Bloanmonth.value.clear();
                                  load.value = false;
                                }),
                              ],
                            ),
                            SizedBox(height: ScreenSize.fSize_20()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.maxFinite,
                                // height: ScreenSize.horizontalBlockSize! * 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF12356E),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(ScreenSize.fSize_20()),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    SizedBox(height: ScreenSize.fSize_20()),
                                    loan1(context, "Calculate", "Loan 1", "Loan 2",
                                        "Deference"),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: ScreenSize.horizontalBlockSize! * 28),
                                      child: loan1(
                                          context,
                                          "EMI",
                                          load.value == true ? Result.value : "00",
                                          load.value == true ? Result2.value : "00",
                                          "${load.value == true ? deferenceEMI.value : '00'}"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: ScreenSize.horizontalBlockSize! * 50),
                                      child: loan1(
                                          context,
                                          "Interest",
                                          load.value == true ? Totalrate.value : '00',
                                          load.value == true
                                              ? Totalrate2.value
                                              : '00',
                                          "${load.value == true ? deferenceRATE.value : '00'}"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: ScreenSize.horizontalBlockSize! * 73),
                                      child: loan2(
                                          context,
                                          "Total Payable",
                                          load.value == true
                                              ? TotalPayment.value
                                              : '00',
                                          load.value == true
                                              ? TotalPayment2.value
                                              : '00',
                                          "${load.value == true ? deferenceTOTAL.value : '00'}"),
                                    ),
                                    SizedBox(height: ScreenSize.fSize_20()),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenSize.fSize_60()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN()
          ],
        ),
      ),
    );
  }

  loan1Calculation() {
    int Principal = int.parse(Aloanamount.value.text);
    double Rate = double.parse(Ainterest.value.text);
    int Year = int.parse(Aloanyear.value.text);
    int Month = int.parse(Aloanmonth.value.text);

    double A = 0.0;
    int P = Principal;
    double r = Rate / 12 / 100;
    int n = Year * 12 + Month;
    print("N valueee:  $n");

    A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

    print("AAAA  $A");
    print("PPPP  $P");
    print("rrrr  $r");
    print("nnnn  $n");

    Result.value = A.toStringAsFixed(0);

    setState(() {});
    // double FinalAmount = Principal + (Principal * Term * Rate) / 100;
    // double loanamount = FinalAmount / Term * 12;
    int totalrate = int.parse(Result.value) * n - Principal;
    print("rateee:  $totalrate");

    int totalpayment = int.parse(Result.value) * n;
    print("payment:  $totalpayment");

    TotalMonth.value = n.toStringAsFixed(0);

    Totalrate.value = totalrate.toStringAsFixed(0);

    TotalPayment.value = totalpayment.toStringAsFixed(0);
    print("loanamount ${Result}");
    return Result;
  }

  loan2Calculation() {
    int Principal = int.parse(Bloanamount.value.text);
    double Rate = double.parse(Binterest.value.text);
    int Year = int.parse(Bloanyear.value.text);
    int Month = int.parse(Bloanmonth.value.text);

    double A = 0.0;
    int P = Principal;
    double r = Rate / 12 / 100;
    int n = Year * 12 + Month;
    print("N valueee:  $n");

    A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

    print("AAAA  $A");
    print("PPPP  $P");
    print("rrrr  $r");
    print("nnnn  $n");

    Result2.value = A.toStringAsFixed(0);

    setState(() {});
    // double FinalAmount = Principal + (Principal * Term * Rate) / 100;
    // double loanamount = FinalAmount / Term * 12;
    int totalrate = int.parse(Result2.value) * n - Principal;
    print("rateee:  $totalrate");

    int totalpayment = int.parse(Result2.value) * n;
    print("payment:  $totalpayment");

    TotalMonth2.value = n.toStringAsFixed(0);

    Totalrate2.value = totalrate.toStringAsFixed(0);

    TotalPayment2.value = totalpayment.toStringAsFixed(0);
    print("loanamount ${Result2}");
    return Result2;
  }

  deference() {
    setState(() {});
    deferenceEMI.value = int.parse(Result.value) - int.parse(Result2.value);
    deferenceRATE.value =
        int.parse(Totalrate.value) - int.parse(Totalrate2.value);
    deferenceTOTAL.value =
        int.parse(TotalPayment.value) - int.parse(TotalPayment2.value);
  }
}
