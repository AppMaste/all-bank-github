import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../Controller/AppController.dart';
import '../ScreenSize.dart';
import 'IFSC & MICR Detail Screen.dart';
import 'IFSC Button.dart';

class IFSCAllDetail extends GetView<IfscScreenController> {
  IFSCAllDetail({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = Get.arguments;


    if (kDebugMode) {
      print('map -> $map');
    }

    return Scaffold(
      appBar: appbarr,
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF1FE),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(ScreenSize.fSize_30()),
                          topLeft: Radius.circular(ScreenSize.fSize_30())),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: ScreenSize.fSize_20()),
                          container(
                              context,
                              "Bank Name",
                              map['bank_name'].toString().toUpperCase(),
                              ScreenSize.fSize_70()),
                          SizedBox(height: ScreenSize.fSize_20()),
                          container(
                              context,
                              "IFSC Code",
                              map['details']['ifsc_code'].toString().toUpperCase(),
                              ScreenSize.fSize_70()),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              container2(context, "District",
                                  map['district_name'].toString()),
                              container2(
                                  context, "State", map['state_name'].toString())
                            ],
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                          container(
                              context,
                              "MICR Code",
                              map['details']['micr_code'].toString().toUpperCase(),
                              ScreenSize.fSize_70()),
                          SizedBox(height: ScreenSize.fSize_20()),
                          container(
                              context,
                              "Branch",
                              map['details']['branch'].toString().toUpperCase(),
                              ScreenSize.fSize_70()),
                          SizedBox(height: ScreenSize.fSize_20()),
                          container(
                              context,
                              "Address",
                              map['details']['address'].toString().toUpperCase(),
                              ScreenSize.horizontalBlockSize! * 35),
                          SizedBox(height: ScreenSize.fSize_20()),
                          ConstantsWidgets.gradientButton(
                              title: 'Share',
                              titleSize: 15.5,
                              height: 28,
                              width: 100,
                              borderRadius: 15.0,
                              onTap: () {
                                shareDetails(
                                    map['bank_name'],
                                    map['details']['ifsc_code'],
                                    map['district_name'],
                                    map['state_name'],
                                    map['details']['micr_code'],
                                    map['details']['branch'],
                                    map['details']['address']);
                                // Share.share(
                                //     "Bank Name:-\n${map['bank_name']}\n\nIFSC Code:-\n${map['details']['ifsc_code']}\n\nDistrict:-\n${map['district_name']}\n\nState:-\n${map['state_name']}\n\nMICR Code:-\n${map['details']['micr_code']}\n\nBranch:-\n${map['details']['branch']}\n\nAddress:-\n${map['details']['address']}");
                              }),
                          SizedBox(height: ScreenSize.fSize_70()),
                        ],
                      ),
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

  shareDetails(bank, ifsc, district, state, mirc, branch, address) {
    Share.share(
        "Bank Name:-\n$bank\n\nIFSC Code:-\n$ifsc\n\nDistrict:-\n$district\n\nState:-\n$state\n\nMICR Code:-\n$mirc\n\nBranch:-\n$branch\n\nAddress:-\n$address");
  }

  Widget container(BuildContext context, String title, String subtitle,
      var height) {
    return Container(
      height: height,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(ScreenSize.fSize_10())),
      child: Padding(
        padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenSize.fSize_10()),
            Text(
              title,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  color: const Color(0xFF12356E),
                  fontSize: ScreenSize.fSize_17(),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              subtitle,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  color: const Color(0xFF768AAB),
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenSize.fSize_14()),
            ),
          ],
        ),
      ),
    );
  }

  Widget container2(BuildContext context, String title, String subtitle) {
    return Container(
      height: ScreenSize.fSize_70(),
      width: ScreenSize.horizontalBlockSize! * 45,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(ScreenSize.fSize_10())),
      child: Padding(
        padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenSize.fSize_10()),
            Text(
              title,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  color: const Color(0xFF12356E),
                  fontSize: ScreenSize.fSize_17(),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              subtitle,
              style: GoogleFonts.ibmPlexSansThaiLooped(
                  color: const Color(0xFF768AAB),
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenSize.fSize_14()),
            ),
          ],
        ),
      ),
    );
  }

  Widget button({double? height, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3.2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.2),
        ),
        child: Container(
          height: (height ?? 42) * 0.45,
          width: (height ?? 42) * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
          ),
          padding: const EdgeInsets.all(10.5),
        ),
      ),
    );
  }
}
