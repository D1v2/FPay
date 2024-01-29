import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fpay/Network/Controllers/PayoutController.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Network/Models/QrCodeResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/app_style.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Network/ApiConstants.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  var payoutController = PayoutController();
  QrCodeResponse? commonResponse;
  CommonResponse? accountResponse;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => fetchQrCode());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: AppDecoration.gradientLightblue800Blue500.copyWith(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Text(
                        "My QR Code",
                        style: AppStyle.normalLabelHeading
                            .copyWith(fontSize: 16, color: Colors.white),
                      ),
                      InkWell(
                        onTap: () => {DialogHelper.showToast("Coming soon...")},
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.whiteA700.withOpacity(0.3)),
                            ),
                            Icon(
                              Icons.share,
                              color: AppColor.whiteA700,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    margin: const EdgeInsets.only(top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageConstant.logoQrCode),
                        Container(
                          height: 1,
                          width: 150,
                          margin: const EdgeInsets.only(top: 15, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.gray500),
                        ),
                        (commonResponse?.data != null &&
                                commonResponse?.data?.qrCode != null)
                            ? Image.memory(Uint8List.fromList(base64Decode(
                                commonResponse!.data!.qrCode!.split(',').last)))
                            : Container(),
                        commonResponse?.data?.upi != null
                            ? Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "${commonResponse?.data?.upi}",
                                  style: AppStyle.formLabelHeading
                                      .copyWith(fontSize: 18),
                                ),
                              )
                            : Container(),
                        (commonResponse?.data == null &&
                                commonResponse?.data?.qrCode == null)
                            ? InkWell(
                                onTap: () {
                                  createAccount("CreateVpa");
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.lightBlue801),
                                  child: Text(
                                    "Create Your UPI",
                                    style: AppStyle.formLabelHeading.copyWith(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              )
                            : Container(),
                        (commonResponse?.data != null &&
                                (commonResponse?.data?.qrCode == "" ||
                                    commonResponse?.data?.qrCode == null))
                            ? InkWell(
                                onTap: () {
                                  createAccount("GenerateQrCode");
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.lightBlue801),
                                  child: Text(
                                    "Generate Your QR Code",
                                    style: AppStyle.formLabelHeading.copyWith(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              )
                            : Container(),
                        // (commonResponse?.data == null ||
                        //         commonResponse?.data?.accountNumber == null)
                        //     ? Container(
                        //         margin: const EdgeInsets.only(top: 10),
                        //         alignment: Alignment.center,
                        //         padding: const EdgeInsets.only(top: 10, bottom: 10),
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(10),
                        //             color: AppColor.lightBlue801),
                        //         child: Text(
                        //           "Create Your Account",
                        //           style: AppStyle.formLabelHeading.copyWith(
                        //               color: Colors.white, fontSize: 15),
                        //         ),
                        //       )
                        //     : Container()
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Name : ${commonResponse?.data?.upiHolderName ?? "NA"}",
                      style: AppStyle.formLabelHeading.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  DialogHelper.showToast("Coming soon...");
                },
                child: Container(
                    height: (60.00),
                    margin: const EdgeInsets.only(
                        left: 23, top: 20, right: 23, bottom: 30),
                    child: Stack(alignment: Alignment.center, children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              decoration: AppDecoration
                                  .gradientLightblue800Blue500
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder15),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomIconButton(
                                        height: 25,
                                        width: 25,
                                        margin: const EdgeInsets.all(10),
                                        variant:
                                            IconButtonVariant.OutlineWhiteA701,
                                        shape: IconButtonShape.CircleBorder15,
                                        padding: IconButtonPadding.PaddingAll8,
                                        alignment: Alignment.centerRight,
                                        child: CommonImageView(
                                            svgPath: ImageConstant.moveIcon))
                                  ]))),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 40, top: 21, right: 40, bottom: 20),
                            child: Text("download".toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsSemiBold16
                                    .copyWith(letterSpacing: 1.00))),
                      )
                    ]))),
            Center(
              child: Text(
                "Scan and Pay with any BHIM UPI App",
                style: AppStyle.formLabelHeading.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColor.gray600),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future fetchQrCode() async {
    var json = await payoutController.autoCollectorList();
    commonResponse = QrCodeResponse.fromJson(json);
    if (commonResponse?.status == true) {
    } else {
      DialogHelper.showErrorDialog(
          description: commonResponse!.message.toString());
    }
    setState(() {});
  }

  Future createAccount(String actionName) async {
    var json = await payoutController.doAutoCollector(actionName);
    accountResponse = CommonResponse.fromJson(json);
    if (accountResponse?.status == true) {
      DialogHelper.showToast(accountResponse!.message.toString());
      fetchQrCode();
    } else {
      DialogHelper.showErrorDialog(
          description: accountResponse!.message.toString());
    }
  }
}
