import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';

class SecurityPin extends StatefulWidget {
  const SecurityPin({Key? key}) : super(key: key);

  @override
  State<SecurityPin> createState() => _SecurityPinState();
}

class _SecurityPinState extends State<SecurityPin> {
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
        title: Text("Security Pin",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all( 15),
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enter The Security Pin",
              style: AppStyle.formLabelHeading
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Security code is used to verify your every transaction to be more secure",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: AppColor.gray600),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
                margin: const EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                width: size.width,
                child: PinCodeTextField(
                    appContext: context,
                    controller: otpController,
                    length: 4,
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
              onTap: () => doTransaction(),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: AppDecoration.mainGradient.copyWith(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Pay",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: AppColor.whiteA700,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                "Forgot Pin ?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.gray600),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future doTransaction() async {
    if (otpController.value.text.length != 4) {
      DialogHelper.showToast("Please enter the security pin");
    } else {
      Navigator.of(context).pop({'pin': otpController.value.text.toString()});
    }
  }
}
