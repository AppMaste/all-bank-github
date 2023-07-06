
import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';

class RDCalculationResultScreen extends StatefulWidget {
  const RDCalculationResultScreen({Key? key}) : super(key: key);

  @override
  State<RDCalculationResultScreen> createState() =>
      _RDCalculationResultScreenState();
}

class _RDCalculationResultScreenState extends State<RDCalculationResultScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController periodController = TextEditingController();

  var investment;
  var total;
  var total2;

  bool load = false;

  var controllerData = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = controllerData[0];
    rateController = controllerData[1];
    periodController = controllerData[2];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/RDCalculationResultScreen");
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
                  sameRow(context, "RD Calculation"),
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
                            "Monthly Installment Amount",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          emiadvance(context, amountController, "₹",),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Text(
                            "Interest Rate",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          emiadvance(context, rateController, "%",),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Text(
                            "Period in Month",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          emiadvance(context, periodController, "Month",),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              compareLoanContainer(context, "RD Calculate", () {
                                if (amountController.text.isEmpty ||
                                    rateController.text.isEmpty ||
                                    periodController.text.isEmpty) {
                                  fluttertost();
                                } else {
                                  setState(() {
                                    load = true;
                                    rdCalculation();
                                  });
                                }
                              }),
                              comparereset(context, "Reset", () {
                                setState(() {});
                                load = false;
                                amountController.clear();
                                rateController.clear();
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
                                SizedBox(height: ScreenSize.fSize_10()),
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
                                            "Interest = $total",
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
                                            textAlign: TextAlign.center,
                                            "Maturity Amount =\n$total2",
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
      ),
    );
  }

  rdCalculation() {
    int Principal = int.parse(amountController.text);
    int Rate = int.parse(rateController.text);
    int Tenure = int.parse(periodController.text);
    // var N = int.parse(rateController.text);

    var TOTAL = Principal * Tenure * (1 + Tenure) * Rate / 2400;
    var data = Principal * Tenure;
    var TOTAL2 = Principal * Tenure + TOTAL;

    total = TOTAL.toStringAsFixed(2);
    total2 = TOTAL2;
    print("total:----------- $total");
    print("dataaaaaa:----------- $data");
    print("total22:----------- $total2\n\n");
  }
}
