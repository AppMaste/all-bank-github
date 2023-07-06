import 'package:all_bank/Controller/Button%20Controller.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../ScreenSize.dart';

class NetBankingPersonalWebviewScreen extends StatefulWidget {
  const NetBankingPersonalWebviewScreen({Key? key}) : super(key: key);

  @override
  State<NetBankingPersonalWebviewScreen> createState() =>
      _NetBankingPersonalWebviewScreenState();
}

class _NetBankingPersonalWebviewScreenState
    extends State<NetBankingPersonalWebviewScreen> {
  double _progress = 0;

  late InAppWebViewController webview;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton.backbutton(context, "/NetBankingPersonalWebviewScreen");
        return Future(() => false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appbarr,
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                  url: Uri.parse(
                      "https://netbanking.apmaheshbank.com:8080/internetbanking/lhome.do")),
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
                                  Theme.of(context).colorScheme.secondary.withOpacity(0.2),
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
      ),
    );
  }
}
