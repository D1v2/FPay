import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fpay/Pages/Dashboard/Dashboard.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';
import '../../Utils/math_utils.dart';

class KycVerification extends StatefulWidget {
  const KycVerification({Key? key}) : super(key: key);

  @override
  State<KycVerification> createState() => _KycVerificationState();
}

class _KycVerificationState extends State<KycVerification> {
  TextEditingController otpController = TextEditingController();

  late Timer _timer;
  int _start = 30;
  String sendCode = "Re-send code in 0:30";

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            sendCode = "Re-send";
          });
        } else {
          setState(() {
            _start--;
            sendCode = "Re-send code in 0:$_start";
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.whiteA700,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 15, top: 20.0),
                child: Text("Verification",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsSemiBold24Gray802.copyWith()),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin:
                    const EdgeInsets.only(top: 20.0, left: 15, right: 15.0),
                child: Text(
                    "Aadhaar OTP sent to your registered mobile, a secure and easy way to verify your identity",
                    style: AppStyle.txtPoppinsRegular15Gray800a2
                        .copyWith(height: 1.2)),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 40, right: 20),
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
                                fontSize: (24),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                            pinTheme: PinTheme(
                                fieldHeight: size.width / 8.5,
                                fieldWidth: size.height / 18,
                                shape: PinCodeFieldShape.box,
                                borderRadius:
                                BorderRadius.circular((10.00)),
                                selectedFillColor: AppColor.whiteA701,
                                activeFillColor:
                                AppColor.fromHex("#1212121D"),
                                inactiveFillColor: AppColor.whiteA701,
                                inactiveColor: AppColor.gray802,
                                selectedColor: AppColor.gray802,
                                activeColor: AppColor.gray802))))),
            GestureDetector(
              onTap: () => onTapHome(context),
              child: Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: (58.00),
                      width: size.width,
                      margin:
                          const EdgeInsets.only(left: 50, top: 40, right: 50),
                      child: Stack(alignment: Alignment.center, children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                decoration: AppDecoration.outlineIndigo3003f
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
                                child: Text("submit".toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsSemiBold16
                                        .copyWith(letterSpacing: 1.00))))
                      ]))),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                    margin: const EdgeInsets.only(
                        left: 30, top: 38, right: 30, bottom: 20),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: sendCode,
                              style: TextStyle(
                                  color: AppColor.lightBlue801,
                                  fontSize: (15),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 1.67)),
                        ]),
                        textAlign: TextAlign.left)))
          ],
        ),
      ),
    ));
  }

  onTapHome(BuildContext context) {
    if (otpController.text.length != 6) {
      Fluttertoast.showToast(
          msg: "Please enter otp",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    }
  }
}
