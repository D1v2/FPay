import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Network/Controllers/RechargeControllers.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Network/Models/DoRechargeDataResponse.dart';
import 'package:fpay/Network/Models/DoRechargeResponse.dart';
import 'package:fpay/Network/Models/OperatorData.dart';
import 'package:fpay/Network/Models/OperatorResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';

import '../../../Network/Models/DropDownMasterResponse.dart';
import '../../../Network/Models/HomeIconsResponse.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';


class Recharge extends StatefulWidget {
  const Recharge({Key? key}) : super(key: key);

  @override
  State<Recharge> createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  TextEditingController valueController = TextEditingController();
  bool isValue = false;
  CommonResponse? commonResponse;
  final controller = RechargeControllers();

  OperatorResponse? operatorResponse;
  OperatorData? currentOperator;
  DropDownMasterResponse? dropDownMasterResponse;
  DropDownMasterData? currentCircle;
  List<OperatorData>? operatorList;
  List<DoRechargeDataResponse>? recentRechargeList;

  DoRechargeResponse? rechargeResponse;
  late HomeIconsData? homeIconsData;

  @override
  void initState() {
    super.initState();
    homeIconsData = Get.arguments;
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => fetchOperatorName());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            flexibleSpace: Container(
              decoration: AppDecoration.mainGradient.copyWith(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
            leading: Align(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: Text(homeIconsData?.serviceName ?? "NA",
                style: AppStyle.txtPoppinsBold18.copyWith()),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20.0))),
          ),
          body: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    if (homeIconsData?.id == "1" && value.length == 10) {
                      fetchOperator(valueController.value.text.toString(),
                          valueController.value.text.toString());
                    } else {
                      if (value.isNotEmpty) {
                        isValue = true;
                      } else {
                        isValue = false;
                      }
                    }
                    setState(() {});
                  },
                  controller: valueController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                      hintText: homeIconsData?.serviceCode == "PR"
                          ? "Enter Mobile Number"
                          : "Enter Dth Number",
                      contentPadding: const EdgeInsets.only(
                          left: 30, top: 20, bottom: 20, right: 30),
                      suffixIcon: homeIconsData?.serviceCode == "PR"
                          ? InkWell(
                              onTap: () {
                                selectNumber();
                              },
                              child: const Icon(Icons.contacts))
                          : const Icon(Icons.cable)),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Recent Recharges",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                ),
                recentRechargeList.isNull || recentRechargeList!.isEmpty
                    ? Container(
                        margin: const EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        child: const Text(
                          "Recent don't have data",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins'),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: recentRechargeList?.length ?? 0,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => {
                                fetchOperator(
                                    recentRechargeList?[index].memberName ??
                                        "NA",
                                    recentRechargeList?[index].caNumber ?? "NA")
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          "https://fpay.net.in/SoftwareImage/RechargeDynamicLogo/${recentRechargeList![index].logo}",
                                          height: 45,
                                          width: 45,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                recentRechargeList?[index]
                                                        .operatorName ??
                                                    "NA",
                                                style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 17,
                                                    color: Colors.black),
                                              ),
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    recentRechargeList?[index]
                                                            .caNumber ??
                                                        "NA",
                                                    style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15,
                                                        color: Colors.grey),
                                                  )),
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    recentRechargeList?[index]
                                                            .subHeading ??
                                                        "NA",
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: recentRechargeList?[
                                                                        index]
                                                                    .status ==
                                                                "Success"
                                                            ? Colors.green
                                                            : Colors.redAccent),
                                                  ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
          floatingActionButton: Visibility(
            visible: isValue,
            child: FloatingActionButton(
              backgroundColor: AppColor.lightBlue801,
              onPressed: () {
                fetchOperator(valueController.value.text.toString(),
                    valueController.value.text.toString());
              },
              child: const Icon(
                Icons.arrow_forward_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future fetchOperator(String name, String value) async {
    if (value.isEmpty) {
      DialogHelper.showToast(homeIconsData?.serviceCode == "PR"
          ? "Please enter the mobile number"
          : "Please enter valid dth number");
    } else if (homeIconsData?.serviceCode == "PR" && value.length < 10) {
      DialogHelper.showToast("Please enter the valid mobile number");
    } else {
      var body = {
        "Action": homeIconsData?.id == "1"
            ? "OperatorCheckPrepaid"
            : "OperatorCheckDTH",
        "SubServiceId": int.parse(homeIconsData?.id ?? '1'),
        "CaNumber": value
      };
      var jsons = await controller.fetchRechargePlans0(body);
      commonResponse = CommonResponse.fromJson(jsons);
      if (commonResponse?.status == true) {
        if (isJsonFormat(commonResponse?.data)) {
          var jsonData = json.decode(commonResponse?.data);
          currentOperator = operatorResponse!.data!
              .firstWhere((element) => element.id == jsonData['OperatorID']);
          if (homeIconsData?.serviceCode == "PR") {
            currentCircle = dropDownMasterResponse!.data!.firstWhere(
                (element) =>
                    int.parse(element.id ?? "0") == jsonData['CircleID']);
          }
          selectPlan(name, value);
        }
      } else {
        selectOperator('operator');
      }
    }
  }

  Future selectOperator(String status) async {
    var rs = await Get.toNamed('/selectOperator', arguments: {
      'ol': status == 'operator' ? operatorResponse!.data! : null,
      'cl': status == 'operator' ? null : dropDownMasterResponse?.data,
    });
    if (rs != null) {
      setState(() {
        if (homeIconsData?.id == "1" && status == "operator") {
          if (rs is OperatorData) {
            currentOperator = rs;
            selectOperator('');
          } else {
            currentCircle = rs;
            selectPlan(valueController.value.text.toString(),
                valueController.value.text.toString());
          }
        } else {
          if (status == 'operator') {
            currentOperator = rs;
            selectPlan(valueController.value.text.toString(),
                valueController.value.text.toString());
          }
        }
      });
    }
  }

  Future fetchCircleName() async {
    var body = {"action": "Circle", "id": '0'};
    var json = await controller.fetchCircleName(body);
    dropDownMasterResponse = DropDownMasterResponse.fromJson(json);
    if (dropDownMasterResponse?.status != true) {
      DialogHelper.showErrorDialog(
          description: dropDownMasterResponse!.message.toString());
    }
  }

  Future fetchOperatorName() async {
    var body = {"action": "", "id": homeIconsData?.id};
    var json = await controller.fetchOperatorName(body);
    operatorResponse = OperatorResponse.fromJson(json);
    if (operatorResponse?.status != true) {
      DialogHelper.showErrorDialog(
          description: operatorResponse!.message.toString());
    } else {
      fetchCircleName();
      fetchRecentRecharges();
    }
  }

  selectPlan(String name, String number) {
    Get.toNamed('/selectMobilePlan', arguments: {
      'name': name,
      'mobile': number,
      'iconData': homeIconsData,
      'currentOperator': currentOperator!,
      'currentCircle': currentCircle,
      'operatorList': operatorResponse!.data!,
      'circleList': dropDownMasterResponse?.data,
    });
  }

  Future selectNumber() async {
    var rs = await Get.toNamed('/contactNumber');
    if (rs != null && rs is Map<String, String>) {
      valueController = TextEditingController(text: rs['number']);
    }
    setState(() {
      fetchOperator(rs['name'], rs['number']);
    });
  }

  Future fetchRecentRecharges() async {
    var body = {
      "Action": "RechargeRecentTransaction",
      "Id": 0,
      "SubServiceID": homeIconsData?.id ?? 0,
      "StatusId": 0,
      "FromDate": "",
      "ToDate": "",
      "TransactionId": "",
      "PageIndex": 0,
      "PageSize": 10
    };
    var json = await controller.recentTransactions(body);
    rechargeResponse = DoRechargeResponse.fromJson(json);
    recentRechargeList = rechargeResponse?.data;
    setState(() {});
  }
}