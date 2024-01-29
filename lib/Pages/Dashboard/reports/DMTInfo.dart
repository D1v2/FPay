import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Network/Models/MoneyTransferReportResponse.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/pdfFormates/MoneyTransferPdf.dart';
import 'package:number_to_character/number_to_character.dart';

import '../../../Network/Controllers/ReportController.dart';
import '../../../Network/Models/MoneyTransferReportData.dart';
import '../../../Utils/ConvenienceDialog.dart';
import '../../../Utils/DialogHelper.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/PermissionDialog.dart';
import '../../../Utils/WidgetsConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class DMTInfo extends StatefulWidget {
  bool isHome;
  int id;
  int subService;

  DMTInfo(
      {Key? key,
      required this.isHome,
      required this.id,
      required this.subService})
      : super(key: key);

  @override
  State<DMTInfo> createState() => _DMTInfoState();
}

class _DMTInfoState extends State<DMTInfo> {
  var converter = NumberToCharacterConverter('en');
  final reportController = ReportController();
  MoneyTransferReportResponse? response;
  MoneyTransferReportData? moneyTransferReportData;
  num totalAmount = 0;

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
        title: Text("DMT Status", style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
        actions: [
          InkWell(
            onTap: ()  {
              DialogHelper.showToast("Coming soon...");
              //requestStoragePermission()
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
                              moneyTransferReportData != null
                                  ? Container(
                                      child: moneyTransferReportData?.status ==
                                              "Success"
                                          ? SvgPicture.asset(
                                              ImageConstant.successIcon,
                                              height: 25,
                                              width: 25,
                                            )
                                          : moneyTransferReportData?.status ==
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
                                                ),
                                    )
                                  : Container()
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              "₹ $totalAmount",
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(
                              moneyTransferReportData != null
                                  ? formatDate(moneyTransferReportData?.addDate
                                      .toString())
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
                                moneyTransferReportData?.memberFirmName ?? "NA",
                                style: AppStyle.txtGotham,
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Remitter Name",
                                  style: AppStyle.txtGotham,
                                ),
                                Text(
                                  moneyTransferReportData?.beneficiaryName ??
                                      "NA",
                                  style: AppStyle.txtGotham,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Remitter Number",
                                style: AppStyle.txtGotham,
                              ),
                              Text(
                                "+91 ${moneyTransferReportData?.remitterNumber ?? "NA"}",
                                style: AppStyle.txtGotham,
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Bank Name",
                                  style: AppStyle.txtGotham,
                                ),
                                Text(
                                  moneyTransferReportData?.bankName ?? "NA",
                                  style: AppStyle.txtGotham,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Account No.",
                                style: AppStyle.txtGotham,
                              ),
                              Text(
                                moneyTransferReportData?.accountNumber ?? "NA",
                                style: AppStyle.txtGotham,
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Transaction Id",
                                  style: AppStyle.txtGotham,
                                ),
                                Text(
                                  moneyTransferReportData?.transferId ?? "NA",
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
                                "₹${moneyTransferReportData?.memberCharge.toString() ?? "NA"}",
                                style: AppStyle.txtGotham,
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Commission",
                                  style: AppStyle.txtGotham,
                                ),
                                Text(
                                  "₹${moneyTransferReportData?.memberCommission.toString() ?? "NA"}",
                                  style: AppStyle.txtGotham,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Available Balance",
                                style: AppStyle.txtGotham,
                              ),
                              Text(
                                "₹${moneyTransferReportData?.remainingBalance.toString() ?? "NA"}",
                                style: AppStyle.txtGotham,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(top: 5),
                child: moneyTransferReportData != null
                    ? itemList()
                    : dataNotFound(),
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
    response = MoneyTransferReportResponse.fromJson(json);
    if (response!.data!.isNotEmpty) {
      moneyTransferReportData = response?.data?[0];
      for (var amount in response!.data!) {
        totalAmount += amount.amount!;
      }
    }

    setState(() {
      if (response!.status != true) {
        DialogHelper.showErrorWithBack(
            context: context, description: response!.message.toString());
      }
    });
  }

  Widget itemList() {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
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
                          style: AppStyle.formLabelHeading,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            response?.data?[index].transactionId ?? "NA",
                            style: AppStyle.formLabelHeading,
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Amount",
                          style: AppStyle.formLabelHeading,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            "₹${response?.data?[index].amount ?? "NA"}",
                            style: AppStyle.formLabelHeading,
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status",
                          style: AppStyle.formLabelHeading,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            response?.data?[index].status.toString() ?? "NA",
                            style: AppStyle.formLabelHeading,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: response!.data!.length));
  }

  Future<void> generateInvoice(String amount) async {
    var pdf = await MoneyTransferPdf.generatePdf(response!,
        moneyTransferReportData!, totalAmount, widget.id, int.parse(amount));
    final pdfBytes = await pdf.save();
   // savePdf(pdfBytes, "Money_Transfer_${widget.id}");
  }

  /*Future<void> requestStoragePermission() async {
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
        // The user denied the permission, handle it accordingly
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const PermissionDialog();
          },
        );
      }
    }
  }
*/
/*Future<void> requestStoragePermission() async {
    if (Platform.isIOS) {
      //TODO
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
}
