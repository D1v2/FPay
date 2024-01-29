import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';
import '../../Utils/math_utils.dart';
import 'RechargeSuccess.dart';

class MPin extends StatefulWidget {
  const MPin({Key? key}) : super(key: key);

  @override
  State<MPin> createState() => _MPinState();
}

class _MPinState extends State<MPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title:
            Text("Security Pin", style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Align(
                alignment: Alignment.center,
                child: Text(
                  "Enter the security pin",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black),
                )),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 15, left: 25, right: 25),
                child: const Text(
                  "Security code is used to verify your every transaction to be more secure",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                ),
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
                            //  controller: otpController,
                            length: 4,
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
                                color: AppColor.black900,
                                fontSize: (24),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                            pinTheme: PinTheme(
                                fieldHeight: (65.00),
                                fieldWidth: (65.00),
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular((10.00)),
                                selectedFillColor: Colors.white,
                                activeFillColor: AppColor.fromHex("#1212121D"),
                                inactiveFillColor: Colors.white,
                                inactiveColor: AppColor.gray802,
                                selectedColor: AppColor.gray802,
                                activeColor: AppColor.gray802))))),
            GestureDetector(
                onTap: () {
                  successRecharge();
                },
                child: Container(
                    height: (65.00),
                    width: (330.00),
                    margin: const EdgeInsets.only(left: 39, top: 80, right: 39),
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
                            child: Text("submit".toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsSemiBold16
                                    .copyWith(letterSpacing: 1.00))),
                      )
                    ]))),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: const Text(
                "Forgot Pin?",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  successRecharge() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RechargeSuccess()),
    );
  }
}
