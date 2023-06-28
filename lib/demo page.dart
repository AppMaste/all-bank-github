/*
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'demopage2.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  var total;
  var interest;
  var balance;

  //controller1 is Amount
  //controller2 is Interest Rate
  //controller3 is Period

*/
/*  calculation() {
    final calineterestrate = (double.parse(controller2.text) / 100 / 12) *
        int.parse(controller3.text);
    final calinterest = calineterestrate * int.parse(controller1.text);
    setState(() {
      interest = calinterest;
      total = int.parse(controller1.text) + interest!;
    });
  }*//*


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Calculation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputForm("Amount", controller1, "e.g 20000"),
            inputForm("Interest Rate(%)", controller2, "e.g 3"),
            inputForm("Period(in year)", controller3, "e.g 3"),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                if (controller1.text.isEmpty ||
                    controller2.text.isEmpty ||
                    controller3.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Fill empty value",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else {
                  calculation();
                  Get.to(
                        () => const DemoPage2(),
                    arguments: [
                      controller1.text,
                      interest.toString(),
                      total.toString(),
                      controller2.text,
                    ],
                  );
                }
                // calculation();
              },
              child: Container(
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  calculation() {
    int P = int.parse(controller1.text);
    double R = double.parse(controller2.text);
    int D = int.parse(controller3.text);

    interest = P * D * R / 100;
    log("Interest Amount ======= $interest");
    total = P + interest;
    log("Total Amount ======= $total");
  }

  inputForm(String title, var controller, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hintText),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
*/
