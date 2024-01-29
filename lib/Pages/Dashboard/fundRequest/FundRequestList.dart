import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpay/Network/Controllers/FundRequestController.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Network/Models/FundRequestData.dart';
import 'package:fpay/Network/Models/FundRequestListResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/WidgetsConstant.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/ApiConstants.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/JWTTokenProvider.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';
import '../../Common/SecurityPin.dart';
import 'package:http/http.dart' as http;

class FundRequestList extends StatefulWidget {
  const FundRequestList({super.key});

  @override
  State<FundRequestList> createState() => _FundRequestListState();
}

class _FundRequestListState extends State<FundRequestList> {
  final controller = FundRequestController();
  FundRequestListResponse? fundRequestListResponse;
  CommonResponse? commonResponse;
  var bankList = [];
  String fromDate = "";
  String lastDate = "";
  String currentPriorityValue = "0";

  List<Map<String, String>> statusList = [
    {"id": "4", "name": "All"},
    {"id": "0", "name": "Pending"},
    {"id": "1", "name": "Approved"},
    {"id": "2", "name": "Rejected"}
  ];
  var dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    DateTime currentDate = DateTime.now();
    String startDate = dateFormat.format(currentDate.toLocal());
    fromDate = lastDate = startDate;
    Future.delayed(const Duration(milliseconds: 100)).then(
        (value) => requestAllList(fromDate, lastDate, currentPriorityValue));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        flexibleSpace: Container(
          decoration: AppDecoration.mainGradient.copyWith(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        title: Container(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text("Fund Request List",
                      style: AppStyle.txtPoppinsBold18.copyWith()),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 5, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColor.whiteA700.withOpacity(0.1)),
                    child: InkWell(
                      onTap: () => {dateSheet(context)},
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                        child: CommonImageView(
                          svgPath: ImageConstant.moreIcon,
                          height: 12.00,
                          width: 15.00,
                        ),
                      ),
                      //onTap: () => filter(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: fundRequestListResponse.isNull ||
                fundRequestListResponse?.data?.length == 0
            ? Container(
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
              )
            : Container(
                child: bankList.isEmpty
                    ? dataNotFound()
                    : ListView.builder(
                        itemCount: bankList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              child: fundRequestItem(bankList[index]));
                        },
                      ),
              ),
      ),
    ));
  }

  Widget fundRequestItem(FundRequestData? data) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      clipBehavior: Clip.hardEdge,
      color: AppColor.whiteA700,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 20),
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 12, right: 12),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.gray600, width: 1),
                                borderRadius: BorderRadius.circular(8)),
                            child: SvgPicture.asset(
                              ImageConstant.Id13,
                              height: 35,
                              width: 35,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              data?.memberName ?? "NA",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.bankNameColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Gotham'),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                data?.addDate?.substring(0, 10) ?? "NA",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.bankNameColor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Gotham'),
                              ),
                            ),
                            Text(
                              "${data?.paymentMode ?? "NA"} - ₹${data?.amount ?? "NA"}",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.bankNameColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Gotham'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.gray503.withOpacity(0.3)),
                  child:
                      (data?.status == "Approved" || data?.status == "Pending")
                          ? SvgPicture.asset(
                              data?.status == "Approved"
                                  ? ImageConstant.successIcon
                                  : ImageConstant.pendingIcon,
                              height: 20,
                              width: 20,
                            )
                          : const Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 20,
                            ),
                )
              ],
            ),
            data?.status == "Pending"
                ? Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => {completeFundRequest(data, "2")},
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            width: size.width / 2.8 - 8,
                            decoration: AppDecoration.mainGradient.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder18),
                            child: Text(
                              "Approved",
                              style: TextStyle(
                                  fontFamily: 'Gotham',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColor.whiteA700),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => completeFundRequest(data, "2"),
                          child: Container(
                              width: size.width / 2.8 - 8,
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.gray700, width: 1),
                                  borderRadius: BorderRadius.circular(18)),
                              child: Text(
                                "Reject",
                                style: TextStyle(
                                    fontFamily: 'Gotham',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColor.gray700),
                              )),
                        ),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Future<void> requestAllList(String fd, String ld, String id) async {
    var body = {"FromDate": fd, "ToDate": ld, "StatusId": id};
    var json = await controller.fundRequestList(body);
    fundRequestListResponse = FundRequestListResponse.fromJson(json);
    if (fundRequestListResponse?.status == true) {
      bankList = fundRequestListResponse!.data!;
      setState(() {});
    } else {
      DialogHelper.showSuccessWithBack(
          context: context,
          description: fundRequestListResponse!.message.toString());
    }
  }

  Future completeFundRequest(FundRequestData? data, String status) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Warning',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: AppColor.black900),
            ),
            content: Text(
                "Do you want to ${status == "1" ? "approve" : "reject"} the fund?",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: AppColor.red700)),
            actions: [
              TextButton(
                child: Text(
                  'No',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: AppColor.black900),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Close the dialog without returning a value
                },
              ),
              TextButton(
                child: Text(
                  'Yes',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: AppColor.black900),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  getPin(data?.id.toString() ?? "0", status);
                },
              ),
            ],
          );
        });
  }

  Future getPin(String id, String status) async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecurityPin()),
    );
    if (results.containsKey("pin") && results.isNotEmpty) {
      setState(() {
        sendRequest(status, id, results["pin"]);
      });
    }
  }

  Future sendRequest(String stId, String id, String pin) async {
    DialogHelper.showLoading();
    String token = JWTTokenProvider().getToken();
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(ApiConstants.baseUrl + ApiConstants.fundRequest),
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['Action'] = "ApprovedReject";
      request.fields['StatusId'] = stId;
      request.fields['ID'] = id;
      request.fields['TPass'] = pin;
      var response = await request.send();
      DialogHelper.hideLoading();
      response.stream.bytesToString().then((value) {
        final responseJson = jsonDecode(value);
        DialogHelper.hideLoading();
        commonResponse = CommonResponse.fromJson(responseJson);
        if (commonResponse!.status!) {
          DialogHelper.showSuccessDialog(
              description: commonResponse!.message.toString());
        } else {
          DialogHelper.showErrorDialog(
              description: commonResponse!.message.toString());
        }
      });
    } catch (e) {
      print("exceptions ----- $e");
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
                          currentPriorityValue = item ?? "0";
                          Navigator.pop(context);
                          dateSheet(context);
                        },
                        items: statusList.map((item) {
                          return DropdownMenuItem<String>(
                              value: item['id'] ?? "0",
                              child: Text(item['name'] ?? "NA"));
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
                            Navigator.pop(context);
                            requestAllList(
                                fromDate, lastDate, currentPriorityValue);
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
          fromDate = dateFormat.format(picked.toLocal());
        } else {
          lastDate = dateFormat.format(picked.toLocal());
        }
      });
      setState(() {});
    }
  }
}
