import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Network/Models/DropDownMasterResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/RechargeControllers.dart';
import '../../../Network/Models/HomeIconsResponse.dart';
import '../../../Network/Models/OperatorData.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class SelectMobilePlan extends StatefulWidget {
  const SelectMobilePlan({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectMobilePlan> createState() => _SelectMobilePlanState();
}

class _SelectMobilePlanState extends State<SelectMobilePlan> {
  TextEditingController operatorController = TextEditingController();
  TextEditingController circleController = TextEditingController();

  var filterKeys = [];
  var filterData = [];
  var currentKeys = 0;
  bool isValue = false;
  var searchData = [];
  var searchFilterData = [];

  final controller = RechargeControllers();
  CommonResponse? response, customerInformation;
  TextEditingController amountController = TextEditingController();
  bool isLoading = true;

  late String? mobile;
  late String? name;
  late HomeIconsData? homeIconsData;
  late OperatorData currentOperator;
  late DropDownMasterData? currentCircle;

  late List<OperatorData> operatorList;
  late List<DropDownMasterData>? circleList;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> arguments = Get.arguments;
    name = arguments['name'];
    mobile = arguments['mobile'];
    homeIconsData = arguments['iconData'];
    currentOperator = arguments['currentOperator'];
    currentCircle = arguments['currentCircle'];
    operatorList = arguments['operatorList'];
    circleList = arguments['circleList'];

    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => fetchPlans());
    operatorController =
        TextEditingController(text: currentOperator.operatorName);
    circleController = TextEditingController(text: currentCircle?.name ?? "");
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          title:
              Text("Select Plan", style: AppStyle.txtPoppinsBold18.copyWith()),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                child: ListTile(
                  leading: Image.network(
                    "https://fpay.net.in/SoftwareImage/RechargeDynamicLogo/${currentOperator.operatorLogo}",
                    height: 55,
                    width: 55,
                  ),
                  title: Text(
                    name ?? "NA",
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  subtitle: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        mobile ?? "NA",
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey),
                      )),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => selectOperator('operator'),
                      child: Container(
                        width: size.width / 2.5,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppColor.gray500, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              currentOperator.operatorName ?? "NA",
                              overflow: TextOverflow.ellipsis,
                              style: AppStyle.normalLabelHeading.copyWith(
                                  fontSize: 14, color: AppColor.gray600),
                            ),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              color: AppColor.gray600,
                            )
                          ],
                        ),
                      ),
                    ),
                    homeIconsData?.id != "2"
                        ? InkWell(
                            onTap: () => selectOperator(''),
                            child: Container(
                              width: size.width / 2.5,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: AppColor.gray500, width: 1)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    currentCircle?.name ?? "NA",
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyle.normalLabelHeading.copyWith(
                                        fontSize: 14, color: AppColor.gray600),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: AppColor.gray600,
                                  )
                                ],
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () => {customerInfo()},
                            child: Text(
                              "See Information",
                              style: AppStyle.normalLabelHeading.copyWith(
                                  color: AppColor.lightBlue801,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.only(top: 15, bottom: 10),
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        isValue = true;
                      } else {
                        isValue = false;
                      }
                      setState(() {
                        searchFilterData = searchData
                            .where((element) => (homeIconsData?.id == "1"
                                    ? element['rs']
                                    : element['rs']['1 MONTHS'])
                                .toString()
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    controller: amountController,
                    decoration: InputDecoration(
                        hintText: "Enter amount or search plan",
                        suffixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.only(left: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
              ),
              amountController.text.isNotEmpty
                  ? Container()
                  : Container(
                      height: 40,
                      margin: const EdgeInsets.only(top: 15),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return currentKeys == index
                              ? Container(
                                  margin:
                                      const EdgeInsets.only(left: 7, right: 7),
                                  decoration: BoxDecoration(
                                      color: AppColor.lightBlue801,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        filterKeys[index],
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 13,
                                            color: AppColor.whiteA700,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentKeys = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 7, right: 7),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                            color: Colors.grey, width: 1)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 5,
                                            bottom: 5),
                                        child: Text(
                                          filterKeys[index],
                                          style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        },
                        itemCount: filterKeys.length,
                      ),
                    ),
              amountController.text.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (searchFilterData.isNotEmpty)
                              SizedBox(
                                height: size.height,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const Divider();
                                  },
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final item = searchFilterData[index];
                                    final rs = homeIconsData?.id == "1"
                                        ? item['rs']
                                        : item['rs']['1 MONTHS'];
                                    return InkWell(
                                      onTap: () {
                                        goToRecharge(
                                            rs.toString(), item['validity'] ?? "NA");
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        child: ListTile(
                                          leading: Container(
                                            padding: const EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColor.lightBlue801),
                                            child: Text(
                                              "₹$rs",
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          title: Text(
                                            homeIconsData?.id == "1"
                                                ? item['validity'] ?? "NA"
                                                : item['plan_name'],
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          subtitle: Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              item['desc'],
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: searchFilterData.length,
                                ),
                              )
                            else
                              const Center(
                                child: Text("No Data Found"),
                              ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (isLoading)
                              const Center(child: CircularProgressIndicator())
                            else if (filterData.isNotEmpty)
                              SizedBox(
                                height: size.height,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const Divider();
                                  },
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final item = filterData[currentKeys][index];
                                    final rs = homeIconsData?.id == "1"
                                        ? item['rs']
                                        : item['rs']['1 MONTHS'];
                                    return InkWell(
                                      onTap: () {
                                        goToRecharge(
                                            rs.toString(), item['validity'] ?? "NA");
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        child: ListTile(
                                          leading: Container(
                                            padding: const EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColor.lightBlue801),
                                            child: Text(
                                              "₹$rs",
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          title: homeIconsData?.id == "1"
                                              ? currentKeys != 0
                                                  ? Text(
                                                      "Validity ${item['validity']}",
                                                      style: const TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  : null
                                              : Text(
                                                  "${item['plan_name']}",
                                                  style: const TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                          subtitle: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: Text(
                                                item
                                                    ['desc'],
                                                style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 12),
                                              )),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount:
                                      filterData[currentKeys].length ?? 0,
                                ),
                              )
                            else
                              const Center(
                                child: Text("No Data Found"),
                              ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: isValue,
          child: FloatingActionButton(
            backgroundColor: AppColor.lightBlue801,
            onPressed: () {
              goToRecharge(amountController.value.text.toString(), "NA");
            },
            child: const Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  goToRecharge(String amount, String validation) {
    Get.toNamed('/rechargePayment', arguments: {
      'number': mobile,
      'name': name,
      'iconData': homeIconsData,
      'amount': amount,
      'validation': validation,
      'operatorData': currentOperator,
      'circleData': currentCircle,
    });
  }

  Future fetchPlans() async {
    var body = {
      "Action":
          homeIconsData?.id == "1" ? "FetchROfferPrepaid" : "FetchROfferDTH",
      "SubServiceId": homeIconsData?.id ?? '1',
      "RechargeOperatorId": currentOperator.id,
      "CircleId": currentCircle?.id ?? "0",
      "CaNumber": mobile
    };
    var js = await controller.fetchRechargePlans(body);
    response = CommonResponse.fromJson(js);

    if (response?.status == true) {
      if (isJsonFormat(response!.data)) {
        var jsonData = json.decode(response!.data);
        if (homeIconsData?.id == "2") {
          if (jsonData['R-Offer']['status'] != 0) {
            filterKeys.add('Special Plan');
            filterData.addAll(jsonData.values.toList());
            browsePlan();
          } else {
            browsePlan();
          }
        } else {
          if (jsonData['R-Offer'].length > 0) {
            filterKeys.add('Special Plan');
            filterData.addAll(jsonData.values.toList());
            browsePlan();
          } else {
            browsePlan();
          }
        }
      } else {
        setState(() {
          isLoading = !isLoading;
        });
        DialogHelper.showErrorDialog(description: 'Something went wrong...');
      }
    } else {
      setState(() {
        isLoading = !isLoading;
      });
      DialogHelper.showErrorDialog(description: response!.message.toString());
    }
  }

  Future browsePlan() async {
    var body = {
      "Action": homeIconsData?.id == "1" ? "FetchPlanPrepaid" : "FetchPlanDTH",
      "SubServiceId": homeIconsData?.id ?? '1',
      "RechargeOperatorId": currentOperator.id,
      "CircleId": currentCircle?.id ?? "0",
      "CaNumber": mobile
    };
    var js = await controller.fetchRechargePlans(body);
    response = CommonResponse.fromJson(js);
    if (response?.status == true) {
      if (isJsonFormat(response!.data)) {
        var jsonData = json.decode(response!.data);
        if (jsonData['rs'] != 0) {
          filterKeys.addAll(jsonData.keys.toList());
          filterData.addAll(jsonData.values.toList());
        }
        singleArrayData();
        setState(() {
          isLoading = !isLoading;
        });
      } else {
        setState(() {
          isLoading = !isLoading;
        });
        DialogHelper.showErrorDialog(description: 'Something went wrong...');
      }
    } else {
      setState(() {
        isLoading = !isLoading;
      });
      DialogHelper.showErrorDialog(description: response!.message.toString());
    }
    setState(() {});
  }

  singleArrayData() {
    for (var data in filterData) {
      searchData.addAll(data);
    }
  }

  Future selectOperator(String status) async {
    var rs = await Get.toNamed('/selectOperator', arguments: {
      'ol': status == 'operator' ? operatorList : null,
      'cl': status == 'operator' ? null : circleList
    });

    if (rs != null) {
      setState(() {
        if (status == "operator") {
          currentOperator = rs;
          operatorController = TextEditingController(text: rs.operatorName);
        } else {
          currentCircle = rs;
          circleController = TextEditingController(text: rs.name ?? "");
        }
      });
    }
  }

  Future customerInfo() async {
    var body = {
      "Action": "CustomerInfoDTH",
      "RechargeOperatorId": currentOperator.id,
      "SubServiceId": int.parse(homeIconsData?.id ?? '1'),
      "CircleId": "0",
      "CaNumber": mobile
    };
    var jsons = await controller.fetchRechargePlans0(body);
    customerInformation = CommonResponse.fromJson(jsons);
    if (customerInformation?.status == true) {
      var jsonData = json.decode(customerInformation?.data);
      if (jsonData is List) {
        showBottomSheet(jsonData[0]);
      } else {
        DialogHelper.showErrorDialog(description: jsonData["desc"]);
      }
    } else {
      DialogHelper.showErrorDialog(
          description: customerInformation!.message.toString());
    }
  }

  Future showBottomSheet(var data) {
    return showModalBottomSheet(
        context: context,
        constraints: BoxConstraints.loose(Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.40)),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.gray500,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray100, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColor.gray600.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "DTH NO. $mobile",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.normalLabelHeading
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Name",
                                          style: AppStyle.normalLabelHeading
                                              .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12)),
                                      Text(data['customerName'] ?? "NA",
                                          style: AppStyle.normalLabelHeading
                                              .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Balance",
                                        style: AppStyle.normalLabelHeading,
                                      ),
                                      Text(data['Balance'].toString(),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle.normalLabelHeading),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Status",
                                          style: AppStyle.normalLabelHeading
                                              .copyWith(
                                                  color: AppColor.amountColor)),
                                      Text(data['status'] ?? "NA",
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle.normalLabelHeading),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Monthly Recharge",
                                          style: AppStyle.normalLabelHeading),
                                      Text(data['MonthlyRecharge'].toString(),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle.normalLabelHeading),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColor.gray600.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Plan Name :",
                                    style: AppStyle.normalLabelHeading),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Text(data['planname'] ?? "NA",
                                      style: AppStyle.normalLabelHeading),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
