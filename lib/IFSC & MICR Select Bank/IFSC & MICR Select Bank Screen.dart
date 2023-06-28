import 'dart:convert';
import 'dart:developer';
import 'package:all_bank/Controller/ads.dart';
import 'package:all_bank/Local%20Data.dart';
import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Controller/AppController.dart';

class IFSCSelectBankScreenView extends GetView<IfscScreenController> {
  const IFSCSelectBankScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IfscScreenController controller = Get.put(IfscScreenController());
    controller.searchedList.value.clear();

    return Scaffold(
      appBar: appbarr,
      body: Stack(
        children: [
          Container(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SizedBox(height: ScreenSize.fSize_30()),
              searchBar(
                  width: 00,
                  fieldName:
                      'Search ${Get.arguments.toString().split(' ').last} Name'),
              SizedBox(height: ScreenSize.fSize_15()),
              Expanded(
                  child: Container(
                child: bankList(controller: controller),
              )),
              SizedBox(height: ScreenSize.fSize_60()),
            ]),
          ),
          banner.getBN()
        ],
      ),
    );
  }

  bankList({required IfscScreenController controller}) {
    return Obx(() => ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: controller.isSearchOn.value == true
              ? controller.searchedList.value.length
              : Get.arguments == 'Select Bank'
                  ? ifsc_list.length
                  : Get.arguments == 'Select State'
                      ? controller.stateList.length
                      : Get.arguments == 'Select District'
                          ? controller.cityList.length
                          : controller.areaList.length,
          itemBuilder: (context, index) {
            if (Get.arguments == 'Select State') {
              log(' controller.stateList -> ${controller.stateList}');
            }
            if (Get.arguments == 'Select District') {
              log(' controller.cityList -> ${controller.cityList}');
            }
            if (Get.arguments == 'Select Branch') {
              log(' controller.areaList -> ${controller.areaList}');
            }

            return InkWell(
              onTap: () async {
                if (controller.bankName.value == 'Select Bank') {
                  log('controller.bankName.value 11 -> ${ifsc_list[index].split('.').first}');
                } else {
                  log('controller.bankName.value 22 -> ${controller.bankName.value}');
                }

                if (Get.arguments == 'Select Bank') {
                  controller.bankName.value = 'Select Bank';
                  controller.stateList.clear();
                  controller.cityList.clear();
                  controller.areaList.clear();
                  controller.detailMap.clear();
                }

                List<String> lines = [];
                try {
                  String path;
                  if (controller.isSearchOn.value == true) {
                    path =
                        'assets/IFSC_Code/${controller.bankName.value == 'Select Bank' ? controller.searchedList.value[index].split('.').first : controller.bankName.value}.txt';
                  } else {
                    path =
                        'assets/IFSC_Code/${controller.bankName.value == 'Select Bank' ? ifsc_list[index].split('.').first : controller.bankName.value}.txt';
                  }
                  log('path  -> ${path}');
                  String fileData = await rootBundle.loadString(path);
                  lines = LineSplitter.split(fileData).toList();
                } catch (e) {
                  log('e  -> ${e}');
                }

                if (Get.arguments == 'Select Bank') {
                  if (controller.isSearchOn.value == true) {
                    controller.bankName.value =
                        controller.searchedList.value[index].split('.').first;
                  } else {
                    controller.bankName.value =
                        ifsc_list[index].split('.').first;
                  }
                  controller.stateName.value = 'Select State';
                  controller.districtName.value = 'Select District';
                  controller.branchName.value = 'Select Branch';
                  log('controller.stateList 11 -> ${controller.stateList}');
                  log('controller.bankName.value_____ -> ${controller.bankName.value}');

                  List<String> states = lines[0].split('*');
                  controller.stateList.addAll(states);
                  log('lines[0]  -> ${lines[0]}');
                  log('controller.stateList  22-> ${controller.stateList}');
                } else if (Get.arguments == 'Select State') {
                  if (controller.isSearchOn.value == true) {
                    controller.stateName.value =
                        controller.searchedList.value[index];
                  } else {
                    controller.stateName.value = controller.stateList[index];
                  }
                  log('*********');
                  log('controller.isSearchOn.value -> ${controller.isSearchOn.value}');
                  log('controller.stateName.value@@ -> ${controller.stateName.value}');
                  log('controller.stateList[index]@@ -> ${controller.stateList[index]}');
                  log('************');
                  controller.districtName.value = 'Select District';
                  controller.branchName.value = 'Select Branch';

                  controller.cityList.clear();
                  controller.areaList.clear();
                  controller.detailMap.clear();
                  final secondLineList = lines[1].split('**');
                  secondLineList.removeWhere((element) => element == '');
                  secondLineList.forEach((element) {
                    if (controller.isSearchOn.value == true) {
                      if (element.split('->').first ==
                          controller.searchedList.value[index]) {
                        log('element selected@@-> ${element.split('->').last.split('*').toList()}');
                        controller.cityList.addAll(
                            element.split('->').last.split('*').toList());
                      }
                    } else {
                      if (element.split('->').first ==
                          controller.stateList[index]) {
                        log('element selected@@-> ${element.split('->').last.split('*').toList()}');
                        controller.cityList.addAll(
                            element.split('->').last.split('*').toList());
                      }
                    }
                    // map_districts.add({element.split('->').first : element.split('->').last.split('*').toList()});
                  });
                } else if (Get.arguments == 'Select District') {
                  if (controller.isSearchOn.value == true) {
                    controller.districtName.value =
                        controller.searchedList.value[index];
                  } else {
                    controller.districtName.value = controller.cityList[index];
                  }
                  controller.branchName.value = 'Select Branch';

                  controller.areaList.clear();
                  controller.detailMap.clear();
                  final temp = lines[2].split('**');
                  temp.removeWhere((element) => element == '');
                  temp.forEach((element) {
                    if (controller.isSearchOn.value == true) {
                      if (element.split('->')[1] ==
                          controller.searchedList.value[index]) {
                        log('element selected@@-> ${element.split('->').last.split('*').toList()}');
                        controller.areaList.addAll(
                            element.split('->').last.split('*').toList());
                      }
                    } else {
                      if (element.split('->')[1] ==
                          controller.cityList[index]) {
                        log('element selected@@-> ${element.split('->').last.split('*').toList()}');
                        controller.areaList.addAll(
                            element.split('->').last.split('*').toList());
                      }
                    }
                    // map_branchs.add({element.split('->')[1] : element.split('->').last.split('*').toList()});
                  });
                } else {
                  if (controller.isSearchOn.value == true) {
                    controller.branchName.value =
                        controller.searchedList.value[index];
                  } else {
                    controller.branchName.value = controller.areaList[index];
                  }

                  final temp = lines[3].split('**');
                  temp.removeWhere((element) => element == '');
                  temp.forEach((element) {
                    Map<String, dynamic> map = {};
                    List<String> tempList = element.split('->').last.split('*');
                    if (controller.isSearchOn.value == true) {
                      if (element.split('->')[2] ==
                          controller.searchedList.value[index]) {
                        print(
                            'element.split()[2]@@@ -> ${element.split('->')[2]}');
                        print('tempList -> $tempList');
                        map['branch'] = element.split('->')[2];
                        map['address'] = tempList[0];
                        map['phone_number'] = tempList[1].split(',').last;
                        map['ifsc_code'] = tempList[2];
                        map['micr_code'] = tempList[3];
                        controller.detailMap.addAll(map);
                      }
                    } else {
                      if (element.split('->')[2] ==
                          controller.areaList[index]) {
                        print(
                            'element.split()[2] -> ${element.split('->')[2]}');
                        map['branch'] = '${element.split('->')[2]}';
                        map['address'] = '${tempList[0]}';
                        map['phone_number'] = tempList[1].split(',').last;
                        map['ifsc_code'] = tempList[2];
                        map['micr_code'] = tempList[3];
                        controller.detailMap.addAll(map);
                      }
                    }
                  });
                  print(' ');
                  print('detail -> ${controller.detailMap}');
                }

                controller.isSearchOn.value = false;
                log(' ');
                Get.back();
              },
              child: Container(
                // height: 200,
                // width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 3))
                    ],
                    // gradient: ConstantsColor.buttonGradient,
                    borderRadius: BorderRadius.circular(ScreenSize.fSize_10())),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_8()),
                      Container(
                        height: ScreenSize.horizontalBlockSize! * 13,
                        width: ScreenSize.horizontalBlockSize! * 13,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/icons/bank-icon.png"),
                              scale: 3),
                          color: const Color(0xFFEBF1FE),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xC7C7C7FF),
                              blurRadius: 5,
                            )
                          ],
                          // gradient: ConstantsColor.buttonGradient,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: ScreenSize.horizontalBlockSize! * 65,
                          color: Colors.transparent,
                          child: Text(
                            controller.isSearchOn.value == true
                                ? controller.searchedList.value[index]
                                : Get.arguments == 'Select Bank'
                                    ? ifsc_list[index].split('.').first
                                    : Get.arguments == 'Select State'
                                        ? controller.stateList[index]
                                        : Get.arguments == 'Select District'
                                            ? controller.cityList[index]
                                            : controller.areaList[index],
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.5),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget searchBar({required double width, required String fieldName}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: ScreenSize.fSize_50(),
        // width: width * 0.95,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
            ],
            // gradient: ConstantsColor.buttonGradient,
            borderRadius: BorderRadius.circular(ScreenSize.fSize_15())),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(width: ScreenSize.fSize_15()),
            // SizedBox(width: ScreenSize.fSize_15()),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: ScreenSize.fSize_8()),
                child: TextField(
                  cursorColor: const Color(0xFF768AAB),
                  style: TextStyle(
                      fontSize: ScreenSize.fSize_15(),
                      color: const Color(0xFF768AAB),
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      hintText: fieldName,
                      hintStyle: TextStyle(
                          fontSize: ScreenSize.fSize_15(),
                          color: const Color(0xFF768AAB),
                          fontWeight: FontWeight.w400),
                      border: InputBorder.none),
                  onChanged: (str) {
                    if (str.length > 0) {
                      controller.isSearchOn.value = true;
                    } else {
                      controller.isSearchOn.value = false;
                    }
                    print('Get.arguments -> ${Get.arguments}');
                    print(
                        'controller.isSearchOn.value -> ${controller.isSearchOn.value}');

                    if (Get.arguments == 'Select Bank') {
                      // ifsc_list.forEach((element) {
                      //   if(element.toLowerCase().contains(str.toLowerCase())) {
                      //     controller.searchedList.value.add(element.split('.').first);
                      //     print('controller.searchedList.value -> ${controller.searchedList.value}');
                      //   }
                      // });
                      controller.searchedList.value = ifsc_list
                          .where((element) =>
                              element.toLowerCase().contains(str.toLowerCase()))
                          .toList();
                      controller.searchedList.value = controller
                          .searchedList.value
                          .map((e) => e.toString().split('.').first)
                          .toList();
                    } else if (Get.arguments == 'Select State') {
                      controller.searchedList.value = controller.stateList
                          .where((element) =>
                              element.toLowerCase().contains(str.toLowerCase()))
                          .toList();
                    } else if (Get.arguments == 'Select District') {
                      controller.searchedList.value = controller.cityList
                          .where((element) =>
                              element.toLowerCase().contains(str.toLowerCase()))
                          .toList();
                    } else {
                      controller.searchedList.value = controller.areaList
                          .where((element) =>
                              element.toLowerCase().contains(str.toLowerCase()))
                          .toList();
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: ScreenSize.fSize_8()),
              child: Image.asset("assets/icons/search icon.png", scale: 2.4),
            ),
          ],
        ),
      ),
    );
  }
}
