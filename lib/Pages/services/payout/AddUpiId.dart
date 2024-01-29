import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/PayoutController.dart';
import '../../../Network/Models/CommonResponse.dart';
import '../../../Network/Models/PayoutReportResponse.dart';
import '../../../Utils/ChargesDialog.dart';
import '../../../Utils/DialogHelper.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../Common/FailedScreen.dart';
import '../../Common/SecurityPin.dart';
import '../../Common/SuccessScreen.dart';
import '../../StatelessItems/Classes/UpiModel.dart';
import '../../StatelessItems/Views/UpiIcons.dart';

class AddUpiId extends StatefulWidget {
  const AddUpiId({Key? key}) : super(key: key);

  @override
  State<AddUpiId> createState() => _AddUpiIdState();
}

class _AddUpiIdState extends State<AddUpiId> {
  String enterUpi = "";
  TextEditingController upiId = TextEditingController();
  TextEditingController upiName = TextEditingController();
  TextEditingController upiAmount = TextEditingController();
  late CommonResponse accountInformation, accountVerification;
  late PayoutReportResponse commonResponse;
  bool isAccountVerify = false;
  bool isCheck = false;
  bool isUpiSelected = false;
  final payoutController = PayoutController();
  CommonResponse? chargesResponse;
  late String mainUpiId;

  var focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
    mainUpiId = Get.arguments;
    if (mainUpiId.isNotEmpty) {
      isUpiSelected = true;
    }
    upiId.value = TextEditingValue(text: mainUpiId);
  }

  void _onFocusChange() {
    setState(() {
      if (focusNode.hasFocus) {
        if (!isCheck) {
          getAccountInformation();
        }
      }
    });
    print("------ ${focusNode}");
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
        title: Text("Add UPI Account",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all( 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all( 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.formBackGround),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter UPI Id",
                      style: AppStyle.formLabelHeading,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      padding: const EdgeInsets.only(top: 3, bottom: 3),
                      decoration: BoxDecoration(
                          color: AppColor.whiteA700,
                          border:
                              Border.all(color: AppColor.whiteA700, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            enterUpi = value;
                            if (value.substring(value.length - 1) == "@") {
                              isUpiSelected = false;
                            } else {
                              isUpiSelected = true;
                            }
                          });
                        },
                        keyboardType: TextInputType.text,
                        controller: upiId,
                        enabled: mainUpiId.isEmpty ? true : false,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Enter Upi Id",
                          hintStyle:  TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          contentPadding:  EdgeInsets.all(10),
                          counterText: '',
                        ),
                      ),
                    ),
                    (isUpiSelected == false && enterUpi.contains('@'))
                        ? SizedBox(
                            height: 100,
                            child: GridView.count(
                              crossAxisCount: 3,
                              shrinkWrap: true,
                              childAspectRatio: 2.5,
                              children: List.generate(
                                  UpiModel().itemList.length, (index) {
                                return InkWell(
                                  onTap: () {
                                    isUpiSelected = true;
                                    upiId.value = TextEditingValue(
                                        text: enterUpi +
                                            UpiModel().itemList[index].upiId);
                                    setState(() {});
                                  },
                                  child: UpiIcons(
                                      upiItem: UpiModel().itemList[index]),
                                );
                              }),
                            ),
                          )
                        : Container(),
                    Text(
                      "Name",
                      style: AppStyle.formLabelHeading,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      padding: const EdgeInsets.only(top: 3, bottom: 3),
                      decoration: BoxDecoration(
                          color: AppColor.whiteA700,
                          border:
                              Border.all(color: AppColor.whiteA700, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 50,
                        controller: upiName,
                        focusNode: focusNode,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Enter Your Name",
                          hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          contentPadding: EdgeInsets.all(10),
                          counterText: '',
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.only(top: 5, right: 5),
                        child: Row(
                          children: [
                            Text(
                              "If you want to verify the upi id to click ",
                              style: AppStyle.formLabelHeading,
                            ),
                            InkWell(
                              onTap: () => verifyAccount(),
                              child: Text(
                                "Verify",
                                style: AppStyle.formLabelHeading
                                    .copyWith(color: AppColor.lightBlue801),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.formBackGround),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Amount",
                      style: AppStyle.formLabelHeading,
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
                        maxLength: 5,
                        controller: upiAmount,
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
                  sendAmount(0);
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
                    "Submit",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: AppColor.whiteA700,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  sendAmount(1);
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
                    "Save & Submit",
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

  Future sendAmount(int save) async {
    if (!isUpiId(upiId.value.text.toString())) {
      DialogHelper.showToast("Please enter the valid upi id...");
    } else if (upiName.value.text.isEmpty) {
      DialogHelper.showToast("Please enter your name...");
    } else if (upiAmount.value.text.isEmpty) {
      DialogHelper.showToast("Please enter the amount...");
    } else if (int.parse(upiAmount.value.text.toString()) <= 0) {
      DialogHelper.showToast("Please enter the valid amount");
    } else {
      calculateCharges(upiAmount.value.text.toString(), save);
    }
  }

  Future calculateCharges(String amount, int save) async {
    var body = {"SubServiceID": 26, "Amount": amount};

    var json = await payoutController.calculateCharges(body);
    chargesResponse = CommonResponse.fromJson(json);
    if (chargesResponse?.status == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ChargesDialog(
                currentAmount: int.parse(amount),
                charges: chargesResponse?.data ?? 0.0,
                bankName: "Charges");
          }).then((value) {
        if (value != null) {
          getPin(save, chargesResponse?.data ?? 0.0);
        }
      });
    } else {
      DialogHelper.showErrorDialog(
          description: chargesResponse!.message.toString());
    }
  }

  Future getPin(int save, dynamic charges) async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecurityPin()),
    );
    if (results.containsKey("pin") && results.isNotEmpty) {
      setState(() {
        callApi(results["pin"], save, charges.toInt());
      });
    }
  }

  Future callApi(String tPin, int save, int charges) async {
    var body = {
      "SubServiceID": 26,
      "BankID": 0,
      "OperatorId": 1,
      "Amount": int.parse(upiAmount.value.text.toString()),
      "AccountNumber": upiId.value.text.toString(),
      "AccountHolderName": upiName.value.text.toString(),
      "isSave": save,
      "BankIfsc": "",
      "TransactionSource": "APP",
      "IpAddress": ":1",
      "tPass": tPin
    };
    var json = await payoutController.payout(body);
    commonResponse = PayoutReportResponse.fromJson(json);
    if (commonResponse.status == true) {
      Get.offNamed('/success', arguments: {
        'serviceName': "UPI",
        'id': int.parse(commonResponse.data?[0].id.toString() ?? "0"),
        'amount': upiAmount.value.text.toString(),
        'msg': commonResponse.data?[0].heading ?? "NA",
        'subServiceId': commonResponse.data?[0].subServiceId ?? 0,
      });
    } else {
      if (commonResponse.code == 1001) {
        DialogHelper.showErrorDialog(description: commonResponse.message!);
      } else {
        Get.offNamed('/failed', arguments: {
          'serviceName': "UPI",
          'id': int.parse(commonResponse.data?[0].id.toString() ?? "0"),
          'amount': upiAmount.value.text.toString(),
          'msg': commonResponse.data?[0].heading ?? "NA",
          'subServiceId': commonResponse.data?[0].subServiceId ?? 0,
        });
      }
    }
  }

  Future verifyAccount() async {
    if (!isUpiId(upiId.value.text.toString())) {
      DialogHelper.showToast("Please enter the valid upi id...");
    } else {
      var body = {
        "SubServiceID": 36,
        "BankID": 0,
        "AccountNumber": upiId.value.text.toString(),
        "BankIfsc": "",
        "TransactionSource": "APP",
        "VerifyFrom": "Payout",
        "IpAddress": ":1",
        "IsAlreadyVerified": 0
      };

      var json = await payoutController.verifyAccount(body);
      accountVerification = CommonResponse.fromJson(json);
      if (accountVerification.status == true) {
        upiName.text = accountVerification.message.toString();
        isAccountVerify = true;
        DialogHelper.showToast("UPI id has been verified successfully...");
      } else {
        DialogHelper.showErrorDialog(
            description: accountVerification.message.toString());
      }
    }
  }

  Future getAccountInformation() async {
    if (!isUpiId(upiId.value.text.toString())) {
      DialogHelper.showToast("Please enter the valid upi id...");
    } else {
      var body = {
        "SubServiceID": 26,
        "AccountNumber": upiId.value.text.toString()
      };
      isCheck = true;
      var json = await payoutController.accountInformation(body);
      accountInformation = CommonResponse.fromJson(json);
      if (accountInformation.status == true) {
        upiName.text = accountInformation.message.toString();
        isAccountVerify = true;
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Do You Want to Verify?',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: AppColor.black900),
                ),
                content: Text("Charges Applicable*",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: AppColor.red700)),
                actions: [
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: AppColor.black900),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop('dialog');
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: AppColor.black900),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      verifyAccount();
                    },
                  ),
                ],
              );
            });
      }
    }
  }
}
