import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/HomeScreen/HomeScreen.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/AppController.dart';
import '../ScreenSize.dart';
import 'IFSC & MICR Select Bank Screen.dart';
import 'IFSC All Detail.dart';
import 'IFSC Button.dart';

class IFSCBankScreen extends StatefulWidget {
  IFSCBankScreen({Key? key}) : super(key: key);

  @override
  State<IFSCBankScreen> createState() => _IFSCBankScreenState();
}

class _IFSCBankScreenState extends State<IFSCBankScreen> {
  IfscScreenController controller = Get.put(IfscScreenController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.bankName = 'Select Bank'.obs;
    controller.stateName = 'Select State'.obs;
    controller.districtName = 'Select District'.obs;
    controller.branchName = 'Select Branch'.obs;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.to(() => const HomeScreen());
        return Future(() => false);
      },
      child: Scaffold(
        appBar: appbarr,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_6()),
                      Flexible(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "IFSC & MICR Details",
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                              color: const Color(0xFF12356E),
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenSize.fSize_20()),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF1FE),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(ScreenSize.fSize_30()),
                          topLeft: Radius.circular(ScreenSize.fSize_30())),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.fSize_28()),
                        form3(context, "Find IFSC & MICR Code"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                height: ScreenSize.fSize_45(),
                                width: ScreenSize.horizontalBlockSize! * 90,
                                color: Colors.transparent,
                                child: Text(
                                  "Search IFSC & MICR Code using Bank name, State name and Branch name",
                                  style: GoogleFonts.ibmPlexSansThaiLooped(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        fields(
                            width: 100,
                            height: 400,
                            title: 'Bank Name',
                            fieldName: controller.bankName,
                            onTap: () {
                              Get.to(() => const IFSCSelectBankScreenView(),
                                  arguments: 'Select Bank');
                            }),
                        SizedBox(height: ScreenSize.fSize_15()),
                        fields(
                            width: 100,
                            height: 400,
                            title: 'State Name',
                            fieldName: controller.stateName,
                            onTap: () {
                              if (controller.bankName.value == 'Select Bank') {
                                fluttertost();
                                // dialog(title: 'Please Select Above Field...');
                              } else {
                                Get.to(() => const IFSCSelectBankScreenView(),
                                    arguments: 'Select State');
                              }
                            }),
                        SizedBox(height: ScreenSize.fSize_15()),
                        fields(
                            width: 100,
                            height: 400,
                            title: 'District Name',
                            fieldName: controller.districtName,
                            onTap: () {
                              if (controller.bankName.value != 'Select Bank' &&
                                  controller.stateName.value !=
                                      'Select State') {
                                Get.to(() => const IFSCSelectBankScreenView(),
                                    arguments: 'Select District');
                              } else {
                                fluttertost();
                                // dialog(title: 'Please Select Above Field...');
                              }
                            }),
                        SizedBox(height: ScreenSize.fSize_15()),
                        fields(
                            width: 100,
                            height: 400,
                            title: 'Branch Name',
                            fieldName: controller.branchName,
                            onTap: () {
                              if (controller.bankName.value != 'Select Bank' &&
                                  controller.stateName.value !=
                                      'Select State' &&
                                  controller.districtName.value !=
                                      'Select District') {
                                Get.to(() => const IFSCSelectBankScreenView(),
                                    arguments: 'Select Branch');
                              } else {
                                fluttertost();
                                // dialog(title: 'Please Select Above Field...');
                              }
                            }),
                        SizedBox(height: ScreenSize.fSize_20()),
                        ConstantsWidgets.gradientButton(
                            title: 'Search',
                            titleSize: 15.5,
                            height: 28,
                            width: 100,
                            borderRadius: 15.0,
                            onTap: () {
                              if (controller.bankName.value != 'Select Bank' &&
                                  controller.stateName.value !=
                                      'Select State' &&
                                  controller.districtName.value !=
                                      'Select District' &&
                                  controller.branchName.value !=
                                      'Select Branch') {
                                Get.to(() => IFSCAllDetail(), arguments: {
                                  'bank_name': controller.bankName.value,
                                  'state_name': controller.stateName.value,
                                  'district_name':
                                      controller.districtName.value,
                                  'branch_name': controller.branchName.value,
                                  'details': controller.detailMap,
                                });
                              } else {
                                fluttertost();
                                // dialog(title: 'Please Select Above Fields...');
                              }
                            }),
                        SizedBox(height: ScreenSize.fSize_80()),
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

  Widget fields(
      {required double height,
      required double width,
      required String title,
      required RxString fieldName,
      required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.5),
          ),
          const SizedBox(height: 13),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                padding: const EdgeInsets.all(0.0),
                elevation: 1,
                shadowColor: Colors.black),
            child: Ink(
              decoration: const BoxDecoration(
                // gradient: ConstantsColor.buttonGradient,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: ScreenSize.fSize_15()),
                  Container(
                    height: ScreenSize.fSize_50(),
                    alignment: Alignment.center,
                    child: Obx(() => Text(
                          fieldName.value,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xFF768AAB),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Image.asset("assets/icons/arrowright.png"),
                    onPressed: null,
                  ),
                  const SizedBox(width: 10)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

dialog({required String title}) {
  Get.dialog(AlertDialog(
    backgroundColor: Colors.transparent,
    content: Container(
      // height: 13.h,
      width: 80,
      decoration: BoxDecoration(
          color: Colors.black,
          // gradient: ConstantsColor.buttonGradient,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: 25),
          const Divider(color: Colors.white, height: 0, thickness: 1),
          InkWell(
            onTap: () => Get.back(),
            child: Container(
              width: 80,
              height: 26,
              alignment: Alignment.center,
              child: const Text(
                'OK',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    ),
  ));
}
