import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Controllers/MAtmController.dart';
import 'package:fpay/Network/Models/UpdateMatmReponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Models/CommonResponse.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class MAtm extends StatefulWidget {
  const MAtm({super.key});

  @override
  State<MAtm> createState() => _MAtmState();
}

class _MAtmState extends State<MAtm> {
  int selected = 0;
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController amount = TextEditingController();
  static const aepsChannel = MethodChannel('aeps');
  CommonResponse? commonResponse;
  final controller = MAtmController();
  late String merchantCode;
  UpdateMatmReponse? updateMatmResponse;

  @override
  void initState() {
    super.initState();
    selected = Get.arguments;
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => checkOnboarding());
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
        title: Text("M-ATM",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.formBackGround),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      customRadioButton("Balance Enquiry", 0),
                      customRadioButton("Cash Withdrawal", 1)
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 20),
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
                    selected == 1 || selected == 2
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Amount",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 5, bottom: 20),
                                decoration: BoxDecoration(
                                    color: AppColor.whiteA700,
                                    border: Border.all(
                                        color: AppColor.whiteA700, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  maxLength: 6,
                                  controller: amount,
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
                                      contentPadding: const EdgeInsets.all(10),
                                      counterText: '',
                                      prefixIconConstraints:
                                          const BoxConstraints(),
                                      prefixIcon: Container(
                                          margin: const EdgeInsets.only(
                                              left: 15, right: 8),
                                          child: const Icon(
                                              Icons.currency_rupee))),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    InkWell(
                      onTap: () {
                        callSDK();
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        margin: const EdgeInsets.only(top: 10),
                        decoration: AppDecoration.mainGradient.copyWith(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Confirm Pin",
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
            ],
          ),
        ),
      ),
    ));
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
        width: size.width / 2.4,
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

  Future callSDK() async {
    if (mobileNumber.value.text.isEmpty ||
        mobileNumber.value.text.length != 10) {
      DialogHelper.showToast("Please enter the valid mobile number...");
    } else if (selected == 1 &&
        (amount.value.text.isEmpty ||
            int.parse(amount.value.text.toString()) < 100)) {
      DialogHelper.showToast("Please enter the valid amount...");
    } else {
      var arguments = {
        'mobileNumber': mobileNumber.value.text.toString().trim(),
        'amount': selected == 0 ? "0" : amount.value.text.toString().trim(),
        'method': selected == 0 ? "ATMBE" : "ATMCW",
        'merchantCode': merchantCode
      };
      Map<Object?, Object?> data =
          await aepsChannel.invokeMethod('MATM', arguments);
      if (data["status"] == true) {
        if (data["data"] != null) {
          updateTransaction(data["data"].toString(),
              data["response"].toString(), data["message"].toString());
        } else {
          DialogHelper.showErrorDialog(description: data["message"].toString());
        }
      } else {
        DialogHelper.showErrorDialog(description: data["message"].toString());
      }
    }
  }

  Future checkOnboarding() async {
    var body = {"Action": "CheckOnboarding"};
    var jsonBody = await controller.checkOnboarding(body);
    print("json body------- $jsonBody");
    commonResponse = CommonResponse.fromJson(jsonBody);
    if (commonResponse?.code == 200 ||
        commonResponse?.code == 203 ||
        commonResponse?.code == 202) {
      merchantCode = commonResponse!.data.toString();
    } else if (commonResponse?.code == 201) {
      //Get.offNamed('/matmOnboarding');
      DialogHelper.showErrorWithBack(
          context: context,
          description: "Complete your onboarding by web dashboard...");
      //Get.offNamed('/matmRegistration', arguments: true);
    } else {
      Get.offNamed('/matmRegistration', arguments: true);
    }
  }

  Future updateTransaction(String data, String apiRes, String message) async {
    Map<String, dynamic> jsonData = json.decode(data);
    var body = {
      "Amount": jsonData["transAmount"],
      "BankRrn": jsonData["bankRrn"],
      "AckNo": "",
      "TxnId": jsonData["txnid"],
      "TransType": jsonData["transType"],
      "Type": jsonData["type"],
      "CardNumber": jsonData["cardNumber"],
      "CardType": jsonData["cardType"],
      "TerminalId": jsonData["terminalId"],
      "BankName": jsonData["bankName"],
      "BalAmount": jsonData["balAmount"],
      "IpAddress": "103.166.13.57",
      "MacAddress": "",
      "ApiTxnStatus": "",
      "ApiStatus": jsonData["status"].toString(),
      "ApiResponseCode": apiRes,
      "ApiMessage": message,
      "Remark": ""
    };
    var jsonBody = await controller.updateTransaction(body);

    updateMatmResponse = UpdateMatmReponse.fromJson(jsonBody);
    if (updateMatmResponse?.status == true) {
      if (selected == 1) {
        Get.toNamed('/success', arguments: {
          'serviceName': "MATM",
          'id': updateMatmResponse?.data?[0].id ?? 0,
          'amount': amount.value.text.toString(),
          'msg': updateMatmResponse?.data?[0].heading ?? "NA",
          'subServiceId': 55
        });
      } else {
        DialogHelper.showSuccessDialog(
            description: updateMatmResponse!.message.toString());
      }
    } else {
      if (selected == 1) {
        Get.toNamed('/failed', arguments: {
          'serviceName': "MATM",
          'id': updateMatmResponse?.data?[0].subServiceId ?? 0,
          'amount': amount.value.text.toString(),
          'msg': updateMatmResponse?.data?[0].heading ?? "NA",
          'subServiceId': 55
        });
      } else {
        DialogHelper.showSuccessDialog(
            description: updateMatmResponse!.message.toString());
      }
    }
  }

// Authorisedkey = "N2JhZjljMmJlMGI2YjNlNjBjY2ZjNDQ5NjU5NWFhMjU="
// key = "UFMwMDEwODBmYmIzZWI1MTZjNGJmYmM1YzllNWEyYmZjZTJlYmUxMg=="
// partnerId = "PS001080"
// ----- UAT

// -------------------------------------------------
// partnerId ="PS003111"
// key = "UFMwMDMxMTE2NmEwNWMyYjU5MDQwMzk0YjQwYWU2NWEzZjlkYWUzZQ=="
// Authorisedkey = "NTI3N2Q1M2M0Y2M4NGU3ZGNlZGZlZTBiMDFjNDU3MDE="
// ----- Live

//   ##URL:--{{URL}}/Aeps/OnboardingAepsPro
//   ##Action : CheckOnboarding
//   Request:--
//   {
//   "Action": "CheckOnboarding"
//   }

//   Response--
//   200 --------Onbording, Registration and Login completed
//   {
//   "data": "832960",
//   "status": true,
//   "code": 200,
//   "message": "Complete"
// }

// 201 -------- One Time User Onbording Pending
// {
// "status": false,
// "code": 201,
// "message": "Pending"
// }

// 202 -------- One Time User Registration Pending
// {
// "data": "832960",
// "status": false,
// "code": 202,
// "message": "Registration Pending"
// }

// 203 --------Daily Login Pending
// {
// "data": "832960",
// "status": false,
// "code": 203,
// "message": "Login Pending"
// }

// --------------------------------------------------------------------------------------------
// ##Action : RegistrationOrLogin -----If Registration pending then Registration other wise Login
// Request:--
// {
// "Action": "RegistrationOrLogin",
// "IpAddress": "192.187.125.399",
// "Latitude": "17.4185",
// "Longitude": "178.2525",
// "PidData": ""
// }

// Response-1
// {
// "status": false,
// "code": 400,
// "message": "The ipaddress field must contain a valid IP.<br />\n"
// }
// Response-2
// {
// "status": false,
// "code": 400,
// "message": "Two Factor Authentication Fail Error Code : 810 Message : Missing biometric data as specified in 'Us"
// }

//
// {{URL}}/Aeps/DoOnboardingAepsPro
// ##Action : Insert
// Request:--
// {
// "Action": "Insert",
// "Mobile": "8107504383",
// "Email": "vipinjangid123@gmail.com",
// "Firm": "Space Softech",
// "AadharNumbar": "957844651265"
// }
// Response-1
// {
// "data": {
// "merchantcode": "832960",
// "mobile": "9145313786",
// "is_new": "0",
// "email": "sarkarrecharge.com@gmail.com",
// "firm": "Sarkar Mobile Shop",
// "callback": "https://fpay.net.in/Aeps/ReturnUrlOnboardingPS"
// },
// "status": true,
// "code": 200,
// "message": "Successfully Inserted"
// }
// ##Action : Update
// {
// "Action": "Update", -Mandatory
// "Mobile": "8107504383", -Mandatory
// "Email": "vipinjangid123@gmail.com",
// "Firm": "Space Softech",
// "AadharNumbar": "957844651265",
// "MerchantCode": "",	-Mandatory
// "Refno": "",
// "TxnNo": "",
// "Status": "",
// "Bank1": "",
// "Bank2": "",
// "Bank3": ""
// }
// Response-1
// {
// "status": false,
// "code": 400,
// "message": "Something went wrong !"
// }
}

// {{URL}}/Matm/DoMatm
//
//
// Request-1
// {
// "Amount ": "100.00",
// "BankRrn": "332912042270",
// "AckNo": "",
// "TxnId": "20231125121551",
// "TransType": "ATMCW",
// "Type ": "WDLS",
// "CardNumber ": "401138****7187",
// "CardType ": "null",
// "TerminalId ": "PI761669",
// "BankName ": "",
// "BalAmount": "840.7",
// "IpAddress": "103.166.13.57",
// "MacAddress ": "",
// "ApiTxnStatus ": "",
// "ApiStatus": "true",
// "ApiResponseCode": "",
// "ApiMessage ": "Cash withdraw is done successfully.",
// "Remark ": ""
// }
//
// Response-1
// {
// "status": true,
// "code": 200,
// "message": "Cash withdraw is done successfully."
// }
//
// Request-2
//
// {
// "Amount": "100.00",
// "BankRrn": "332521028561",
// "AckNo": "",
// "TxnId": "20231121213727",
// "TransType": "ATMBE",
// "Type": "BAL",
// "CardNumber": "******7187",
// "CardType": "null",
// "TerminalId": "PI761669",
// "BankName": "",
// "BalAmount": "740.7",
// "IpAddress": "103.166.13.57",
// "MacAddress": "",
// "ApiTxnStatus": "",
// "ApiStatus": "true",
// "ApiResponseCode": "",
// "ApiMessage": "Balance Enquiry Successful",
// "Remark": ""
// }

// Response-2
// {
// "status": true,
// "code": 200,
// "message": "Balance Enquiry Successful"
// }
