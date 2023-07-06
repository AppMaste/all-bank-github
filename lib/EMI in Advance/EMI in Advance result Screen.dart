import 'dart:math';

import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class EMIAdvanceResultScreen extends StatefulWidget {
  const EMIAdvanceResultScreen({Key? key}) : super(key: key);

  @override
  State<EMIAdvanceResultScreen> createState() => _EMIAdvanceResultScreenState();
}

class _EMIAdvanceResultScreenState extends State<EMIAdvanceResultScreen> {
  var id = 1.obs;
  var id2 = 1.obs;

  var emidata = Get.arguments;

  var Result = "0".obs;
  var Totalrate = "0".obs;
  var TotalMonth = "0".obs;
  var TotalPayment = "0".obs;

  var load = false.obs;

  List tenureTypes = ['Month', 'Year'].obs;
  var tenureType = "Year".obs;
  var switchValue = false.obs;
  var value = false.obs;

  var principalController = TextEditingController().obs;
  var rateController = TextEditingController().obs;
  var feesController = TextEditingController().obs;
  var tenureController = TextEditingController().obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    principalController.value.text = emidata[0];
    rateController.value.text = emidata[1];
    feesController.value.text = emidata[2];
    tenureController.value.text = emidata[3];
    tenureType.value = emidata[4];
    tenureTypes = [emidata[4], emidata[4]];
    switchValue.value = emidata[6];
    id.value = emidata[7];
    id2.value = emidata[8];
  }

  @override
  Widget build(BuildContext context) {
    // print("asfhuvasgfhasf $id");
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/EMIAdvanceResultScreen");
        return Future(() => false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                Share.share(
                    "Principal Amount:-${principalController.value.text}\n\nInterest Rate:-${rateController.value.text}\n\nFeesView:-${feesController.value.text}\n\nLoan Tenure Year:-${tenureController.value.text}\n\nTotal Interest Payable:- ${Totalrate.value}\n\nTotal Payment:- ${TotalPayment.value}\n\nTotal Principal Payble:- ${principalController.value.text}\n\nEMI:- ${Result.value}");
              },
              child: Padding(
                padding: EdgeInsets.only(right: ScreenSize.fSize_10()),
                child: Image(
                  image: const AssetImage("assets/icons/share-icon.png"),
                  width: ScreenSize.fSize_25(),
                ),
              ),
            ),
          ],
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_rounded,
                color: const Color(0xFF12356E), size: ScreenSize.fSize_30()),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Obx(
                () => Column(
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
                            emiadvance(
                              context,
                              principalController.value,
                              "₹",
                            ),
                            SizedBox(height: ScreenSize.fSize_20()),
                            Text(
                              "Interest Rate : Max 50%",
                              style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: ScreenSize.fSize_10()),
                            emiadvance(
                              context,
                              rateController.value,
                              "% ",
                            ),
                            SizedBox(height: ScreenSize.fSize_20()),
                            Text(
                              "FeesView",
                              style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: ScreenSize.fSize_10()),
                            emiadvance(
                              context,
                              feesController.value,
                              "₹",
                            ),
                            SizedBox(height: ScreenSize.fSize_20()),
                            Text(
                              "Loan Tenure Year",
                              style: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: ScreenSize.fSize_10()),
                            emiadvance(
                              context,
                              tenureController.value,
                              tenureType.value,
                            ),
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
                                      // setState(() {
                                      // radioButtonItem = 'ONE';
                                      // if (value.value) {
                                      //   tenureType.value = tenureTypes[1];
                                      // } else {
                                      //   tenureType.value = tenureTypes[0];
                                      // }
                                      id.value = 1;
                                      // });
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
                                    groupValue: id.value,
                                    onChanged: (val) {
                                      // setState(() {
                                      // radioButtonItem = 'TWO';
                                      // if (value.value == true) {
                                      //   tenureType.value = tenureTypes[0];
                                      // } else {
                                      //   tenureType.value = tenureTypes[1];
                                      // }
                                      id.value = 2;
                                      // });
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
                                    fontSize: ScreenSize.fSize_17(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: ScreenSize.fSize_20()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (principalController
                                            .value.text.isEmpty ||
                                        rateController.value.text.isEmpty ||
                                        feesController.value.text.isEmpty ||
                                        tenureController.value.text.isEmpty) {
                                      fluttertost();
                                    } else {
                                      load.value = true;
                                      emiCalculation();
                                    }
                                  },
                                  child: Container(
                                    height: ScreenSize.fSize_70(),
                                    width: ScreenSize.horizontalBlockSize! * 55,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF12356E),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                ScreenSize.fSize_10()))),
                                    child: Center(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "EMI in Advance\nCalculator",
                                        style:
                                            GoogleFonts.ibmPlexSansThaiLooped(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    principalController.value.clear();
                                    rateController.value.clear();
                                    feesController.value.clear();
                                    tenureController.value.clear();
                                    load.value = false;
                                  },
                                  child: Container(
                                    height: ScreenSize.fSize_50(),
                                    width: ScreenSize.horizontalBlockSize! * 38,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 5,
                                            offset: Offset(0, 3))
                                      ],
                                      color: const Color(0xFFC7DBFF),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          ScreenSize.fSize_10(),
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "Reset",
                                        style:
                                            GoogleFonts.ibmPlexSansThaiLooped(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: ScreenSize.fSize_20()),
                            emiAdvanceCalculation2(
                              context,
                              "Total Interest Payable",
                              "Total Payment",
                              "Total Principal Payble",
                              "EMI",
                              load.value == true ? Totalrate.value : "00",
                              load.value == true ? TotalPayment.value : "00",
                              load.value == true
                                  ? principalController.value.text
                                  : "00",
                              load.value == true ? Result.value : "00",
                            ),
                            SizedBox(height: ScreenSize.fSize_70()),
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

  emiCalculation() {
    int Principal = int.parse(principalController.value.text);
    int Rate = int.parse(rateController.value.text);
    int Year = int.parse(tenureController.value.text);
    // int Month = int.parse(Aloanmonth.text);

    double A = 0.0;
    double B = 0.0;
    int P = Principal;
    double r = Rate / 12 / 100;
    int n = Year * 12;
    int n1 = Year;
    print("N valueee:  $n");

    id.value == 1
        ? A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1))
        : A = (P * r * pow((1 + r), n1) / (pow((1 + r), n1) - 1));
    var ee = Principal - A;
    id.value == 1
        ? B = (ee * r * pow((1 + r), n - 1) / (pow((1 + r), n - 1) - 1))
        : B = (ee * r * pow((1 + r), n1 - 1) / (pow((1 + r), n1 - 1) - 1));

    print("AAAA  $A");
    print("PPPP  $P");
    print("rrrr  $r");
    print("nnnn  $n");

    // Result.value = A.toStringAsFixed(0);
    id2.value == 1
        ? Result.value = A.toStringAsFixed(0)
        : Result.value = B.toStringAsFixed(0);

    // setState(() {});
    // double FinalAmount = Principal + (Principal * Term * Rate) / 100;
    // double loanamount = FinalAmount / Term * 12;
    int totalrate = id.value == 1
        ? int.parse(Result.value) * n - Principal
        : int.parse(Result.value) * n1 - Principal;
    print("rateee:  $totalrate");

    int totalpayment = id.value == 1
        ? int.parse(Result.value) * n
        : int.parse(Result.value) * n1;
    print("payment:  $totalpayment");

    // TotalMonth.value = n.toStringAsFixed(0);
    id.value == 1
        ? TotalMonth.value = Year.toString()
        : TotalMonth.value = n.toStringAsFixed(0);

    Totalrate.value = totalrate.toStringAsFixed(0);

    TotalPayment.value = totalpayment.toStringAsFixed(0);
    print("loanamount ${Result.value}");
    return Result.value;
  }
}
