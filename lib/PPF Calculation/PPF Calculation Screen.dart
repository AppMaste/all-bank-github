import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';


class PPFCalculationScreen extends StatefulWidget {
  PPFCalculationScreen({Key? key}) : super(key: key);

  @override
  State<PPFCalculationScreen> createState() => _PPFCalculationScreenState();
}

class _PPFCalculationScreenState extends State<PPFCalculationScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  String dropdownvalue = '0';

  var items = [
    '15 Years',
    '20 Years',
    '25 Years',
    '30 Years',
    '35 Years',
    '40 Years',
    '45 Years',
    '50 Years',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/PPFCalculationScreen");
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
                            "Period in Year",
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
                          // ppfCalculation(context, ppfYearController),
                          SizedBox(height: ScreenSize.fSize_30()),
                          emiadvancebutton(context, "PPF Calculator", () {
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
                              tapButton.button(
                                context,
                                "/PPFCalculationResultScreen",
                                [
                                  amountController,
                                  interestController,
                                  dropdownvalue
                                ],
                              );
                              // Get.to(
                              //   () => const PPFCalculationResultScreen(),
                              //   arguments: [
                              //     amountController,
                              //     interestController,
                              //     dropdownvalue
                              //   ],
                              // );
                            }
                          }),
                          SizedBox(height: ScreenSize.fSize_20()),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // banner.getBN()
          ],
        ),
      ),
    );
  }
}
