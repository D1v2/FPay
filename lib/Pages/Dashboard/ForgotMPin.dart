import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Network/Controllers/AuthenticationController.dart';
import '../../Network/Models/CommonResponse.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';

class ForgotMPin extends StatefulWidget {
  String otp;

  ForgotMPin({Key? key, required this.otp}) : super(key: key);

  @override
  State<ForgotMPin> createState() => _ForgotMPinState();
}

class _ForgotMPinState extends State<ForgotMPin> {
  TextEditingController confirmPin = TextEditingController();
  TextEditingController newPin = TextEditingController();
  final controller = AuthenticationController();
  CommonResponse? response, otpRes;

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
        title: Text("Forgot M Pin",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Forgot Your MPIN",
                  style: AppStyle.normalLabelHeading
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                "OTP sent to your registered mobile, a secure and easy way to verify your identity.",
                style: AppStyle.normalLabelHeading
                    .copyWith(fontSize: 14, color: AppColor.gray600),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: newPin,
                  maxLines: 1,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: "Enter Your New MPIN",
                      hintStyle: AppStyle.formLabelHeading,
                      prefixIcon: const Icon(Icons.lock_outline)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: TextFormField(
                  controller: confirmPin,
                  maxLines: 1,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: "Enter Your Confirm MPIN",
                      hintStyle: AppStyle.formLabelHeading,
                      prefixIcon: const Icon(Icons.lock_outline)),
                ),
              ),
              GestureDetector(
                  onTap: () => forgotPin(),
                  child: Container(
                      height: (65.00),
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
                                          height: 30,
                                          width: 30,
                                          margin: const EdgeInsets.all(14),
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
                                  left: 40, top: 21, right: 40, bottom: 20),
                              child: Text("forgot pin".toUpperCase(),
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
    ));
  }

  Future forgotPin() async {
    if (newPin.value.text.isEmpty || newPin.value.text.length != 4) {
      DialogHelper.showToast("Please enter the your new pin....");
    } else if (confirmPin.value.text.isEmpty ||
        confirmPin.value.text.length != 4) {
      DialogHelper.showToast("New pin and confirm pin must be same...");
    } else if (newPin.value.text != confirmPin.value.text) {
      DialogHelper.showToast("New pin and confirm pin must be same...");
    } else {
      var body = {
        "action": "ForgotPin",
        "otp": widget.otp,
        "newPass": newPin.value.text.toString(),
        "confirmPass": confirmPin.value.text.toString()
      };

      var json = await controller.forgotCredentials(body);
      response = CommonResponse.fromJson(json);
      if (response!.status == true) {
        DialogHelper.showSuccessWithBack(
            context: context, description: response!.message.toString());
      } else {
        DialogHelper.showErrorDialog(description: response!.message.toString());
      }
    }
  }
}
