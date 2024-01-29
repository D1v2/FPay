import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpay/Network/Controllers/AepsControllers.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Models/DropDownMasterResponse.dart';
import '../../../Network/Models/HomeIconsResponse.dart';
import '../../../Utils/DialogHelper.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';
import '../../../Utils/math_utils.dart';

class AepsFillDetail extends StatefulWidget {
  AepsFillDetail({Key? key}) : super(key: key);

  @override
  State<AepsFillDetail> createState() => _AepsFillDetailState();
}

class _AepsFillDetailState extends State<AepsFillDetail> {
  HomeIconsData? homeIconsData;
  DropDownMasterData? dropDownMasterData;

  static const aepsChannel = MethodChannel('aeps');
  final aepsController = AepsControllers();
  CommonResponse response = CommonResponse();

  TextEditingController aadhaarCardNumber = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColor.lightBlue800,
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
        title: Text(homeIconsData!.serviceName!,
            style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 2,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Selected Bank",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: AppColor.gray500),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                ImageConstant.bankSVGIcon,
                                height: 30,
                                width: 30,
                                color: AppColor.blue500,
                              ),
                              Flexible(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 15, left: 10),
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: true,
                                        dropDownMasterData!.name!,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: AppColor.gray500),
                                      )))
                            ],
                          ),
                        ),
                        /*InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_drop_down_sharp),
                        )*/
                      ],
                    ),
                  )
                ],
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fill Details",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          color: AppColor.gray400),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(
                        "Aadhaar Card Number",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.gray700),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: TextField(
                        controller: aadhaarCardNumber,
                        keyboardType: TextInputType.number,
                        maxLength: 12,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLines: 1,
                        decoration: InputDecoration(
                            counterText: "",
                            hintText: "0000-0000-0000",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(
                        "Mobile Number",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.gray700),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLines: 1,
                        controller: mobileNumber,
                        decoration: InputDecoration(
                            counterText: "",
                            prefixIcon: const Icon(Icons.phone_android),
                            hintText: "0000-0000-0000",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          color: AppColor.gray500),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        maxLines: 1,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: amount,
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            counterText: "",
                            prefixIcon: const Icon(
                              Icons.currency_rupee,
                              color: Colors.black,
                            ),
                            hintText: "00",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  onConfirm();
                },
                child: Container(
                    height: (65.00),
                    margin: const EdgeInsets.only(
                        left: 23, top: 30, right: 23, bottom: 30),
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
                                        height: 30,
                                        width: 30,
                                        margin: const EdgeInsets.all(14),
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
                            child: Text("confirm".toUpperCase(),
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
  }

  onConfirm() {
    if (aadhaarCardNumber.value.text.toString().length != 12) {
      DialogHelper.errorSnackBar(
          context, "Please enter valid aadhaar card number");
    } else if (mobileNumber.value.text.toString().isEmpty) {
      DialogHelper.errorSnackBar(context, "Mobile number can not be empty");
    } else if (!isMobileNumber(mobileNumber.value.text.toString())) {
      DialogHelper.errorSnackBar(context, "Please enter valid mobile number");
    } else if (amount.value.text.toString().isEmpty) {
      DialogHelper.errorSnackBar(context, "Please enter amount");
    } else if (int.parse(amount.value.text.toString()) < 1) {
      DialogHelper.errorSnackBar(context, "Please enter valid amount");
    } else {
      showModalBottomSheet(
          constraints: BoxConstraints.loose(Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.35)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          context: context,
          builder: (context) => bottomSheet());
    }
  }

  Widget bottomSheet() => Container(
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
        child: Column(
          children: [
            const Text(
              "Select Your Device",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins'),
            ),
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent.withOpacity(0.07),
              ),
              margin: const EdgeInsets.only(top: 20),
              padding:
                  const EdgeInsets.only(left: 10, top: 7, bottom: 7, right: 10),
              child: Text(
                "Note: Please install the application related to your device and registered your mobile.",
                style: TextStyle(color: AppColor.gray600, fontSize: 12),
              ),
            ),
            InkWell(
              onTap: () {
                scanFingerPrint("Morpho");
              },
              child: Container(
                margin: const EdgeInsets.only(top: 23),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: AppColor.lightBlue801, width: 0.8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.phone_android_outlined, size: 20),
                        Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Morpho",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: AppColor.gray600),
                            ))
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                scanFingerPrint("Mantra");
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: AppColor.lightBlue801, width: 0.8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.phone_android_outlined, size: 20),
                        Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Mantra",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: AppColor.gray600),
                            ))
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Future scanFingerPrint(String device) async {
    if (aadhaarCardNumber.text.toString().isEmpty ||
        aadhaarCardNumber.text.toString().length != 12) {
      DialogHelper.showToast("Please enter valid aadhaar number");
    } else if (mobileNumber.text.toString().isEmpty ||
        mobileNumber.text.toString().length != 10) {
      DialogHelper.showToast("Please enter valid mobile number");
    } else if (amount.text.toString().isEmpty ||
        int.parse(amount.text.toString()) < 1) {
      DialogHelper.showToast("Please enter valid amount");
    } else {
      var arguments = {'device': device};
      var data = await aepsChannel.invokeMethod('AEPSPIDDATA', arguments);
      setState(() {
        if (data.substring(0, 1) == "0") {
          Navigator.pop(context);
          aepsDialog(data.substring(2));
        } else {
          DialogHelper.showErrorDialog(description: data.substring(2));
        }
      });
    }
  }

  aepsDialog(String pidData) {
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.verified_outlined,
                  size: 100,
                  color: Colors.green,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Text(
                      "Finger scanned successfully !!",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.lightBlue801),
                        onPressed: () {
                          if (Get.isDialogOpen == true) Get.back();
                          showModalBottomSheet(
                              constraints: BoxConstraints.loose(Size(
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height * 0.35)),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              context: context,
                              builder: (context) => bottomSheet());
                        },
                        child: Text(
                          "Retry Again",
                          style: TextStyle(color: AppColor.whiteA700),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.lightBlue801),
                        onPressed: () {
                          if (Get.isDialogOpen == true) Get.back();
                          doAeps(pidData);
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(color: AppColor.whiteA700),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  doAeps(String pidData) async {
    var body = {
      "SubServiceID": homeIconsData!.id,
      "BankId": dropDownMasterData!.id,
      "MobileNumber": mobileNumber.text.toString(),
      "AdhaarNumber": aadhaarCardNumber.text.toString(),
      "Amount": amount.text.toString(),
      "IpAddress": ":1",
      "PidData": pidData
    };
    var json = await aepsController.doAeps(body);
    response = CommonResponse.fromJson(json);
    if (response.status == true) {
      DialogHelper.showSuccessWithBack(
          context: context, description: "Transaction is successfully");
    } else {
      DialogHelper.showErrorDialog(description: response.message!);
    }
  }
}
