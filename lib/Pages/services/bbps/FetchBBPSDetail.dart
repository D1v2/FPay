import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Controllers/BBPSControllers.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Models/BBPSInfoResponse.dart';
import '../../../Network/Models/BBPSResponse.dart';
import '../../../Network/Models/HomeIconsResponse.dart';
import '../../../Network/Models/RechargeReportInfoResponse.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';
import '../../../Utils/math_utils.dart';
import '../../Common/SecurityPin.dart';

class FetchBBPSDetail extends StatefulWidget {
  FetchBBPSDetail({Key? key}) : super(key: key);

  @override
  State<FetchBBPSDetail> createState() => _FetchBBPSDetailState();
}

class _FetchBBPSDetailState extends State<FetchBBPSDetail> {
  late BBPSData? bbpsData;
  late HomeIconsData homeIconsData;
  final TextEditingController amountController = TextEditingController();

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();

  final controller = BBPSControllers();
  BBPSInfoResponse? bbpsInfoResponse;
  RechargeReportInfoResponse? commonResponse;

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> arguments = Get.arguments;
    bbpsData = arguments['listData'];
    homeIconsData = arguments['iconData'];
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
            margin: const EdgeInsets.only(left: 20),
            child: Align(
              child: InkWell(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          title: Text(
            bbpsData?.operatorName ?? "NA",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith(),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.formBackGround),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  bbpsData?.displayName1 != null
                      ? Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 20),
                                alignment: Alignment.topLeft,
                                child: Text(bbpsData?.displayName1 ?? "NA")),
                            Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 10),
                              padding: const EdgeInsets.only(top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                  color: AppColor.whiteA700,
                                  border: Border.all(
                                      color: AppColor.whiteA700, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                maxLines: 1,
                                maxLength: 50,
                                controller: controller1,
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: bbpsData?.name1 ?? "Enter here...",
                                  hintStyle: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                  contentPadding: const EdgeInsets.all(10),
                                  counterText: '',
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  bbpsData?.displayName2 != null
                      ? Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 20),
                                alignment: Alignment.topLeft,
                                child: Text(bbpsData?.displayName2 ?? "NA")),
                            Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 10),
                              padding: const EdgeInsets.only(top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                  color: AppColor.whiteA700,
                                  border: Border.all(
                                      color: AppColor.whiteA700, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                maxLines: 1,
                                maxLength: 50,
                                controller: controller2,
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: bbpsData?.name2 ?? "Enter here...",
                                  hintStyle: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                  contentPadding: const EdgeInsets.all(10),
                                  counterText: '',
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  bbpsData?.displayName3 != null
                      ? Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 20),
                                alignment: Alignment.topLeft,
                                child: Text(bbpsData?.displayName3 ?? "NA")),
                            Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 10),
                              padding: const EdgeInsets.only(top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                  color: AppColor.whiteA700,
                                  border: Border.all(
                                      color: AppColor.whiteA700, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                maxLines: 1,
                                maxLength: 50,
                                controller: controller3,
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: bbpsData?.name3 ?? "Enter here...",
                                  hintStyle: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                  contentPadding: const EdgeInsets.all(10),
                                  counterText: '',
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  bbpsData?.displayName4 != null
                      ? Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 20),
                                alignment: Alignment.topLeft,
                                child: Text(bbpsData?.displayName4 ?? "NA")),
                            Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 10),
                              padding: const EdgeInsets.only(top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                  color: AppColor.whiteA700,
                                  border: Border.all(
                                      color: AppColor.whiteA700, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                maxLines: 1,
                                maxLength: 50,
                                controller: controller4,
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: bbpsData?.name4 ?? "Enter here...",
                                  hintStyle: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                  contentPadding: const EdgeInsets.all(10),
                                  counterText: '',
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  bbpsData?.displayName5 != null
                      ? Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 20),
                                alignment: Alignment.topLeft,
                                child: Text(bbpsData?.displayName5 ?? "NA")),
                            Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 10),
                              padding: const EdgeInsets.only(top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                  color: AppColor.whiteA700,
                                  border: Border.all(
                                      color: AppColor.whiteA700, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                maxLines: 1,
                                maxLength: 50,
                                controller: controller5,
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: bbpsData?.name5 ?? "Enter here...",
                                  hintStyle: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                  contentPadding: const EdgeInsets.all(10),
                                  counterText: '',
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: const Text("Mobile Number")),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 10),
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        decoration: BoxDecoration(
                            color: AppColor.whiteA700,
                            border:
                                Border.all(color: AppColor.whiteA700, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          maxLines: 1,
                          controller: mobileNumber,
                          maxLength: 10,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: "Enter Mobile Number",
                            hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                            contentPadding: EdgeInsets.all(10),
                            counterText: '',
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () => fetchDetail(),
                      child: Container(
                          margin: const EdgeInsets.only(
                              left: 23, top: 10, right: 23, bottom: 10),
                          child: Stack(alignment: Alignment.center, children: [
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
                                              margin: const EdgeInsets.all(5),
                                              variant: IconButtonVariant
                                                  .OutlineWhiteA701,
                                              shape: IconButtonShape
                                                  .CircleBorder15,
                                              padding:
                                                  IconButtonPadding.PaddingAll8,
                                              alignment: Alignment.centerRight,
                                              child: CommonImageView(
                                                  svgPath:
                                                      ImageConstant.moveIcon))
                                        ]))),
                            Align(
                              alignment: Alignment.center,
                              child: Text("confirm".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold16
                                      .copyWith(letterSpacing: 1.00)),
                            )
                          ]))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchDetail() async {
    if (bbpsData?.regex1 != null &&
        !validValue(controller1.value.text.toString(), bbpsData!.regex1!)) {
      DialogHelper.showToast("Please check your ${bbpsData?.displayName1}");
    } else if (bbpsData?.regex2 != null &&
        !validValue(controller2.value.text.toString(), bbpsData!.regex2!)) {
      DialogHelper.showToast("Please check your ${bbpsData?.displayName2}");
    } else if (bbpsData?.regex3 != null &&
        !validValue(controller3.value.text.toString(), bbpsData!.regex3!)) {
      DialogHelper.showToast("Please check your ${bbpsData?.displayName3}");
    } else if (bbpsData?.regex4 != null &&
        !validValue(controller4.value.text.toString(), bbpsData!.regex4!)) {
      DialogHelper.showToast("Please check your ${bbpsData?.displayName4}");
    } else if (bbpsData?.regex5 != null &&
        !validValue(controller5.value.text.toString(), bbpsData!.regex5!)) {
      DialogHelper.showToast("Please check your ${bbpsData?.displayName5}");
    } else {
      var body = {
        "SubServiceId": homeIconsData.id,
        "operatorId": bbpsData!.operatorID.toString(),
        "caNumber": controller1.value.text.toString(),
        "mobileNo": mobileNumber.value.text.toString(),
        "Ad1": controller2.value.text.toString(),
        "Ad2": controller3.value.text.toString(),
        "Ad3": controller4.value.text.toString(),
        "Ad4": controller5.value.text.toString(),
      };
      var json = await controller.fetchDetail(body);
      bbpsInfoResponse = BBPSInfoResponse.fromJson(json);
      if (bbpsInfoResponse!.status == true) {
        showBottomSheet(bbpsInfoResponse!.data!);
      } else {
        DialogHelper.showErrorDialog(
            description: bbpsInfoResponse!.message.toString());
      }
      setState(() {});
    }
  }

  Future showBottomSheet(BBPSInfoData data) {
    amountController.value = TextEditingValue(text: data.billAmount ?? "0");
    return showModalBottomSheet(
        context: context,
        constraints: BoxConstraints.loose(Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.45)),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.gray500,
                      ),
                    ),
                  ),
                  Text(
                    "Bill Details",
                    style: AppStyle.normalLabelHeading.copyWith(fontSize: 18),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray503, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            ImageConstant.bbpsLogo,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  data.operatorName ?? "NA",
                                  softWrap: true,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.normalLabelHeading
                                      .copyWith(fontSize: 13),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Text(
                                      "Bill No : ${controller1.value.text}",
                                      style: AppStyle.normalLabelHeading
                                          .copyWith(color: Colors.green),
                                    )),
                                Text(
                                  "Name : ${data.customerName ?? "NA"}",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.normalLabelHeading
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                data.billUnit.isNull || data.billUnit!.isEmpty
                                    ? Container()
                                    : Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Bill Unit : ${data.billUnit ?? "NA"}",
                                          style: AppStyle.normalLabelHeading
                                              .copyWith(
                                                  color: AppColor.gray600),
                                        )),
                                data.billDueDate.isNull ||
                                        data.billDueDate!.isEmpty
                                    ? Container()
                                    : Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Due Date : ${data.billDueDate ?? "NA"}",
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle.normalLabelHeading
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.red),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray503, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Amount",
                          style: AppStyle.normalLabelHeading,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.gray503.withOpacity(0.3),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            controller: amountController,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              enabled:
                                  bbpsData?.isPartialPay == true ? true : false,
                              hintText: 'Mobile Number',
                              fillColor: AppColor.gray50,
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: (16.00), minHeight: (16.00)),
                              counterText: '',
                              prefixIcon: Container(
                                  margin: const EdgeInsets.only(
                                    left: 18,
                                    right: 14,
                                  ),
                                  child: const Icon(Icons.currency_rupee)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => pin(data),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2-16,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                color: AppColor.lightBlue801,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Pay",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: AppColor.whiteA700.withOpacity(0.8)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => {Navigator.pop(context)},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2-16,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                color: AppColor.gray503.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(18)),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: AppColor.black901.withOpacity(0.8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future pin(BBPSInfoData data) async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecurityPin()),
    );
    if (results.containsKey("pin") && results.isNotEmpty) {
      setState(() {
        hitApi(results["pin"], data);
      });
    }
  }

  Future hitApi(String mPin, BBPSInfoData data) async {
    var body = {
      "OperatorID": data.operatorID,
      "SubServiceID": data.subServiceID,
      "MobileNo": data.mobileNo,
      "CaNumber": data.caNumber,
      "Email": data.email,
      "Amount": amountController.value.text,
      "FetchBillId": data.fetchBillId,
      "LicvalidationId": data.licvalidationId,
      "LicbillId": data.licbillId,
      "LicbillNumber": data.licbillNumber,
      "CustomerName": data.customerName,
      "BillAmount": amountController.value.text,
      "Billdate": DateFormat('dd-MM-yyyy').format(DateTime.now()),
      "BillDueDate": data.billDueDate,
      "tPass": mPin
    };

    var json = await controller.payBBPSBill(body);
    commonResponse = RechargeReportInfoResponse.fromJson(json);

    if (commonResponse?.status == true) {
      Get.offNamed('/success', arguments: {
        'serviceName': "BBPS",
        'id': commonResponse?.data?[0].id ?? 0,
        'amount': amountController.value.text.toString(),
        'msg': commonResponse!.data![0].heading ?? "NA",
        'subServiceId': int.parse(homeIconsData.id ?? "0")
      });
    } else {
      if (commonResponse?.code == 1001) {
        DialogHelper.showErrorDialog(
            description: commonResponse!.message.toString());
      } else {
        if (commonResponse!.message! == "Insufficient Balance !") {
          DialogHelper.showErrorDialog(description: commonResponse!.message!);
        } else {
          Get.offNamed('/failed', arguments: {
            'serviceName': "BBPS",
            'id': commonResponse?.data?[0].id ?? 0,
            'amount': amountController.value.text.toString(),
            'msg': commonResponse!.data![0].heading ?? "NA",
            'subServiceId': int.parse(homeIconsData.id ?? "0")
          });
        }
      }
    }
  }
}
