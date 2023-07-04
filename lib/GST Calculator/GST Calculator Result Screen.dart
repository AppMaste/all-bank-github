import 'dart:developer';

import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../ScreenSize.dart';

class GSTCalculatorResultScreen extends StatefulWidget {
  const GSTCalculatorResultScreen({Key? key}) : super(key: key);

  @override
  State<GSTCalculatorResultScreen> createState() =>
      _GSTCalculatorResultScreenState();
}

class _GSTCalculatorResultScreenState extends State<GSTCalculatorResultScreen> {
  var amountController = TextEditingController(text: "1").obs;
  var rateController = TextEditingController().obs;

  var id = 1.0.obs;
  var getGST = 0.0.obs;
  var getRate = 0.0.obs;
  var gstvalue = 0.0.obs;
  var gstadd;
  var gstremove;
  var cal;
  var rate;
  var cgstrate;
  var cgst;
  var load = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController.value = getvalue[0];
    rateController.value = getvalue[1];
    id.value = getvalue[2];
  }

  var getvalue = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarr,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  sameRow(context, "GST Calculate"),
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
                            "Rate of GST",
                            style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          emiadvance(
                            context,
                            rateController.value,
                            "₹",
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
                                    id.value = 1;
                                    // });
                                  },
                                ),
                              ),
                              Text(
                                'Add GST',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: ScreenSize.fSize_15(),
                                ),
                              ),
                              SizedBox(width: ScreenSize.fSize_40()),
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
                                    id.value = 2;
                                    // });
                                  },
                                ),
                              ),
                              Text(
                                'Remove GST',
                                style: TextStyle(
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
                              compareLoanContainer(context, "GST Calculate",
                                  () {
                                if (amountController.value.text.isEmpty ||
                                    rateController.value.text.isEmpty) {
                                  fluttertost();
                                } else {
                                  id.value == 1
                                      ? load.value = false
                                      : load.value = true;
                                  calculation();
                                }
                              }),
                              comparereset(context, "Reset", () {
                                amountController.value.clear();
                                rateController.value.clear();
                                id.value = 1;
                              }),
                            ],
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          load.value == false
                              ? GSTCalculationContainer(
                                  context,
                                  amountController.value.text,
                                  getRate.toStringAsFixed(2),
                                  getGST.toStringAsFixed(2),
                                  cgstrate.toString(),
                                  cgst.toString())
                              : GSTCalculationContainer(
                                  context,
                                  NumberFormat.simpleCurrency(name: '')
                                      .format(cal),
                                  NumberFormat.simpleCurrency(name: '')
                                      .format(rate),
                                  getGST.toStringAsFixed(0),
                                  cgstrate.toString(),
                                  cgst.toString()),
                          SizedBox(height: ScreenSize.fSize_20()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenSize.fSize_60())
                ],
              ),
            ),
          ),
          banner.getBN()
        ],
      ),
    );
  }

  calculation() {
    int Amount = int.parse(amountController.value.text);
    double Rate = double.parse(rateController.value.text);

    getRate.value = Amount * Rate / 100;
    getGST.value = id.value == 1
        ? Amount + (Amount * (Rate / 100))
        : double.parse(Amount.toString());
    gstvalue.value = getRate / 2;
    gstadd = ((Amount * Rate) / 100);
    gstremove = (Amount - (Amount * (100 / (100 + Rate))));
    rate = id.value == 1 ? gstadd : gstremove;

    cal = id.value == 1 ? getGST : (Amount - rate);
    cgstrate = Rate / 2;
    cgst = getRate / 2;

    log("rate:------------------- $rate");
    log("CGST Rate:------------------- $cgstrate");
    log("CGST:------------------- $cgst");
    log("calculation:------------------- $cal");
    log("GST Value:------------------- $getGST");
    log("Rate Value:------------------- $getRate");
    log("Gst Value:------------------- $gstvalue\n");
  }
}
