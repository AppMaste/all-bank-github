import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:google_fonts/google_fonts.dart';

class EMICalculatorBarChartScreen extends StatefulWidget {
  const EMICalculatorBarChartScreen({Key? key}) : super(key: key);

  @override
  State<EMICalculatorBarChartScreen> createState() =>
      _EMICalculatorBarChartScreenState();
}

class _EMICalculatorBarChartScreenState
    extends State<EMICalculatorBarChartScreen> {
  var arg = Get.arguments;

  int value = 10;
  int value2 = 1;

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
    // value = 100 - int.parse(arg[1]);
  }

   List<charts.Series<dynamic, String>> seriesList = [];

   List<charts.Series<Sales, String>> _createRandomData() {
     value = 100 - int.parse(arg[1]);
     value2 = int.parse(arg[1]);
    final desktopSalesData = [
      Sales('INTEREST', value2),
    ];
    final desktopSalesData2 = [
      Sales('PRINCIPAL', value),
    ];

    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        labelAccessorFn: (Sales sales, _) =>
        '${sales.year}: ${sales.sales}',
        data: desktopSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.deepOrange.shadeDefault;
        },
      ),
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        labelAccessorFn: (Sales sales, _) =>
        '${sales.year}: ${sales.sales}',
        data: desktopSalesData2,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.blue.shadeDefault.lighter;
        },
      ),
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      barRendererDecorator: (charts.BarLabelDecorator<String>(
        // insideLabelStyleSpec: const charts.TextStyleSpec(fontSize: 12,color: charts.Color),
        labelPosition: charts.BarLabelPosition.inside,
        labelAnchor: charts.BarLabelAnchor.end,
      )),
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
      domainAxis: const charts.OrdinalAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     print("vasdhgascdasvcdfyas $arg");
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/EMICalculatorBarChartScreen");
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
                  sameRow(context, "EMI Details"),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Container(
                    width: double.maxFinite,
                    decoration: decoration,
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.fSize_24()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: ScreenSize.fSize_50(),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(ScreenSize.fSize_10()),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(0, 3))
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(9),
                                  child: Text(
                                    "Details",
                                    style: GoogleFonts.ibmPlexSansThaiLooped(
                                        color: const Color(0xFF768AAB),
                                        fontSize: ScreenSize.fSize_15(),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Pie Chart",
                                    style: GoogleFonts.ibmPlexSansThaiLooped(
                                        color: const Color(0xFF768AAB),
                                        fontSize: ScreenSize.fSize_15(),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: ScreenSize.fSize_120(),
                                      height: ScreenSize.fSize_50(),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF12356E),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  ScreenSize.fSize_10()))),
                                      child: Center(
                                        child: Text(
                                          "Bar Chart",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                                  color: Colors.white,
                                                  fontSize:
                                                      ScreenSize.fSize_15(),
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_40()),
                        Container(
                            height: ScreenSize.horizontalBlockSize! * 80,
                            child: barChart()),
                        // barChart(),
                        SizedBox(height: ScreenSize.fSize_8()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
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
                                SizedBox(height: ScreenSize.fSize_20()),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      textfunction("Loan Amount", "${arg[2]}"),
                                      rowdivider(),
                                      textfunction("Interest", "${arg[1]}"),
                                    ],
                                  ),
                                ),
                                SizedBox(height: ScreenSize.fSize_10()),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenSize.fSize_10(),
                                      right: ScreenSize.fSize_10()),
                                  child:
                                      const Divider(color: Color(0xFF768AAB)),
                                ),
                                SizedBox(height: ScreenSize.fSize_10()),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      textfunction(
                                          "Period (Month)", "${arg[3]}"),
                                      rowdivider(),
                                      textfunction("Monthly EMI", "${arg[0]}"),
                                    ],
                                  ),
                                ),
                                SizedBox(height: ScreenSize.fSize_10()),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenSize.fSize_10(),
                                      right: ScreenSize.fSize_10()),
                                  child:
                                      const Divider(color: Color(0xFF768AAB)),
                                ),
                                SizedBox(height: ScreenSize.fSize_10()),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      textfunction(
                                          "Total Interest", "${arg[6]}"),
                                      rowdivider(),
                                      textfunction(
                                          "Total Payment", "${arg[5]}"),
                                    ],
                                  ),
                                ),
                                SizedBox(height: ScreenSize.fSize_20()),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_70()),
                      ],
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
}

class Sales {
  final String year;
  final int sales;

  Sales(this.year, this.sales);
}
