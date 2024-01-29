import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpay/Utils/DialogHelper.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/ReportController.dart';
import '../../../Network/Models/ReportApesResponse.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class AepsInfo extends StatefulWidget {
  bool isHome;
  int id;
  int subService;

  AepsInfo(
      {Key? key,
      required this.isHome,
      required this.id,
      required this.subService})
      : super(key: key);

  @override
  State<AepsInfo> createState() => _AepsInfoState();
}

class _AepsInfoState extends State<AepsInfo> {
  final reportController = ReportController();
  ReportApesResponse? reportApesResponse;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((value) => info());
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
              child: Icon(
                Icons.arrow_back,
                color: AppColor.whiteA700,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text("Aeps",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              reportApesResponse?.data?[0].apiMessage ?? "NA",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: reportApesResponse?.data?[0].status == "Success"
                      ? AppColor.greenA700
                      : AppColor.red600),
            ),
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
                    padding: const EdgeInsets.all( 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            reportApesResponse?.data?[0].status == "Success"
                                ? SvgPicture.asset(ImageConstant.successIcon)
                                : reportApesResponse?.data?[0].status ==
                                        "Failed"
                                    ? SvgPicture.asset(ImageConstant.errorIcon)
                                    : SvgPicture.asset(
                                        ImageConstant.pendingIcon,
                                        height: 28,
                                        width: 28,
                                      )
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            "₹ ${widget.subService == 21 ? reportApesResponse?.data![0].customerRemainingBalance : reportApesResponse?.data?[0].amount}",
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Colors.black),
                          ),
                        ),
                        Text(
                          reportApesResponse != null
                              ? formatDate(
                                  reportApesResponse?.data?[0].addDate ??
                                      "NA".toString())
                              : "NA",
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black),
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
                              "Bank Name",
                              style: AppStyle.txtGotham,
                            ),
                            Text(
                              reportApesResponse?.data![0].bankName ?? "NA",
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
                                "Aadhaar No ",
                                style: AppStyle.txtGotham,
                              ),
                              Text(
                                reportApesResponse?.data![0].adhaarNumber ??
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
                              "Mobile Number",
                              style: AppStyle.txtGotham,
                            ),
                            Text(
                              reportApesResponse?.data![0].mobileNumber ?? "NA",
                              style: AppStyle.txtGotham,
                            ),
                          ],
                        ),
                        widget.subService != 21
                            ? Container(
                                margin: const EdgeInsets.only(top: 12, bottom: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Remaining Balance",
                                      style: AppStyle.txtGotham,
                                    ),
                                    Text(
                                      "₹  ${reportApesResponse?.data![0].remainingBalance ?? "NA"}",
                                      style: AppStyle.txtGotham,
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        widget.subService != 21
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Transaction Id",
                                    style: AppStyle.txtGotham,
                                  ),
                                  Text(
                                    reportApesResponse?.data![0].refId ?? "NA",
                                    style: AppStyle.txtGotham,
                                  ),
                                ],
                              )
                            : Container(),
                        widget.subService != 21
                            ? Container(
                                margin: const EdgeInsets.only(top: 12, bottom: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Commission",
                                      style: AppStyle.txtGotham,
                                    ),
                                    Text(
                                      "₹  ${reportApesResponse?.data![0].memberCommission ?? "NA"}",
                                      style: AppStyle.txtGotham,
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        widget.subService != 21
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Available Balance",
                                    style: AppStyle.txtGotham,
                                  ),
                                  Text(
                                    "₹ ${reportApesResponse?.data![0].remainingBalance ?? "NA"}",
                                    style: AppStyle.txtGotham,
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(15),
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
                        style: AppStyle.txtGotham,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          reportApesResponse?.data![0].aPIName ?? "NA",
                          style: AppStyle.txtGotham,
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
                        style: AppStyle.txtGotham,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          reportApesResponse?.data?[0].status ?? "NA",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gotham',
                              color: reportApesResponse?.data?[0].status ==
                                      "Success"
                                  ? AppColor.greenA700
                                  : AppColor.red600,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
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
    ));
  }

  Future info() async {
    var body = {
      "Action": "Info",
      "Id": widget.id,
      "SubServiceID": widget.subService,
      "StatusId": 0,
      "FromDate": "",
      "ToDate": "",
      "PageIndex": 1,
      "PageSize": 10
    };
    var json = await reportController.reportList(body);
    reportApesResponse = ReportApesResponse.fromJson(json);
    if (reportApesResponse!.status != true) {
      DialogHelper.showErrorWithBack(
          context: context, description: reportApesResponse!.message!);
    }
    setState(() {});
  }
}
