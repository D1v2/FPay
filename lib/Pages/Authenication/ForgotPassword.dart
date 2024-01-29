import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Pages/Authenication/SetPassword.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Network/Controllers/AuthenticationController.dart';
import '../../Network/Models/CommonResponse.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/PreferenceManager.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';
import '../Common/OTPScreen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mobileNumber = TextEditingController();
  final controller = AuthenticationController();
  CommonResponse? otpRes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColor.black900,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text("Forgot Password",
                    style: AppStyle.txtPoppinsSemiBold18
                        .copyWith(fontSize: 22, fontWeight: FontWeight.w600)),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                    "Please Enter Your Register Mobile Number To Receive The New Password.",
                    textAlign: TextAlign.start,
                    style: AppStyle.txtPoppinsRegular16Gray803.copyWith(
                      height: 1.67,
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.gray50,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  controller: mobileNumber,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
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
                        child:
                            CommonImageView(svgPath: ImageConstant.callIcon)),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () => forgotPassword(),
                  child: Container(
                      margin:
                          const EdgeInsets.only(left: 23, top: 30, right: 23),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomIconButton(
                                          height: 25,
                                          width: 25,
                                          margin: const EdgeInsets.all(10),
                                          variant: IconButtonVariant
                                              .OutlineWhiteA701,
                                          shape: IconButtonShape.CircleBorder15,
                                          padding:
                                              IconButtonPadding.PaddingAll8,
                                          alignment: Alignment.centerRight,
                                          child: CommonImageView(
                                              svgPath: ImageConstant.moveIcon))
                                    ]))),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 40, top: 25, right: 40, bottom: 25),
                              child: Text("CONTINUE",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold16
                                      .copyWith(letterSpacing: 1.00))),
                        )
                      ]))),
            ],
          ),
        ),
      ),
    );
  }

  Future forgotPassword() async {
    if (mobileNumber.value.text.isEmpty ||
        mobileNumber.value.text.length != 10) {
      DialogHelper.showToast("Please enter the valid mobile number...");
    } else {
      PreferenceManager.setNumber(mobileNumber.value.text.toString());
      sendOtp();
    }
  }

  Future sendOtp() async {
    var json = await controller.sendOTP({"TemplateId": "21"});
    otpRes = CommonResponse.fromJson(json);
    if (otpRes?.status == true) {
      getVerificationCode();
    } else {
      DialogHelper.showErrorDialog(description: otpRes!.message.toString());
    }
  }

  Future getVerificationCode() async {
    var rs = await Get.toNamed('/otp', arguments: true);
    if (rs != null && rs is String) {
      setState(() {
        Get.toNamed('/setPassword', arguments: rs);
      });
    }
  }
}
