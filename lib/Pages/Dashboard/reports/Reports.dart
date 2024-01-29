import 'package:flutter/material.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Network/Controllers/ReportController.dart';
import 'package:fpay/Network/Models/ReportResponse.dart';
import 'package:fpay/Pages/Dashboard/SideMenu.dart';
import 'package:fpay/Pages/Dashboard/reports/AepsInfo.dart';
import 'package:fpay/Pages/Dashboard/reports/DMTInfo.dart';
import 'package:fpay/Pages/Dashboard/reports/PayoutInfo.dart';
import 'package:fpay/Pages/Dashboard/reports/RechargeInfo.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';

import '../../../Models/ListViewItems/ReportViewItem.dart';
import '../../../Network/Models/DropDownMasterResponse.dart';
import '../../../Network/Models/ReportData.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';
import '../Notification.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  String fromDate = "";
  String lastDate = "";
  String? currentPriorityValue;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final reportController = ReportController();
  ReportResponse? reportResponse;
  int currentService = 0;
  bool isFilter = false;

  DropDownMasterResponse? dropDownMasterResponse;
  List<DropDownMasterData>? services;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    fromDate = now.toLocal().toString().substring(0, 10);
    lastDate = fromDate;

    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => serviceList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      key: scaffoldKey,
      extendBody: true,
      endDrawer: const SideMenu(),
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: AppDecoration.mainGradient.copyWith(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Align(
            child: InkWell(
              child: CommonImageView(
                svgPath: ImageConstant.mainNotificationIcon,
                height: 34.00,
                width: 34.00,
              ),
              onTap: () {
                goToNotification();
              },
            ),
          ),
        ),
        title: Text("Reports",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Align(
              child: InkWell(
                child: CommonImageView(
                  svgPath: ImageConstant.menuIcon,
                  height: 16.00,
                  width: 20.00,
                ),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
              ),
            ),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recent Orders",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          isFilter == true
                              ? InkWell(
                                  onTap: () => clearFilter(),
                                  child: Text(
                                    "Clear Filter",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: AppColor.blue900,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              : Container(),
                          Container(
                              height: 35,
                              width: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.7)),
                              margin:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: InkWell(
                                onTap: () => dateSheet(context),
                                child: CommonImageView(
                                  svgPath: ImageConstant.moreIcon,
                                ),
                              ))
                        ],
                      )
                    ],
                  )),
              reportResponse.isNull || reportResponse!.data.isNull
                  ? Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 50,
                              color: AppColor.gray600,
                            ),
                            Text(
                              "No Data Found",
                              style: TextStyle(
                                color: AppColor.gray600,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: RefreshIndicator(
                      onRefresh: getList,
                      child: ListView.builder(
                        itemCount: reportResponse!.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () =>
                                  goToInfo(reportResponse!.data![index]),
                              child: ReportViewItem(
                                  item: reportResponse!.data![index]));
                        },
                      ),
                    )),
            ],
          )),
    );
  }

  void goToNotification() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationPage()),
    );
  }

  void goToInfo(ReportData data) {
    if (data.subServiceID!.clamp(1, 20) == data.subServiceID) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RechargeInfo(
                  isHome: false,
                  id: data.id,
                  subServiceId: data.subServiceID,
                )),
      );
    } else if (data.subServiceID == 21 ||
        data.subServiceID == 22 ||
        data.subServiceID == 23 ||
        data.subServiceID == 24) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AepsInfo(
                isHome: false,
                id: data.id ?? 0,
                subService: data.subServiceID!)),
      );
    } else if (data.subServiceID == 25 ||
        data.subServiceID == 26 ||
        data.subServiceID == 27 ||
        data.subServiceID == 28) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PayoutInfo(
                  id: data.id ?? 0,
                  isHome: false,
                  subService: data.subServiceID ?? 0,
                )),
      );
    } else if (data.subServiceID == 31) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DMTInfo(
                  id: data.id ?? 0,
                  isHome: false,
                  subService: data.subServiceID ?? 0,
                )),
      );
    }
  }

  Future dateSheet(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
        context: context,
        constraints: BoxConstraints.loose(Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.45)),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter st) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
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
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Filter",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColor.black900),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.gray500, width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: InkWell(
                        onTap: () => selectDate(0, st),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              fromDate == "" ? "Select Date From" : fromDate,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                  fontStyle: FontStyle.normal,
                                  color: fromDate == ""
                                      ? AppColor.gray500
                                      : AppColor.black900),
                            ),
                            Icon(
                              Icons.date_range,
                              color: AppColor.gray500,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.gray500, width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: InkWell(
                        onTap: () => selectDate(1, st),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              lastDate == "" ? "Select Date To" : lastDate,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                  fontStyle: FontStyle.normal,
                                  color: lastDate == ""
                                      ? AppColor.gray500
                                      : AppColor.black900),
                            ),
                            Icon(
                              Icons.date_range,
                              color: AppColor.gray500,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.only(
                          left: 20, top: 4, bottom: 4, right: 10),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: const SizedBox(),
                        hint: const Text("Service Type"),
                        value: currentPriorityValue,
                        dropdownColor: Colors.white,
                        onChanged: (item) {
                          currentService = int.parse(item ?? "0");
                          currentPriorityValue = item;
                          Navigator.pop(context);
                          dateSheet(context);
                        },
                        items: services?.map((item) {
                          return DropdownMenuItem<String>(
                              value: item.id ?? "0",
                              child: Text(item.name ?? "NA"));
                        }).toList(),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          if (fromDate.isEmpty) {
                            DialogHelper.showToast(
                                "Please select the from date..");
                          } else if (lastDate.isEmpty) {
                            DialogHelper.showToast(
                                "Please select the last date..");
                          } else {
                            isFilter = true;
                            Navigator.pop(context);
                            getList();
                          }
                        },
                        child: Container(
                            margin: const EdgeInsets.only(
                                left: 23, top: 20, right: 23),
                            child:
                                Stack(alignment: Alignment.center, children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      decoration: AppDecoration
                                          .gradientLightblue800Blue500
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomIconButton(
                                                height: 25,
                                                width: 25,
                                                margin:
                                                    const EdgeInsets.all(10),
                                                variant: IconButtonVariant
                                                    .OutlineWhiteA701,
                                                shape: IconButtonShape
                                                    .CircleBorder15,
                                                padding: IconButtonPadding
                                                    .PaddingAll8,
                                                alignment:
                                                    Alignment.centerRight,
                                                child: CommonImageView(
                                                    svgPath:
                                                        ImageConstant.moveIcon))
                                          ]))),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40,
                                        top: 21,
                                        right: 40,
                                        bottom: 20),
                                    child: Text("search".toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsSemiBold16
                                            .copyWith(letterSpacing: 1.00))),
                              )
                            ]))),
                  ],
                ),
              ),
            );
          });
        });
  }

  Future selectDate(int i, StateSetter updateState) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null) {
      updateState(() {
        if (i == 0) {
          fromDate = picked.toString().substring(0, 11);
        } else {
          lastDate = picked.toString().substring(0, 11);
        }
      });
      setState(() {});
    }
  }

  void clearFilter() {
    isFilter = false;
    DateTime now = DateTime.now();
    fromDate = now.toLocal().toString().substring(0, 10);
    lastDate = fromDate;
    currentService = 0;
    setState(() {
      getList();
    });
  }

  Future getList() async {
    var body = {
      "Action": "GetAll",
      "Id": currentService,
      "SubServiceID": 0,
      "StatusId": 0,
      "FromDate": fromDate,
      "ToDate": lastDate,
      "PageIndex": 0,
      "PageSize": 100
    };
    var json = await reportController.reportList(body);
    setState(() {});
    reportResponse = ReportResponse.fromJson(json);
    if (reportResponse?.status != true) {
      DialogHelper.showErrorDialog(description: reportResponse!.message!);
    }
  }

  Future serviceList() async {
    var body = {"action": "service", "id": "0"};
    var json = await reportController.serviceList(body);
    dropDownMasterResponse = DropDownMasterResponse.fromJson(json);
    if (dropDownMasterResponse?.status == true) {
      services = dropDownMasterResponse!.data!;
    }
    getList();
  }
}
