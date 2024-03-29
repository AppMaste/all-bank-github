import 'dart:math';

import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:math' as math;
// import 'package:syncfusion_flutter_charts/charts.dart';

import '../ScreenSize.dart';
import 'dart:ui' as ui;

class LumpsumCalculationResultScreen extends StatefulWidget {
  LumpsumCalculationResultScreen({Key? key}) : super(key: key);

  @override
  State<LumpsumCalculationResultScreen> createState() =>
      _LumpsumCalculationResultScreenState();
}

class _LumpsumCalculationResultScreenState
    extends State<LumpsumCalculationResultScreen> {
  var amountController = TextEditingController().obs;
  var tenureController = TextEditingController().obs;
  var rateController = TextEditingController().obs;

  var data = Get.arguments;
  static GlobalKey sskey = GlobalKey();
  Uint8List? imageData;

  var total = 0.0.obs;
  var earning = 0.0.obs;
  var load = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController.value = data[0];
    tenureController.value = data[1];
    rateController.value = data[2];
  }

  @override
  Widget build(BuildContext context) {
    var controllerValue = int.parse(amountController.value.text);
    // var totalValue = double.parse(total.value.toStringAsFixed(0).toString());
    var aa = double.parse(amountController.value.text);
    final dataMap = <String, double>{
      "": load == true ? total.value : 10.0,
      " ": load == true ? aa : 0.0,
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
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/LumpsumCalculationResultScreen");
        return Future(() => false);
      },
      child: RepaintBoundary(
        key: sskey,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appbarr,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Obx(
                  () => Column(
                    children: [
                      sameRow(context, "Lumpsum Calculate"),
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
                                "Investment Amount",
                                style: GoogleFonts.ibmPlexSansThaiLooped(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: ScreenSize.fSize_10()),
                              emiadvance(
                                context,
                                amountController.value,
                                "₹",
                              ),
                              SizedBox(height: ScreenSize.fSize_20()),
                              Text(
                                "Tenure in",
                                style: GoogleFonts.ibmPlexSansThaiLooped(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              emiadvance(
                                context,
                                tenureController.value,
                                "Year",
                              ),
                              SizedBox(height: ScreenSize.fSize_20()),
                              Text(
                                "Rate of Return (%)",
                                style: GoogleFonts.ibmPlexSansThaiLooped(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              emiadvance(
                                context,
                                rateController.value,
                                "%",
                              ),
                              SizedBox(height: ScreenSize.fSize_20()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  compareLoanContainer(
                                      context, "Lumpsum Calculate", () {
                                    if (amountController.value.text.isEmpty ||
                                        tenureController.value.text.isEmpty ||
                                        rateController.value.text.isEmpty) {
                                      fluttertost();
                                    } else {
                                      setState(() {});
                                      load.value = true;
                                      calculation();
                                    }
                                  }),
                                  comparereset(context, "Reset", () {
                                    amountController.value.clear();
                                    tenureController.value.clear();
                                    rateController.value.clear();
                                    load.value = false;
                                  }),
                                ],
                              ),
                              SizedBox(height: ScreenSize.fSize_30()),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xFF12356E),
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
                                              SizedBox(
                                                  height: ScreenSize.fSize_10()),
                                              Text(
                                                "Principal Amount",
                                                style: GoogleFonts
                                                    .ibmPlexSansThaiLooped(
                                                  fontSize: ScreenSize.fSize_15(),
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color(0xFF768AAB),
                                                ),
                                              ),
                                              Text(
                                                textAlign: TextAlign.center,
                                                load.value == true
                                                    ? NumberFormat.currency(
                                                            name: '',
                                                            decimalDigits: 0)
                                                        .format(controllerValue)
                                                    : "00",
                                                style: GoogleFonts
                                                    .ibmPlexSansThaiLooped(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
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
                                              SizedBox(
                                                  height: ScreenSize.fSize_10()),
                                              Text(
                                                "Earning on Investment",
                                                style: GoogleFonts
                                                    .ibmPlexSansThaiLooped(
                                                  fontSize: ScreenSize.fSize_15(),
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color(0xFF768AAB),
                                                ),
                                              ),
                                              Text(
                                                load.value == true
                                                    ? NumberFormat.currency(
                                                            name: '',
                                                            decimalDigits: 0)
                                                        .format(earning.value)
                                                    : "00",
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
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Divider(
                                        color: Color(0xFF768AAB),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_10()),
                                        Text(
                                          "Accumulated Wealth",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          load.value == true
                                              ? NumberFormat.currency(
                                                      name: '', decimalDigits: 0)
                                                  .format(total.value)
                                              : "00",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
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
                              chart,
                              SizedBox(height: ScreenSize.fSize_30()),
                              GestureDetector(
                                onTap: () async {
                                  RenderRepaintBoundary boundary =
                                      sskey.currentContext!.findRenderObject()
                                          as RenderRepaintBoundary;
                                  ui.Image image =
                                      await boundary.toImage(pixelRatio: 3.0);
                                  ByteData? byte = await image.toByteData(
                                      format: ui.ImageByteFormat.png);

                                  imageData = byte!.buffer.asUint8List();
                                  _onShare(context);
                                  // Share.share(imageData!.toString());
                                },
                                child: Center(
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
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          )),
                                    ),
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
              ),
              // banner.getBN()
            ],
          ),
        ),
      ),
    );
  }

  _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(imageData!.toString(),
        // subject: link,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  calculation() {
    int P = int.parse(amountController.value.text);
    int T = int.parse(tenureController.value.text);
    double R = double.parse(rateController.value.text);
    print("Principal: $P");
    print("Tenure: $T");
    print("RateRate: $R");

    total.value =
        double.parse((P * (pow((1 + R / 100), (T)))).toStringAsFixed(0));
    earning.value = total.value - P;
    print("earingearingearingearing: ${earning.value}");
    print("TOTALTOTALTOTALTOTAL: ${total.value}");
  }
}
