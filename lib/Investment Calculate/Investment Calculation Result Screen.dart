import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScreenSize.dart';

class InvestmentResultScreen extends StatefulWidget {
  const InvestmentResultScreen({Key? key}) : super(key: key);

  @override
  State<InvestmentResultScreen> createState() => _InvestmentResultScreenState();
}

class _InvestmentResultScreenState extends State<InvestmentResultScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();

  var data = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = data[0];
    rateController = data[1];
    yearController = data[2];
    monthController = data[3];
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
                sameRow(context, "Investment Calculate"),
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
                          "SIP Amount",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: ScreenSize.fSize_10()),
                        emiadvance(context, amountController, "₹",
                            ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Rate of Return (%)",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(
                            context, rateController, "%", ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Investment Year",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, yearController, "Year",
                            ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "Investment Month",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        emiadvance(context, monthController, "Month",
                            ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Text(
                          "*Select any one option year or month",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: ScreenSize.fSize_20()),
                        SizedBox(height: ScreenSize.fSize_20()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            compareLoanContainer(
                                context, "Investment Calculate", () {
                              if (amountController.text.isEmpty ||
                                  rateController.text.isEmpty ||
                                  yearController.text.isEmpty ||
                                  monthController.text.isEmpty) {
                                fluttertost();
                              } else {
                                calculation();
                              }
                            }),
                            comparereset(context, "Reset", () {
                              amountController.clear();
                              rateController.clear();
                              yearController.clear();
                              monthController.clear();
                            }),
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
                                          "Investment",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          textAlign: TextAlign.center,
                                          "60000.00",
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
                                          "Maturity",
                                          style:
                                              GoogleFonts.ibmPlexSansThaiLooped(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF768AAB),
                                          ),
                                        ),
                                        Text(
                                          "1.0344572E9",
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

  calculation() {}
}
