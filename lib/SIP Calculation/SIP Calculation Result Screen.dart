import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

import '../Loan Calculator/Loan Calculator Pie Chart Screen.dart';

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

  List<ChartData> chartData = [
    ChartData('David', (500000), const Color(0xFF12356E)),
    ChartData('Steve', (159956), const Color(0xFF7EC1FF)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = getdata[0];
    rateController = getdata[1];
    yearController = getdata[2];
  }

  var getdata = Get.arguments;

  @override
  Widget build(BuildContext context) {
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
                          "₹",
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
                            compareLoanContainer(
                                context, "SIP Plan Calculate", () {}),
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
                                          "159957",
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
                                          "13330",
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
                              SizedBox(height: ScreenSize.fSize_20())
                            ],
                          ),
                        ),
                        // SfCircularChart(
                        //   series: [
                        //     // Render pie chart
                        //     PieSeries<ChartData, String>(
                        //         animationDuration: 1000,
                        //         dataLabelSettings: DataLabelSettings(
                        //           isVisible: true,
                        //           textStyle: GoogleFonts.ibmPlexSansThaiLooped(
                        //             fontWeight: FontWeight.w600,
                        //             color: Colors.white,
                        //             fontSize: 17,
                        //           ),
                        //         ),
                        //         dataSource: chartData,
                        //         pointColorMapper: (ChartData data, _) =>
                        //             data.color,
                        //         xValueMapper: (ChartData data, _) => data.x,
                        //         yValueMapper: (ChartData data, _) => data.y)
                        //   ],
                        // ),
                        Row(
                          children: [
                            SizedBox(width: ScreenSize.fSize_30()),
                            Container(
                              height: ScreenSize.fSize_20(),
                              width: ScreenSize.fSize_20(),
                              decoration: BoxDecoration(
                                color: const Color(0xFF12356E),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenSize.fSize_6()),
                                ),
                              ),
                            ),
                            SizedBox(width: ScreenSize.fSize_20()),
                            Container(
                              height: ScreenSize.fSize_20(),
                              width: ScreenSize.fSize_20(),
                              decoration: BoxDecoration(
                                color: const Color(0xFF7EC1FF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenSize.fSize_6()),
                                ),
                              ),
                            ),
                          ],
                        ),
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
}
