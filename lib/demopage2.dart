/*
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoPage2 extends StatefulWidget {
  const DemoPage2({Key? key}) : super(key: key);

  @override
  State<DemoPage2> createState() => _DemoPage2State();
}

class _DemoPage2State extends State<DemoPage2> {
  List interest = [2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0, 18.0, 20.0];
  List duration = [1, 2, 2, 4, 5, 6, 7, 8, 9, 10];
  var interestrate;

  var data = Get.arguments;

  cal(int index) {
    interestrate = (double.parse(data[1]) * interest[index]);
  }

  @override
  Widget build(BuildContext context) {
    log("Value:---------- $data");
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh)),
      ]),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          // log("Value:---------- ${double.parse(interestrate[index])}");
          final value = double.parse(data[1]) * duration[index] * int.parse(data[3]) / 100;
          return ListTile(
            title: Text(
              data[0],
            ),
            // subtitle:
            //     Text((double.parse(data[1]) * interest[index]).toString()),
            leading: Text((int.parse(data[0]) + value).toString()),
            // leading: Text(),
          );
        },
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  String fileContents = '';
  List demo = [];
  bool load = false;

  Future loadAsset() async {
    String fileText = await rootBundle
        .loadString('assets/IFSC_Code/Abhyudaya Co-op Bank.txt');
    demo = fileText.split("*");
    setState(() {
      fileContents = fileText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Load Data"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  loadAsset();
                },
                child: const Text("Load Data"),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: demo.length,
              itemBuilder: (context, index) {
                print("LOADEDEDED : ${demo[index]}");
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.red.shade100,
                    padding: const EdgeInsets.all(16.0),
                    child: Text(demo[index]),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
