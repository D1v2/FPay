import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Utils/DialogHelper.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
        title: Text("Verify OTP", style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Verification",
              style: AppStyle.formLabelHeading
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 30),
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "OTP sent to your registered mobile, a secure and easy way to verify your identity",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: AppColor.gray600),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                margin: const EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                width: size.width,
                child: PinCodeTextField(
                    appContext: context,
                    controller: otpController,
                    length: 6,
                    obscureText: true,
                    obscuringCharacter: '*',
                    hintCharacter: '-',
                    keyboardType: TextInputType.number,
                    autoDismissKeyboard: true,
                    enableActiveFill: true,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        borderRadius: BorderRadius.circular((10.00)),
                        selectedFillColor: AppColor.whiteA701,
                        activeFillColor: AppColor.fromHex("#1212121D"),
                        inactiveFillColor: AppColor.whiteA701,
                        inactiveColor: AppColor.gray802,
                        selectedColor: AppColor.gray802,
                        activeColor: AppColor.gray802))),
            InkWell(
              onTap: () => doTransaction(otpController.value.text.toString()),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 35),
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: AppDecoration.mainGradient.copyWith(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: AppColor.whiteA700,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )

            /*Container(
              margin: getMargin(top: 20),
              child: Text(
                "Forgot Pin ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.gray600),
              ),
            )*/
          ],
        ),
      ),
    ));
  }

  Future doTransaction(String otp) async {
    if (otp.length != 6) {
      DialogHelper.showToast("Please enter otp for verification...");
    } else {
      Get.back(result: otp);
    }
  }
}
