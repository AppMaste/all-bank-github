import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NearByPlaceScreen extends StatelessWidget {
  const NearByPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/NearByPlaceScreen");
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
                  sameRow(context, "Near By Place"),
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
                          // native.getNT("listTileMedium"),
                          SizedBox(height: ScreenSize.fSize_20()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              holidaycontainer(
                                  context,
                                  "Nearest Bank",
                                  "List of Bank branches in near",
                                  "assets/icons/bank-icon.png", () {
                                launchMapsUrl("Nearest Bank");
                              }),
                              holidaycontainer(
                                  context,
                                  "Nearest ATM",
                                  "List of ATM branches in near kocation",
                                  "assets/icons/nearest atm icon.png", () {
                                launchMapsUrl("Nearest ATM");
                              }),
                            ],
                          ),
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
      ),
    );
  }

  void launchMapsUrl(String lat) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat me';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
