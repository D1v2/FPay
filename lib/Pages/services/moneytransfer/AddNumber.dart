import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Controllers/MoneyTransferController.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Models/HomeIconsResponse.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';
import '../../../Utils/math_utils.dart';

class AddNumber extends StatefulWidget {
  const AddNumber({Key? key}) : super(key: key);

  @override
  State<AddNumber> createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  CommonResponse? commonResponse, otpVerifyRes;
  final controller = MoneyTransferController();

  late HomeIconsData? homeIconsData;

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> arguments = Get.arguments;
    homeIconsData = arguments['iconData'];
    mobileNumber.value = TextEditingValue(text: arguments['number']);
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
                Navigator.pop(context);
              },
            ),
          ),
          title: Text("Add Your Number",
              style: AppStyle.txtPoppinsBold18.copyWith()),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.formBackGround),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Mobile Number",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 15),
                        decoration: BoxDecoration(
                            color: AppColor.whiteA700,
                            border:
                                Border.all(color: AppColor.whiteA700, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          controller: mobileNumber,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: 'Enter Mobile Number',
                            hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                            contentPadding: EdgeInsets.all(10),
                            counterText: '',
                          ),
                        ),
                      ),
                      const Text(
                        "First Name",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 15),
                        decoration: BoxDecoration(
                            color: AppColor.whiteA700,
                            border:
                                Border.all(color: AppColor.whiteA700, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: firstName,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: 'Enter First Number',
                            hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                            contentPadding: EdgeInsets.all( 10),
                            counterText: '',
                          ),
                        ),
                      ),
                      const Text(
                        "Last Name",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 15),
                        decoration: BoxDecoration(
                            color: AppColor.whiteA700,
                            border:
                                Border.all(color: AppColor.whiteA700, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: lastName,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: 'Enter Last Number',
                            hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                            contentPadding: EdgeInsets.all(10),
                            counterText: '',
                          ),
                        ),
                      ),
                      const Text(
                        "Pin Code",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 15),
                        decoration: BoxDecoration(
                            color: AppColor.whiteA700,
                            border:
                                Border.all(color: AppColor.whiteA700, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          maxLength: 6,
                          controller: pinCode,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: 'Enter Pin Code',
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
                ),
                GestureDetector(
                    onTap: () => verifyNumber(),
                    child: Container(
                        margin: const EdgeInsets.only(top: 20),
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
                                            height: 30,
                                            width: 30,
                                            margin: const EdgeInsets.all(14),
                                            variant: IconButtonVariant
                                                .OutlineWhiteA701,
                                            shape:
                                                IconButtonShape.CircleBorder15,
                                            padding:
                                                IconButtonPadding.PaddingAll8,
                                            alignment: Alignment.centerRight,
                                            child: CommonImageView(
                                                svgPath:
                                                    ImageConstant.moveIcon))
                                      ]))),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 40, top: 21, right: 40, bottom: 20),
                                child: Text("Add Remitter",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsSemiBold16
                                        .copyWith(letterSpacing: 1.00))),
                          )
                        ])))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future verifyNumber() async {
    if (mobileNumber.value.text.isEmpty) {
      DialogHelper.errorSnackBar(context, "Mobile number can not be empty");
    } else if (!isMobileNumber(mobileNumber.value.text)) {
      DialogHelper.errorSnackBar(context, "Please enter valid mobile number");
    } else if (firstName.value.text.isEmpty) {
      DialogHelper.errorSnackBar(context, "Please enter first name...");
    } else if (lastName.value.text.isEmpty) {
      DialogHelper.errorSnackBar(context, "Please enter last name...");
    } else if (pinCode.value.text.toString().length != 6) {
      DialogHelper.errorSnackBar(context, "Please enter valid pin code");
    } else {
      var body = {
        "ServiceID": 3,
        "FirstName": firstName.value.text,
        "LastName": lastName.value.text,
        "Mobile": mobileNumber.value.text,
        "PinCode": pinCode.value.text
      };
      var json = await controller.addMobileNumber(body);
      commonResponse = CommonResponse.fromJson(json);
      if (commonResponse!.status == true) {
        otpDialog();
      } else {
        DialogHelper.showErrorDialog(
            description: commonResponse!.message.toString());
      }
    }
  }

  otpDialog() {
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Verification",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: AppColor.gray900),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.gray600.withOpacity(0.1)),
                  child: Text(
                    "We have otp on your mobile please verify.",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: AppColor.lightBlue801.withOpacity(0.7)),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 30, right: 10),
                        child: SizedBox(
                            width: size.width,
                            height: (65.00),
                            child: PinCodeTextField(
                                appContext: context,
                                controller: otpController,
                                length: 6,
                                obscureText: false,
                                obscuringCharacter: '*',
                                hintCharacter: '-',
                                keyboardType: TextInputType.number,
                                autoDismissKeyboard: true,
                                enableActiveFill: true,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (value) {},
                                textStyle: TextStyle(
                                    color: AppColor.gray802,
                                    fontSize: (20),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500),
                                pinTheme: PinTheme(
                                    fieldHeight: (50.00),
                                    fieldWidth: (50.00),
                                    shape: PinCodeFieldShape.box,
                                    borderRadius:
                                        BorderRadius.circular((10.00)),
                                    selectedFillColor:
                                        AppColor.fromHex("#1212121D"),
                                    activeFillColor:
                                        AppColor.fromHex("#1212121D"),
                                    inactiveFillColor:
                                        AppColor.fromHex("#1212121D"),
                                    inactiveColor: AppColor.gray802,
                                    selectedColor: AppColor.gray802,
                                    activeColor: AppColor.gray802))))),
                InkWell(
                  onTap: () {
                    verifyOtp();
                  },
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppColor.gray600.withOpacity(0.5),
                            width: 1)),
                    child: Text(
                      "Verify",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: AppColor.gray900),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future verifyOtp() async {
    if (otpController.value.text.isEmpty ||
        otpController.value.text.length != 6) {
      DialogHelper.showToast("Please enter valid otp");
    } else {
      var body = {
        "ServiceID": 3,
        "Mobile": mobileNumber.value.text,
        "OTP": otpController.value.text
      };
      var json = await controller.verifyMobileOtp(body);
      otpVerifyRes = CommonResponse.fromJson(json);
      if (otpVerifyRes?.status == true) {
        if (Get.isDialogOpen == true) Get.back();
        DialogHelper.showSuccessWithBack(
            context: context, description: otpVerifyRes!.message.toString());
      } else {
        DialogHelper.showErrorDialog(
            description: otpVerifyRes!.message.toString());
      }
    }
  }
}
