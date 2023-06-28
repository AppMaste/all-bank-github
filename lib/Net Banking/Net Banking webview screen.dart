import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../ScreenSize.dart';


class NetBankingWebScreen extends StatefulWidget {
  const NetBankingWebScreen({Key? key}) : super(key: key);

  @override
  State<NetBankingWebScreen> createState() => _NetBankingWebScreenState();
}

class _NetBankingWebScreenState extends State<NetBankingWebScreen> {
  double _progress = 0;

  late InAppWebViewController webview;

  var bankdata = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print("nahasvdhgasd ${bankdata}");
    return Scaffold(
      appBar: appbarr,
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
                url: Uri.parse(
                    "$bankdata")),
            onWebViewCreated: (InAppWebViewController controller) {
              webview = controller;
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
          _progress < 1
              ? Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: ScreenSize.fSize_40(),
                    width: ScreenSize.fSize_40(),
                    child: CircularProgressIndicator(
                      strokeWidth: ScreenSize.horizontalBlockSize! * 1.4,
                      value: _progress,
                      backgroundColor:
                      Theme
                          .of(context)
                          .accentColor
                          .withOpacity(0.2),
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize.fSize_20(),
                  ),
                  Text(
                    "Loading...",
                    style: TextStyle(fontSize: ScreenSize.fSize_20()),
                  )
                ],
              ),
            ),
          )
              : SizedBox(),
          // _progress < 1
          //     ? SizedBox(
          //         height: 3,
          //         child: LinearProgressIndicator(
          //           value: _progress,
          //           backgroundColor: Theme.of(context).colorScheme.secondary,
          //         ),
          //       )
          //     : const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
