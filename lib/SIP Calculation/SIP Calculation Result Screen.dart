import 'dart:math';

import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
import 'package:pie_chart/pie_chart.dart';

// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';


class SIPCalculationResultScreen extends StatefulWidget {
  SIPCalculationResultScreen({Key? key}) : super(key: key);

  @override
  State<SIPCalculationResultScreen> createState() =>
      _SIPCalculationResultScreenState();
}

class _SIPCalculationResultScreenState
    extends State<SIPCalculationResultScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = getdata[0];
    rateController = getdata[1];
    yearController = getdata[2];
  }

  var getdata = Get.arguments;

  var returnsip = 0.0;
  var investsip = 0.0;
  var load = false;

  @override
  Widget build(BuildContext context) {
    final dataMap = <String, double>{
      "": load == true ? investsip : 10.0,
      " ": load == true ? returnsip : 0.0
    };
    final chart = PieChart(
      legendOptions: const LegendOptions(
        legendPosition: LegendPosition.bottom,
        legendShape: BoxShape.rectangle,
        showLegendsInRow: true,
      ),
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartRadius: math.min(MediaQuery.of(context).size.width / 1.7, 300),
      colorList: colorList,
      emptyColor: Colors.grey,
      // baseChartColor: Colors.transparent,
    );
    return Scaffold(
      appBar: appbarr,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                sameRow(context, "SIP Calculation"),
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
                          "Total Amount Expexcteed",
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
                          "Expexcted Rate Of Return",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(
                          context,
                          rateController,
                          "%",
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Investment Period (Years)",
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
                            compareLoanContainer(context, "SIP Plan Calculate",
                                () {
                              if (amountController.text.isNotEmpty ||
                                  rateController.text.isNotEmpty ||
                                  yearController.text.isNotEmpty) {
                                setState(() {});
                                load = true;
                                cal();
                              } else {
                                fluttertost();
                              }
                            }),
                            comparereset(context, "Reset", () {}),
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
                              SizedBox(height: ScreenSize.fSize_20()),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_10()),
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
                                          textAlign: TextAlign.center,
                                          NumberFormat.simpleCurrency(name: '')
                                              .format(investsip),
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
                                        SizedBox(height: ScreenSize.fSize_10()),
                                        Text(
                                          "You need to make SIP of",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          NumberFormat.simpleCurrency(name: '')
                                              .format(returnsip),
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
                              SizedBox(height: ScreenSize.fSize_20()),
                            ],
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        chart,
                        SizedBox(height: ScreenSize.fSize_30()),
                        Center(
                          child: Container(
                            height: ScreenSize.fSize_50(),
                            width: ScreenSize.horizontalBlockSize! * 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF12356E),
                              borderRadius: BorderRadius.all(
                                Radius.circular(ScreenSize.fSize_10()),
                              ),
                            ),
                            child: Center(
                              child: Text("Share",
                                  style: GoogleFonts.ibmPlexSansThaiLooped(
                                    fontSize: ScreenSize.fSize_15(),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                            ),
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

  cal() {
    int A = int.parse(amountController.text);
    double R = double.parse(rateController.text) / 12 / 100;
    int Y = int.parse(yearController.text) * 12;

    var IA = A * ((pow((1 + R), (Y)) - 1) / R) * (1 + R);
    investsip = double.parse((A * Y).toString());
    returnsip = IA - investsip;
    print("IAIAIAIAIAI $returnsip");
  }
}
