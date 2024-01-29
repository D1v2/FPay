import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/AepsControllers.dart';
import '../../../Utils/DialogHelper.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class AepsOnboarding extends StatefulWidget {
  const AepsOnboarding({Key? key}) : super(key: key);

  @override
  State<AepsOnboarding> createState() => _AepsOnboardingState();
}

class _AepsOnboardingState extends State<AepsOnboarding> {
  final aepsController = AepsControllers();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController aadhaarNumber = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController panCard = TextEditingController();
  CommonResponse? response;
  TextEditingController otpController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();

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
        title: Text("APES Onboarding",
            style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.formBackGround),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Mobile Number",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 20),
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
                      "Email Id",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 20),
                      decoration: BoxDecoration(
                          color: AppColor.whiteA700,
                          border:
                              Border.all(color: AppColor.whiteA700, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailId,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter Email Id',
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
                      "Aadhaar Number",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 20),
                      decoration: BoxDecoration(
                          color: AppColor.whiteA700,
                          border:
                              Border.all(color: AppColor.whiteA700, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLength: 12,
                        controller: aadhaarNumber,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter Aadhaar Number',
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
                      "PanCard Number",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      decoration: BoxDecoration(
                          color: AppColor.whiteA700,
                          border:
                              Border.all(color: AppColor.whiteA700, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 10,
                        controller: panCard,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter PanCard Number',
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
                      "Bank Account Number",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 20),
                      decoration: BoxDecoration(
                          color: AppColor.whiteA700,
                          border:
                              Border.all(color: AppColor.whiteA700, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLength: 18,
                        controller: accountNumberController,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter Account Number',
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
                      "IFSC Code",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      decoration: BoxDecoration(
                          color: AppColor.whiteA700,
                          border:
                              Border.all(color: AppColor.whiteA700, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 11,
                        controller: ifscCodeController,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter IFSC Code',
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
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                margin: const EdgeInsets.only(top: 30),
                decoration: AppDecoration.mainGradient.copyWith(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () => onboard(),
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
            ],
          ),
        ),
      ),
    ));
  }

  void onboard() async {
    if (!isMobileNumber(mobileNumber.value.text.toString())) {
      DialogHelper.showToast("Please enter valid mobile number");
    } else if (!isEmail(emailId.value.text.toString())) {
      DialogHelper.showToast("Please enter valid email id");
    } else if (aadhaarNumber.value.text.toString().length != 12) {
      DialogHelper.showToast("Please enter valid aadhaar card number");
    } else if (!isPanCard(panCard.value.text.toString())) {
      DialogHelper.showToast("Please enter valid pan card number");
    } else if (!isAccountNumber(
        accountNumberController.value.text.toString())) {
      DialogHelper.showToast("Please enter valid account number");
    } else if (!isIfscCode(ifscCodeController.value.text.toString())) {
      DialogHelper.showToast("Please enter valid ifsc code...");
    } else {
      var body = {
        "Action": "Initiate",
        "Mobile": mobileNumber.value.text.toString(),
        "Email": emailId.value.text.toString(),
        "PanNumber": panCard.value.text.toString(),
        "AadharNumber": aadhaarNumber.value.text.toString(),
        "TransactionSource": "APP",
        "BankAccountNo": accountNumberController.value.text.toString(),
        "BankIfsc": ifscCodeController.value.text.toString(),
        "IPAddress": ":1"
      };
      var json = await aepsController.onBoard(body);
      response = CommonResponse.fromJson(json);
      if (response!.status == true) {
        showOtpScreen(response!.id!);
      } else {
        DialogHelper.showToast(response!.message!);
      }
    }
  }

  void showOtpScreen(String id) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          child: Container(
            padding:
                const EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Verification",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsSemiBold24Gray802.copyWith()),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 20.0, left: 15, right: 15.0),
                    child: Text(
                        "OTP sent to your registered mobile, a secure and easy way to verify your identity",
                        style: AppStyle.txtPoppinsRegular15Gray800a2
                            .copyWith(height: 1.2)),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: PinCodeTextField(
                        appContext: context,
                        autoDisposeControllers: false,
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
                            fieldWidth: size.width / 10,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular((10.00)),
                            selectedFillColor: AppColor.whiteA701,
                            activeFillColor: AppColor.fromHex("#1212121D"),
                            inactiveFillColor: AppColor.whiteA701,
                            inactiveColor: AppColor.gray802,
                            selectedColor: AppColor.gray802,
                            activeColor: AppColor.gray802))),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  margin: const EdgeInsets.only(top: 30),
                  decoration: AppDecoration.mainGradient.copyWith(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () => verifyOtp(id),
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
              ],
            ),
          ),
        ));
  }

  void verifyOtp(String id) async {
    if (otpController.value.text.length != 6) {
      DialogHelper.showToast("Please enter the valid otp");
    } else {
      var body = {
        "Action": "Validate",
        "OTP": otpController.value.text.toString(),
        "ID": id
      };
      var json = await aepsController.onBoard(body);
      response = CommonResponse.fromJson(json);
      if (response!.status == true) {
        Get.back();
        DialogHelper.showSuccessWithBack(
            context: context, description: response!.message!);
      } else {
        DialogHelper.showErrorDialog(description: response!.message!);
      }
    }
  }
}
