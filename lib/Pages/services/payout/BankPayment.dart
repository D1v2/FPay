import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Network/Models/PayoutReportResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/PayoutController.dart';
import '../../../Network/Models/PayoutBankData.dart';
import '../../../Utils/ChargesDialog.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../Common/SecurityPin.dart';

class BankPayment extends StatefulWidget {
  const BankPayment({Key? key}) : super(key: key);

  @override
  State<BankPayment> createState() => _BankPaymentState();
}

class _BankPaymentState extends State<BankPayment> {
  late TextEditingController fullName;
  late TextEditingController accountNumber;
  late TextEditingController ifscCode;
  late TextEditingController bankName;
  TextEditingController amount = TextEditingController();
  final payoutController = PayoutController();

  late PayoutReportResponse commonResponse;
  CommonResponse? chargesResponse;

  late PayoutBankData payoutBankData;
  late String transactionType;

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> arguments = Get.arguments;
    payoutBankData = arguments['bankData'];
    transactionType = arguments['tt'];

    fullName = TextEditingController(text: payoutBankData.beneficiaryName);
    accountNumber = TextEditingController(text: payoutBankData.accountNo);
    ifscCode = TextEditingController(text: payoutBankData.ifsc);
    bankName = TextEditingController(text: payoutBankData.bankName);
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
        title: Text("$transactionType Payment",
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
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.formBackGround),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Information Detail",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Divider(
                        color: AppColor.lightBlue801,
                      ),
                    ),
                    const Text(
                      "Full Name",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      padding: const EdgeInsets.only(top: 3, bottom: 3),
                      decoration: BoxDecoration(
                          color: AppColor.lightBlue801.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        enabled: false,
                        controller: fullName,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColor.gray600),
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Enter Full Name",
                          hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                          contentPadding: EdgeInsets.all(10),
                          counterText: '',
                        ),
                      ),
                    ),
                    Text(
                      transactionType != "UPI" ? "Account Number" : "UPI Id",
                      style: AppStyle.formLabelHeading,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      padding: const EdgeInsets.only(top: 3, bottom: 3),
                      decoration: BoxDecoration(
                          color: AppColor.lightBlue801.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLength: 18,
                        enabled: false,
                        controller: accountNumber,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColor.gray600),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Enter Account Number",
                          hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          contentPadding: EdgeInsets.all(10),
                          counterText: '',
                        ),
                      ),
                    ),
                    transactionType != "UPI"
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "IFSC Code",
                                style: AppStyle.formLabelHeading,
                              ),
                              Container(
                                margin:const EdgeInsets.only(top: 5, bottom: 10),
                                padding: const EdgeInsets.only(top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                    color:
                                        AppColor.lightBlue801.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  enabled: false,
                                  controller: ifscCode,
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColor.gray600),
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    hintText: "Enter IFSC Code",
                                    hintStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                    contentPadding: EdgeInsets.all(10),
                                    counterText: '',
                                  ),
                                ),
                              ),
                              Text(
                                "Bank Name",
                                style: AppStyle.formLabelHeading,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5, bottom: 10),
                                padding: const EdgeInsets.only(top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                    color:
                                        AppColor.lightBlue801.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  enabled: false,
                                  controller: bankName,
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColor.gray600),
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    hintText: "Enter Bank Name",
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
                          )
                        : Container()
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
                        maxLength: transactionType == "UPI" ? 5 : 6,
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
                            prefixIcon: Container(
                                margin: const EdgeInsets.only(
                                  left: 18,
                                  right: 14,
                                ),
                                child: const Icon(
                                  Icons.currency_rupee,
                                ))),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => sendAmount(),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  margin: const EdgeInsets.only(top: 30),
                  decoration: AppDecoration.mainGradient.copyWith(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Send Payment",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: AppColor.whiteA700,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future sendAmount() async {
    if (amount.value.text.isEmpty) {
      DialogHelper.showToast("Please enter the amount...");
    } else if (int.parse(amount.value.text.toString()) <= 0) {
      DialogHelper.showToast("Please enter the valid amount");
    } else {
      calculateCharges(amount.value.text.toString());
    }
  }

  Future calculateCharges(String amount) async {
    var body = {
      "SubServiceID": transactionType == "UPI" ? 26 : 25,
      "Amount": amount
    };

    var json = await payoutController.calculateCharges(body);
    chargesResponse = CommonResponse.fromJson(json);
    if (chargesResponse?.status == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ChargesDialog(
                currentAmount: int.parse(amount),
                charges: chargesResponse?.data ?? 0.0,
                bankName: payoutBankData.bankName ?? "Calculated Charges");
          }).then((value) {
        if (value != null) {
          getPin(chargesResponse?.data ?? 0.0);
        }
      });
    } else {
      DialogHelper.showErrorDialog(
          description: chargesResponse!.message.toString());
    }
  }

  Future getPin(dynamic charges) async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecurityPin()),
    );
    if (results.containsKey("pin") && results.isNotEmpty) {
      setState(() {
        callApi(results["pin"], charges.toInt());
      });
    }
  }

  Future callApi(String tPin, int charges) async {
    var body = {
      "SubServiceID": transactionType == "UPI" ? 26 : 25,
      "BankID": payoutBankData.bankId,
      "OperatorId": transactionType == "UPI"
          ? 1
          : transactionType == "IMPS"
              ? 971
              : 972,
      "Amount": int.parse(amount.value.text.toString()),
      "AccountNumber": payoutBankData.accountNo,
      "AccountHolderName": payoutBankData.beneficiaryName,
      "isSave": 0,
      "BankIfsc": payoutBankData.ifsc ?? "",
      "TransactionSource": "APP",
      "IpAddress": ":1",
      "tPass": tPin
    };
    var json = await payoutController.payout(body);
    commonResponse = PayoutReportResponse.fromJson(json);
    if (commonResponse.status == true) {
      Get.offNamed('/success', arguments: {
        'serviceName': transactionType == "UPI" ? "UPI" : "BANK",
        'id': int.parse(commonResponse.data?[0].id.toString() ?? "0"),
        'amount': amount.value.text.toString(),
        'msg': commonResponse.data?[0].heading ?? "NA",
        'subServiceId': transactionType == "UPI" ? 26 : 25,
      });
    } else {
      if (commonResponse.code == 1001) {
        DialogHelper.showErrorDialog(description: commonResponse.message!);
      } else {
        if (commonResponse.message! == "Insufficient Balance !") {
          DialogHelper.showErrorDialog(description: commonResponse.message!);
        } else {
          Get.offNamed('/failed', arguments: {
            'serviceName': transactionType == "UPI" ? "UPI" : "BANK",
            'id': int.parse(commonResponse.data?[0].id.toString() ?? "0"),
            'amount': amount.value.text.toString(),
            'msg': commonResponse.data?[0].heading ?? "NA",
            'subServiceId': transactionType == "UPI" ? 26 : 25,
          });
        }
      }
    }
  }
}