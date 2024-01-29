import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Network/Models/CreditCardResponse.dart';
import 'package:fpay/Pages/Common/OTPScreen.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/PayoutController.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../Common/FailedScreen.dart';
import '../../Common/SecurityPin.dart';
import '../../Common/SuccessScreen.dart';

class CreditCardDashboard extends StatefulWidget {
  const CreditCardDashboard({super.key});

  @override
  State<CreditCardDashboard> createState() => _CreditCardDashboardState();
}

class _CreditCardDashboardState extends State<CreditCardDashboard> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  int selected = 1;
  final payoutController = PayoutController();
  CreditCardResponse? creditCardResponse;

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
        title: Text("Credit Card",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.formBackGround),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      customRadioButton("Visa", 1),
                      customRadioButton("Master", 2),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.formBackGround),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Information Data",
                      style: AppStyle.normalLabelHeading
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      child: const Divider(),
                    ),
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
                        controller: mobileController,
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
                      "Credit Card Number",
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
                        keyboardType: TextInputType.number,
                        maxLength: 19,
                        controller: cardController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CreditCardNumberInputFormatter(),
                        ],
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter Card Number',
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
                      "Name",
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
                        keyboardType: TextInputType.text,
                        maxLength: 30,
                        controller: nameController,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Card Holder Name',
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
                      "Amount",
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
                        keyboardType: TextInputType.phone,
                        maxLength: 6,
                        controller: amountController,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: 'Enter Amount',
                            hintStyle: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                            contentPadding: const EdgeInsets.all( 10),
                            counterText: '',
                            prefixIconConstraints: const BoxConstraints(),
                            prefixIcon: Container(
                                margin: const EdgeInsets.only(left: 15, right: 8),
                                child: const Icon(Icons.currency_rupee))),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  sendOTP();
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  margin: const EdgeInsets.only(top: 30),
                  decoration: AppDecoration.mainGradient.copyWith(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Send OTP",
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

  Future sendOTP() async {
    if (mobileController.value.text.length != 10) {
      DialogHelper.showToast("Please enter the valid mobile number...");
    } else if (cardController.value.text.length != 19) {
      DialogHelper.showToast("Please enter the valid credit card number...");
    } else if (nameController.value.text.isEmpty) {
      DialogHelper.showToast("Please enter the card holder name...");
    } else if (amountController.value.text.isEmpty ||
        int.parse(amountController.value.text.toString()) < 100) {
      DialogHelper.showToast("Please enter amount above to 100..");
    } else {
      print("card number ----- ${cardController.value.text.toString()}");
      print(
          "card number trimedd ----- ${cardController.value.text.toString().replaceAll(RegExp(r'\s+'), '')}");
      var body = {
        "Action": "SendOTP",
        "SubServiceId": 27,
        "CreditCardTypeName": selected.toString(),
        "Mobile": mobileController.value.text,
        "CardNumber":
            cardController.value.text.toString().replaceAll(RegExp(r'\s+'), ''),
        "Name": nameController.value.text,
        "Amount": amountController.value.text,
        "Remarks": "0",
        "IpAddress": "103.166.13.57",
        "tPass": "0",
        "RefId": "0",
        "OTP": "0"
      };
      var json = await payoutController.creditCardBill(body);
      CommonResponse commonResponse = CommonResponse.fromJson(json);
      if (commonResponse.status == true) {
        getOTP(commonResponse.data.toString());
      } else {
        DialogHelper.showErrorDialog(
            description: commonResponse.message.toString());
      }
    }
  }

  Future getOTP(String refId) async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OTPScreen()),
    );
    if (results.containsKey("pin") && results.isNotEmpty) {
      setState(() {
        getPin(results["pin"], refId);
      });
    }
  }

  Future getPin(String otp, String refId) async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecurityPin()),
    );
    if (results.containsKey("pin") && results.isNotEmpty) {
      setState(() {
        callApi(otp, results["pin"], refId);
      });
    }
  }

  Future callApi(String otp, String mPin, String refId) async {
    var body = {
      "Action": "VerifyOTP",
      "SubServiceId": 27,
      "CreditCardTypeName": selected.toString(),
      "Mobile": mobileController.value.text,
      "CardNumber":
          cardController.value.text.toString().replaceAll(RegExp(r'\s+'), ''),
      "Name": nameController.value.text,
      "Amount": amountController.value.text,
      "Remarks": "0",
      "IpAddress": "103.166.13.57",
      "tPass": mPin,
      "RefId": refId,
      "OTP": otp
    };
    var json = await payoutController.creditCardBill(body);
    creditCardResponse = CreditCardResponse.fromJson(json);
    if (creditCardResponse!.status == true) {
      Get.offNamed('/success', arguments: {
        'serviceName': "CREDIT",
        'id': int.parse(creditCardResponse?.data?[0].refId.toString() ?? "0"),
        'amount': amountController.value.text.toString(),
        'msg': creditCardResponse?.data?[0].heading ?? "NA",
        'subServiceId': 27
      });
    } else {
      if (creditCardResponse?.code == 1001) {
        DialogHelper.showErrorDialog(
            description: creditCardResponse!.message.toString());
      } else {
        Get.offNamed('/failed', arguments: {
          'serviceName': "CREDIT",
          'id': int.parse(creditCardResponse?.data?[0].refId.toString() ?? "0"),
          'amount': amountController.value.text.toString(),
          'msg': creditCardResponse?.data?[0].heading ?? "NA",
          'subServiceId': 27
        });
      }
    }
  }

  Widget customRadioButton(String txt, int index) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width / 3.0,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: selected == index
            ? AppDecoration.mainGradient.copyWith(
                borderRadius: BorderRadius.circular(10),
              )
            : const BoxDecoration(),
        child: Text(
          txt,
          style: TextStyle(
              color: (selected == index) ? Colors.white : AppColor.black901,
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
      ),
    );
  }
}

class CreditCardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var selectionIndex = newValue.selection.baseOffset;

    var formattedText = '';
    for (var i = 0; i < text.length; i++) {
      formattedText += text[i];
      if ((i + 1) % 4 == 0 && i != text.length - 1) {
        formattedText += ' ';
      }
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: selectionIndex + (formattedText.length - text.length),
      ),
    );
  }
}
