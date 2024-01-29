import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Network/Models/PayoutReportResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/PermissionDialog.dart';
import 'package:fpay/Utils/pdfFormates/BankPdf.dart';
import 'package:fpay/Utils/pdfFormates/UpiPdf.dart';
import 'package:number_to_character/number_to_character.dart';

import '../../../Network/Controllers/ReportController.dart';
import '../../../Utils/ConvenienceDialog.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class PayoutInfo extends StatefulWidget {
  bool isHome;
  int id;
  int subService;

  PayoutInfo(
      {Key? key,
      required this.isHome,
      required this.id,
      required this.subService})
      : super(key: key);

  @override
  State<PayoutInfo> createState() => _PayoutInfoState();
}

class _PayoutInfoState extends State<PayoutInfo> {
  final reportController = ReportController();
  var converter = NumberToCharacterConverter('en');
  PayoutReportResponse? response;

  // final _screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => information());
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
        leading: Align(
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              widget.isHome ? goToHome(context) : Navigator.pop(context);
            },
          ),
        ),
        title: Text("Payout", style: AppStyle.txtPoppinsBold18.copyWith()),
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
          InkWell(
            onTap: () => _takeScreenshot(),
            child: Container(
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
                )),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColor.gray300, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Amount",
                                style: AppStyle.normalLabelHeading
                                    .copyWith(fontSize: 15),
                              ),
                              response?.data != null
                                  ? Container(
                                      child:
                                          response?.data?[0].status == "Success"
                                              ? SvgPicture.asset(
                                                  ImageConstant.successIcon,
                                                  height: 25,
                                                  width: 25,
                                                )
                                              : response?.data?[0].status ==
                                                      "Failed"
                                                  ? SvgPicture.asset(
                                                      ImageConstant.errorIcon,
                                                      height: 25,
                                                      width: 25,
                                                    )
                                                  : SvgPicture.asset(
                                                      ImageConstant.pendingIcon,
                                                      height: 28,
                                                      width: 28,
                                                    ))
                                  : Container(),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              response?.data != null
                                  ? "₹${response?.data?[0].amount ?? "NA"}"
                                  : "NA",
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                            response?.data != null
                                ? "Rupees ${converter.convertDouble(response?.data?[0].amount)} only"
                                : "NA",
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(
                              response?.data != null
                                  ? formatDate(
                                      response?.data?[0].addDate.toString())
                                  : "NA",
                              style: AppStyle.formLabelHeading,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: AppColor.formBackGround,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Shop Name",
                                style: AppStyle.txtGotham,
                              ),
                              Text(
                                response?.data != null
                                    ? "${response?.data?[0].memberFirmName ?? "NA"}"
                                    : "NA",
                                style: AppStyle.txtGotham,
                              ),
                            ],
                          ),
                          widget.subService != 26
                              ? Container(
                                  margin: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Bank Name",
                                        style: AppStyle.txtGotham,
                                      ),
                                      Text(
                                        response?.data != null
                                            ? "${response?.data?[0].bankName ?? "NA"}"
                                            : "NA",
                                        style: AppStyle.txtGotham,
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                          Container(
                            margin: widget.subService == 26
                                ? const EdgeInsets.only(top: 12)
                                : const EdgeInsets.only(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Account No.",
                                  style: AppStyle.txtGotham,
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    response?.data != null
                                        ? "${response?.data?[0].number ?? "NA"}"
                                        : "NA",
                                    textAlign: TextAlign.end,
                                    softWrap: true,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyle.txtGotham,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Holder Name",
                                  style: AppStyle.txtGotham,
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    response?.data != null
                                        ? "${response?.data?[0].accountHolderName ?? "NA"}"
                                        : "NA",
                                    textAlign: TextAlign.end,
                                    softWrap: true,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyle.txtGotham,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Transaction Id",
                                  style: AppStyle.txtGotham,
                                ),
                                Text(
                                  response?.data != null
                                      ? "${response?.data?[0].referenceId ?? "NA"}"
                                      : "NA",
                                  style: AppStyle.txtGotham,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Charges",
                                style: AppStyle.txtGotham,
                              ),
                              Text(
                                response?.data != null
                                    ? "₹ ${response?.data?[0].memberCharge ?? "NA"}"
                                    : "NA",
                                style: AppStyle.txtGotham,
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Available Balance",
                                  style: AppStyle.txtGotham,
                                ),
                                Text(
                                  response?.data != null
                                      ? "₹ ${response?.data?[0].remainingBalance ?? "NA"}"
                                      : "NA",
                                  style: AppStyle.txtGotham,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColor.gray300, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Operation Id",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: AppColor.black900,
                              fontSize: 15),
                        ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            response?.data != null
                                ? "${response?.data?[0].apiTxnId ?? "NA"}"
                                : "NA",
                            softWrap: true,
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                color: AppColor.black900),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status",
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
                            response?.data != null
                                ? "${response?.data?[0].status ?? "NA"}"
                                : "NA",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                color: response?.data != null &&
                                        response?.data?[0].status == "Success"
                                    ? AppColor.greenA700
                                    : response?.data != null &&
                                            response?.data?[0].status ==
                                                "Failed"
                                        ? AppColor.red600
                                        : AppColor.gray600,
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
                    "Done",
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

  Future information() async {
    var body = {
      "Action": "Info",
      "Id": widget.id,
      "SubServiceID": widget.subService,
      "StatusId": 0,
      "FromDate": "",
      "ToDate": "",
      "PageIndex": 0,
      "PageSize": 0
    };
    var json = await reportController.reportList(body);

    response = PayoutReportResponse.fromJson(json);
    setState(() {
      if (response!.status != true) {
        DialogHelper.showErrorWithBack(
            context: context, description: response!.message.toString());
      }
    });
  }

  Future<void> generateInvoice(String amount) async {
    var pdf;
    if (response?.data?[0].subServiceId == 25) {
      pdf = await BankPdf.generatePdf(response!.data![0], int.parse(amount));
    } else if (response?.data?[0].subServiceId == 26) {
      pdf = await UpiPdf.generatePdf(response!.data![0], int.parse(amount));
    }
    final pdfBytes = await pdf.save();
    //  savePdf(pdfBytes, "Payout_Receipt_${response?.data?[0].id ?? "NA"}");
  }

  /* Future<void> requestStoragePermission() async {
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
      } else {
        await openAppSettings();
      }
    }
  }*/

  // Future<void> requestStoragePermission() async {
  //   if (Platform.isIOS) {
  //     //TODO
  //   } else {
  //     final deviceInfo = await DeviceInfoPlugin().androidInfo;
  //     if (deviceInfo.version.sdkInt <= 29) {
  //       //  final PermissionStatus status = await Permission.storage.request();
  //       final PermissionStatus status =
  //           await Permission.manageExternalStorage.request();
  //       if (status.isGranted) {
  //         showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return const ConvenienceFeeDialog();
  //             }).then((value) {
  //           if (value != null) {
  //             generateInvoice(value);
  //           }
  //         });
  //       } else {
  //         await openAppSettings();
  //       }
  //     } else {
  //       final PermissionStatus status = await Permission.storage.status;
  //       if (status.isGranted) {
  //         showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return const ConvenienceFeeDialog();
  //             }).then((value) {
  //           if (value != null) {
  //             generateInvoice(value);
  //           }
  //         });
  //       } else {
  //         showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return const PermissionDialog();
  //             });
  //       }
  //     }
  //   }
  // }

  void _takeScreenshot() async {
    // Capture the current screen and save the image to the device's storage
    // final image = await screenShotController.capture(
    //  delay: const Duration(milliseconds: 10));

    // Do something with the captured image (e.g., save to the gallery or display it)
    // Note: The image variable holds the captured image as a Uint8List.
  }
}

// {Action: Info, Id: 13623, SubServiceID: 0, StatusId: 0, FromDate: , ToDate: , PageIndex: 0, PageSize: 0}
// {data: [], status: true, code: 200, message: success}
