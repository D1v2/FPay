import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Models/PayoutReportResponse.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/PayoutController.dart';
import '../../../Network/Models/BankResponse.dart';
import '../../../Network/Models/CommonResponse.dart';
import '../../../Utils/ChargesDialog.dart';
import '../../../Utils/DialogHelper.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../Common/BankList.dart';
import '../../Common/FailedScreen.dart';
import '../../Common/SecurityPin.dart';
import '../../Common/SuccessScreen.dart';

class AddBank extends StatefulWidget {
  const AddBank({Key? key}) : super(key: key);

  @override
  State<AddBank> createState() => _AddBankState();
}

class _AddBankState extends State<AddBank> {
  TextEditingController accountNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController holderName = TextEditingController();
  TextEditingController amount = TextEditingController();
  final payoutController = PayoutController();
  late CommonResponse accountInformation, accountVerification;
  late PayoutReportResponse commonResponse;
  bool isAccountVerify = false;

  int currentScanDevice = 0;
  BankData? bankData;
  var focusNode = FocusNode();
  CommonResponse? chargesResponse;

  bool isCheck = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      if (focusNode.hasFocus) {
        if (!isCheck) {
          getAccountInformation();
        }
      }
    });
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
        title: Text("Bank Account",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all( 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                    const Text(
                      "Select Your Bank",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    InkWell(
                      onTap: () => selectBank(),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 10, right: 10),
                        margin: const EdgeInsets.only(top: 5, bottom: 10),
                        decoration: BoxDecoration(
                            color: AppColor.whiteA700,
                            border:
                                Border.all(color: AppColor.whiteA700, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(bankData?.bankName == null
                                ? "Select Your Bank"
                                : bankData!.bankName!),
                            Icon(
                              Icons.expand_circle_down,
                              color: AppColor.gray600,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.all( 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.formBackGround),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Account Information",
                        style:
                            AppStyle.normalLabelHeading.copyWith(fontSize: 16)),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Divider(
                        color: AppColor.lightBlue801,
                      ),
                    ),
                    Text(
                      "Account Number",
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
                        keyboardType: TextInputType.phone,
                        maxLength: 18,
                        maxLines: 1,
                        controller: accountNumber,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Enter Account Number",
                          hintStyle:  TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          contentPadding:  EdgeInsets.all(10),
                          counterText: '',
                        ),
                      ),
                    ),
                    Text(
                      "IFSC Code",
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
                        maxLength: 11,
                        controller: ifscCode,
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        decoration:const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Enter IFSC Code",
                          hintStyle:  TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          contentPadding:  EdgeInsets.all(10),
                          counterText: '',
                        ),
                      ),
                    ),
                    Text(
                      "Account Holder Name",
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
                        maxLines: 1,
                        controller: holderName,
                        focusNode: focusNode,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Enter Account Holder Name",
                          hintStyle:  TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          contentPadding:  EdgeInsets.all(10),
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
                              "If you want to verify the bank to click ",
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
                        maxLength: 6,
                        controller: amount,
                        textAlign: TextAlign.start,
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
                                margin: const EdgeInsets.only(left: 10, right: 8),
                                child: const Icon(
                                  Icons.currency_rupee,
                                ))),
                      ),
                    ),
                    Text(
                      "Transaction Mode",
                      style: AppStyle.formLabelHeading,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.all( 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColor.lightBlue801, width: 1)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            customScannerButton("IMPS", 0),
                            customScannerButton("NEFT", 1),
                          ],
                        ),
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

  Widget customScannerButton(String txt, int index) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(() {
          currentScanDevice = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width / 2.5,
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        decoration: currentScanDevice == index
            ? AppDecoration.mainGradient.copyWith(
                borderRadius: BorderRadius.circular(10),
              )
            : const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: (currentScanDevice == index)
                          ? AppColor.whiteA701
                          : AppColor.black900,
                      width: 1)),
            ),
            Text(
              "  ${txt.toUpperCase()}",
              style: TextStyle(
                  color: (currentScanDevice == index)
                      ? Colors.white
                      : AppColor.black901,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Future sendAmount(int save) async {
    if (bankData == null) {
      DialogHelper.showToast("Please select the bank");
    } else if (!isAccountNumber(accountNumber.value.text.toString())) {
      DialogHelper.showToast("Please enter the valid account number...");
    } else if (!isIfscCode(ifscCode.value.text.toString())) {
      DialogHelper.showToast("Please enter the valid ifsc code...");
    } else if (holderName.value.text.toString().isEmpty) {
      DialogHelper.showToast("Please enter the beneficial name...");
    } else if (amount.value.text.isEmpty) {
      DialogHelper.showToast("Please enter the amount...");
    } else if (int.parse(amount.value.text.toString()) <= 0) {
      DialogHelper.showToast("Please enter the valid amount");
    } else {
      calculateCharges(amount.value.text.toString(), save);
    }
  }

  Future calculateCharges(String amount, int save) async {
    var body = {"SubServiceID": 25, "Amount": amount};

    var json = await payoutController.calculateCharges(body);
    chargesResponse = CommonResponse.fromJson(json);
    if (chargesResponse?.status == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ChargesDialog(
                currentAmount: int.parse(amount),
                charges: chargesResponse?.data ?? 0.0,
                bankName: bankData!.bankName!);
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

  Future getAccountInformation() async {
    if (accountNumber.value.text.toString().length < 9 ||
        accountNumber.value.text.toString().length > 18) {
      DialogHelper.showToast("Please enter the valid account number");
    } else {
      isCheck = true;
      var body = {
        "SubServiceID": 25,
        "AccountNumber": accountNumber.value.text.toString()
      };
      var json = await payoutController.accountInformation(body);
      accountInformation = CommonResponse.fromJson(json);
      if (accountInformation.status == true) {
        holderName.text = accountInformation.message.toString();
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
                      Navigator.of(context)
                          .pop(); // Close the dialog without returning a value
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

  Future verifyAccount() async {
    if (bankData == null) {
      DialogHelper.showToast("Please select the bank");
    } else if (!isAccountNumber(accountNumber.value.text.toString())) {
      DialogHelper.showToast("Please enter the valid account number...");
    } else if (!isIfscCode(ifscCode.value.text.toString())) {
      DialogHelper.showToast("Please enter the valid ifsc code...");
    } else {
      var body = {
        "SubServiceID": 35,
        "BankID": bankData!.iD,
        "AccountNumber": accountNumber.value.text.toString(),
        "BankIfsc": ifscCode.value.text.toString(),
        "TransactionSource": "APP",
        "VerifyFrom": "Payout",
        "IpAddress": ":1",
        "IsAlreadyVerified": 0
      };
      var json = await payoutController.verifyAccount(body);
      accountVerification = CommonResponse.fromJson(json);
      if (accountVerification.status == true) {
        holderName.text = accountVerification.message.toString();
        isAccountVerify = true;
        DialogHelper.showToast("Account has been verified successfully...");
      } else {
        DialogHelper.showErrorDialog(
            description: accountVerification.message.toString());
      }
    }
  }

  Future callApi(String tPin, int save, int charges) async {
    var body = {
      "SubServiceID": 25,
      "BankID": bankData!.bankID,
      "OperatorId": currentScanDevice == 0 ? 971 : 972,
      "Amount": int.parse(amount.value.text.toString()),
      "AccountNumber": accountNumber.value.text.toString(),
      "AccountHolderName": holderName.value.text.toString(),
      "isSave": save,
      "BankIfsc": ifscCode.value.text.toString(),
      "TransactionSource": "APP",
      "IpAddress": ":1",
      "tPass": tPin
    };
    var json = await payoutController.payout(body);
    commonResponse = PayoutReportResponse.fromJson(json);
    if (commonResponse.status == true) {
      Get.offNamed('/success', arguments: {
        'serviceName': "BANK",
        'id': int.parse(commonResponse.data?[0].id.toString() ?? "0"),
        'amount': amount.value.text.toString(),
        'msg': commonResponse.data?[0].heading ?? "NA",
        'subServiceId': commonResponse.data?[0].subServiceId ?? 0,
      });
    } else {
      if (commonResponse.code == 1001) {
        DialogHelper.showErrorDialog(description: commonResponse.message!);
      } else {
        Get.offNamed('/failed', arguments: {
          'serviceName': "BANK",
          'id': int.parse(commonResponse.data?[0].id.toString() ?? "0"),
          'amount': amount.value.text.toString(),
          'msg': commonResponse.data?[0].heading ?? "NA",
          'subServiceId': commonResponse.data?[0].subServiceId ?? 0,
        });
      }
    }
  }

  Future selectBank() async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BankList(
                service: "Payout",
              )),
    );
    if (results.containsKey('bankData')) {
      setState(() {
        bankData = results['bankData'];
        ifscCode.value = TextEditingValue(text: bankData!.ifscGlobal!);
      });
    }
  }
}
