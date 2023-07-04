import 'dart:math';

import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/PPF%20Calculation/PPF%20Calculation%20Detail%20Screen.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PPFCalculationResultScreen extends StatefulWidget {
  const PPFCalculationResultScreen({Key? key}) : super(key: key);

  @override
  State<PPFCalculationResultScreen> createState() =>
      _PPFCalculationResultScreenState();
}

class _PPFCalculationResultScreenState
    extends State<PPFCalculationResultScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController interestController = TextEditingController();

  var amount;
  var amount2;
  var investment;
  var total = 0.0;

  bool load = false;

  String dropdownvalue = '15';

  List<String> items = [
    '15 Years',
    '20 Years',
    '25 Years',
    '30 Years',
    '35 Years',
    '40 Years',
    '45 Years',
    '50 Years',
  ];
  var getData = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = getData[0];
    interestController = getData[1];
    dropdownvalue = getData[2];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarr,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                sameRow(context, "PPF Calculation"),
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
                        compareContainer(
                          context,
                          "PPF Amount",
                          "Interest %",
                          "₹",
                          "%",
                          amountController,
                          interestController,
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Period of Deposite",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        Container(
                          height: ScreenSize.fSize_45(),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              )
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(ScreenSize.fSize_11()),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: ScreenSize.fSize_200(),
                                  color: Colors.transparent,
                                  child: Text(
                                    "$dropdownvalue Years",
                                    style: GoogleFonts.ibmPlexSansThaiLooped(
                                        fontSize: ScreenSize.fSize_14(),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(
                                  child: DropdownButton(
                                      isExpanded: true,
                                      isDense: false,
                                      underline: Container(),
                                      // underline: Image.asset("assets/icons/down-arrow.png",height: ScreenSize.fSize_10()),
                                      icon: Icon(Icons.arrow_drop_down,
                                          size: ScreenSize.fSize_40(),
                                          color: const Color(0xFF768AAB)),
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue =
                                              newValue!.replaceAll("Years", "");
                                        });
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                        // emiadvance(context, dropdownvalue, ""),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            compareLoanContainer(context, "PPF Calculator", () {
                              if (amountController.text.isEmpty ||
                                  interestController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please Fill the blank",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                setState(() {
                                  calculation();
                                  load = true;
                                });
                              }
                            }),
                            comparereset(context, "Reset", () {
                              amountController.clear();
                              interestController.clear();
                              dropdownvalue = '0';
                              setState(() {});
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
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
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
                                          load == true
                                              ? NumberFormat.simpleCurrency(
                                                      name: '')
                                                  .format(investment)
                                              : "0.0",
                                          // "${investment}",
                                          textAlign: TextAlign.center,
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
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        Text(
                                          "Maturity Amount",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          load == true
                                              ? NumberFormat.simpleCurrency(
                                                      name: '')
                                                  .format(amount2)
                                              : "0.0",
                                          // "$amount2",
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
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
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
                                    load == true
                                        ? NumberFormat.simpleCurrency(name: '')
                                            .format(total)
                                        : "0.0",
                                    // total.toString(),
                                    style: GoogleFonts.ibmPlexSansThaiLooped(
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
                        viewMoreDetail(context, () {
                          Get.to(
                            () => PPFCalculationDetailScreen(),
                            arguments: [
                              amountController.text,
                              interestController.text,
                              total.toStringAsFixed(0),
                              amount2,
                              dropdownvalue.toString()
                            ]
                          );
                        }),
                        SizedBox(height: ScreenSize.fSize_20()),
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

  calculation() {
    int P = int.parse(amountController.text);
    var R = double.parse(interestController.text) / 100;
    int T = int.parse(dropdownvalue);

    print(
        "Principal:======== ${NumberFormat.simpleCurrency(name: '').format(P)} ₹");
    print("Interest:======== $R %");
    print("Tenure:======== $T Years\n\n");

    // log("Value:-------- $T");

    // amount = P * ((1 + R) * T - 1 * R) / R / 100;
    investment = P * ((pow((1 + R), (T)) - 1) / R);
    // amount = P * ((1 + R) * T - 1 * R);
    amount2 = P * T;
    total = investment + amount2;
    // print(
    //     "amount:-------- ${NumberFormat.simpleCurrency(name: '').format(amount)} ₹");
    print(
        "investment:-------- ${(NumberFormat.simpleCurrency(name: '').format(investment))} ₹");
    print(
        "total:-------- ${(NumberFormat.simpleCurrency(name: '').format(total))} ₹");
    print(
        "Maturity Amount:-------- ${(NumberFormat.simpleCurrency(name: '').format(amount2))} ₹\n\n");
  }
}
