import 'dart:convert';

import 'package:all_bank/Get%20Started%20Screen/Logo%20Screen.dart';
import 'package:all_bank/main.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Get Started Screen/Get Started.dart';

class AppController extends GetxController with WidgetsBindingObserver {
  bool isPaused = false;
  bool isLoaded = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FacebookAudienceNetwork.init();
    WidgetsBinding.instance.addObserver(this);
    print('config.value -> ${remoteconfig.value}');
    // appOpenAdManager.loadAd();
    Future.delayed(const Duration(seconds: 3), () {
      remoteconfig.value != {}
          ? Get.off(() => const GetStartedScreen())
          : initConfig().whenComplete(() {
              remoteconfig.value =
                  json.decode(remoteConfig.getString('BankApp'));
              print('__remoteConfig 22-> ${remoteconfig.value}');
            });
    });
  }
}

class IfscScreenController extends GetxController {
  //TODO: Implement HomeViewsBankingIfscScreenController

  var bankName = 'Select Bank'.obs;
  RxString stateName = 'Select State'.obs;
  RxString districtName = 'Select District'.obs;
  RxString branchName = 'Select Branch'.obs;

  RxList searchedList = [].obs;
  RxBool isSearchOn = false.obs;

  List stateList = [];
  List cityList = [];
  List areaList = [];
  Map detailMap = {};

/*  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }*/
}
