import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/AepsControllers.dart';
import '../../../Network/Models/CommonResponse.dart';
import '../../../Utils/DialogHelper.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class AepsProOnBoarding extends StatefulWidget {
  const AepsProOnBoarding({super.key});

  @override
  State<AepsProOnBoarding> createState() => _AepsProOnBoardingState();
}

class _AepsProOnBoardingState extends State<AepsProOnBoarding> {
  final aepsController = AepsControllers();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController aadhaarNumber = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController firmName = TextEditingController();
  CommonResponse? response;

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
        title: Text("APES Pro Onboarding",
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
                      "Firm Name",
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
                        maxLength: 50,
                        controller: firmName,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter Firm Name',
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
    } else if (firmName.value.text.isEmpty) {
      DialogHelper.showToast("Please enter firm name...");
    } else {
      var body = {
        "Action": "Update",
        "Mobile": mobileNumber.value.text.toString(),
        "Email": emailId.value.text.toString(),
        "Firm": firmName.value.text.toString(),
        "AadharNumbar": aadhaarNumber.value.text.toString(),
      };
      var json = await aepsController.completeOnBoardingPro(body);
      response = CommonResponse.fromJson(json);
      if (response?.status == true) {
        DialogHelper.showSuccessWithBack(
            context: context, description: response!.message.toString());
      } else {
        DialogHelper.showSuccessDialog(
            description: response!.message.toString());
      }
    }
  }
}
