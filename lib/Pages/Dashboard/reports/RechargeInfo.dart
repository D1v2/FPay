import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:number_to_character/number_to_character.dart';

import '../../../Network/Controllers/ReportController.dart';
import '../../../Network/Models/BBPSReportResponse.dart';
import '../../../Network/Models/RechargeReportInfoResponse.dart';
import '../../../Utils/ConvenienceDialog.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/PermissionDialog.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/pdfFormates/BillPdf.dart';

class RechargeInfo extends StatefulWidget {
  bool isHome;
  int? id;
  int? subServiceId;

  RechargeInfo(
      {Key? key,
      required this.isHome,
      required this.id,
      required this.subServiceId})
      : super(key: key);

  @override
  State<RechargeInfo> createState() => _RechargeInfoState();
}

class _RechargeInfoState extends State<RechargeInfo> {
  RechargeReportInfoResponse? rechargeReportInfoResponse;
  final reportController = ReportController();
  var converter = NumberToCharacterConverter('en');
  BBPSReportResponse? bbpsReportResponse;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => serviceInfo());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onTap: () {
                widget.isHome ? goToHome(context) : Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text("Recharge & Bill Payments",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
        actions: [
          InkWell(
            onTap: () {
              DialogHelper.showToast("Coming soon....");
              //  requestStoragePermission()
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.whiteA700.withOpacity(0.2)),
              padding: const EdgeInsets.all(5),
              child: Icon(
                Icons.cloud_download,
                color: AppColor.whiteA700,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.whiteA700.withOpacity(0.2)),
              padding: const EdgeInsets.all(5),
              child: SvgPicture.asset(
                ImageConstant.shareIcon,
                height: 18,
                width: 18,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.gray300, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Amount",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: AppColor.black900,
                              fontSize: 15),
                        ),
                        widget.subServiceId == 1 || widget.subServiceId == 2
                            ? (rechargeReportInfoResponse
                                        ?.data?[0].statusName ==
                                    "Success"
                                ? SvgPicture.asset(
                                    ImageConstant.successIcon,
                                    height: 30,
                                    width: 30,
                                  )
                                : (rechargeReportInfoResponse
                                            ?.data?[0].statusName ==
                                        "Failed"
                                    ? SvgPicture.asset(
                                        ImageConstant.errorIcon,
                                        height: 30,
                                        width: 30,
                                      )
                                    : SvgPicture.asset(
                                        ImageConstant.pendingIcon,
                                        height: 30,
                                        width: 30,
                                      )))
                            : bbpsReportResponse?.data?[0].status == "Success"
                                ? SvgPicture.asset(
                                    ImageConstant.successIcon,
                                    height: 30,
                                    width: 30,
                                  )
                                : (bbpsReportResponse?.data?[0].status ==
                                        "Failed"
                                    ? SvgPicture.asset(
                                        ImageConstant.errorIcon,
                                        height: 30,
                                        width: 30,
                                      )
                                    : SvgPicture.asset(
                                        ImageConstant.pendingIcon,
                                        height: 30,
                                        width: 30,
                                      ))
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        widget.subServiceId == 1 || widget.subServiceId == 2
                            ? "₹ ${rechargeReportInfoResponse?.data?[0].amount ?? "NA"}"
                            : "₹ ${bbpsReportResponse?.data?[0].rechargeAmount ?? "NA"}",
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                      //  "Rupees ${converter.convertDouble(rechargeReportInfoResponse?.data?[0].rechargeAmount)} only",
                      widget.subServiceId == 1 || widget.subServiceId == 2
                          ? "Rupees ${converter.convertDouble(rechargeReportInfoResponse?.data?[0].amount)} only"
                          : "Rupees ${converter.convertDouble(bbpsReportResponse?.data?[0].rechargeAmount)} only",
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        widget.subServiceId == 1 || widget.subServiceId == 2
                            ? formatDate(rechargeReportInfoResponse
                                ?.data?[0].addDate
                                .toString())
                            : formatDate(bbpsReportResponse?.data?[0].addDate
                                .toString()),
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            color: AppColor.black900,
                            fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.gray300, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "To",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: AppColor.black900,
                          fontSize: 15),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        widget.subServiceId == 1 || widget.subServiceId == 2
                            ? (rechargeReportInfoResponse?.data?[0].heading ??
                                "NA")
                            : bbpsReportResponse?.data?[0].heading ?? "NA",
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.gray300, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order Id",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: AppColor.black900,
                              fontSize: 15),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            widget.subServiceId == 1 || widget.subServiceId == 2
                                ? (rechargeReportInfoResponse
                                        ?.data?[0].transID ??
                                    "NA")
                                : bbpsReportResponse?.data?[0].transID ?? "NA",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                color: AppColor.black900,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transaction Id",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: AppColor.black900,
                              fontSize: 15),
                        ),
                        Container(
                          width: 120,
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            widget.subServiceId == 1 || widget.subServiceId == 2
                                ? (rechargeReportInfoResponse
                                        ?.data?[0].aPITransId ??
                                    "NA")
                                : bbpsReportResponse?.data?[0].operatorID ??
                                    "NA",
                            softWrap: true,
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                color: AppColor.black900,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.gray300, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Amount",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: AppColor.black900,
                              fontSize: 15),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            widget.subServiceId == 1 || widget.subServiceId == 2
                                ? "₹ ${rechargeReportInfoResponse?.data?[0].amount ?? "NA"}"
                                : "₹ ${bbpsReportResponse?.data?[0].rechargeAmount ?? "NA"}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                color: AppColor.black900,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Commission",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: AppColor.black900,
                              fontSize: 15),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            widget.subServiceId == 1 || widget.subServiceId == 2
                                ? "₹ ${rechargeReportInfoResponse?.data?[0].memberCommission ?? "NA"}"
                                : "₹ ${bbpsReportResponse?.data?[0].memberCommission ?? "NA"}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                color: AppColor.black900,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Available Wallet Balance",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: AppColor.black900,
                              fontSize: 15),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            widget.subServiceId == 1 || widget.subServiceId == 2
                                ? "₹ ${rechargeReportInfoResponse?.data?[0].remainingBalance ?? "NA"}"
                                : "₹ ${bbpsReportResponse?.data?[0].remainingBalance ?? "NA"}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                color: AppColor.black900,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  widget.isHome ? goToHome(context) : Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  margin: const EdgeInsets.only(top: 30),
                  decoration: AppDecoration.mainGradient.copyWith(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Back To Home",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: AppColor.whiteA700,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future serviceInfo() async {
    var body = {
      "Action": "Info",
      "Id": widget.id,
      "SubServiceID": widget.subServiceId,
      "StatusId": 0,
      "FromDate": "",
      "ToDate": "",
      "PageIndex": 0,
      "PageSize": 0
    };
    var json = await reportController.reportList(body);

    if (widget.subServiceId == 1 || widget.subServiceId == 2) {
      rechargeReportInfoResponse = RechargeReportInfoResponse.fromJson(json);
      setState(() {});
      if (rechargeReportInfoResponse!.status != true) {
        DialogHelper.showErrorWithBack(
            context: context,
            description: rechargeReportInfoResponse!.message!);
      }
    } else {
      bbpsReportResponse = BBPSReportResponse.fromJson(json);
      setState(() {});
      if (rechargeReportInfoResponse!.status != true) {
        DialogHelper.showErrorWithBack(
            context: context,
            description: rechargeReportInfoResponse!.message!);
      }
    }
  }

  Future<void> generateInvoice(String amount) async {
    final pdf = await BillPdf.generatePdf(
        rechargeReportInfoResponse!.data![0], int.parse(amount));
    final pdfBytes = await pdf.save();
    // savePdf(pdfBytes,
    //     "Bill_Payment_Receipt_${rechargeReportInfoResponse?.data?[0].id ?? "NA"}");
  }

/*Future<void> requestStoragePermission() async {
    if (Platform.isIOS) {
    } else {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      if (deviceInfo.version.sdkInt <= 29) {
        final PermissionStatus status = await Permission.storage.request();
        if (status.isGranted) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const ConvenienceFeeDialog();
              }).then((value) {
            if (value != null) {
              generateInvoice(value);
            }
          });
        } else {
          await openAppSettings();
        }
      } else {
        final PermissionStatus status = await Permission.storage.status;
        if (status.isGranted) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const ConvenienceFeeDialog();
              }).then((value) {
            if (value != null) {
              generateInvoice(value);
            }
          });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const PermissionDialog();
              });
        }
      }
    }
  }*/

/*  Future<void> requestStoragePermission() async {
    if (Platform.isIOS) {
      // TODO: Handle iOS permissions
    } else {
      final PermissionStatus status = await Permission.storage.request();
      if (status.isGranted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const ConvenienceFeeDialog();
          },
        ).then((value) {
          if (value != null) {
            generateInvoice(value);
          }
        });
      } else if (status.isPermanentlyDenied) {
        // The user denied the permission permanently, take appropriate action
        await openAppSettings();
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const PermissionDialog();
          },
        );
      }
    }
  }*/
}
