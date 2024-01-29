import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Controllers/MoneyTransferController.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Network/Models/PayoutReportResponse.dart';
import 'package:fpay/Pages/Common/FailedScreen.dart';
import 'package:fpay/Pages/Common/SecurityPin.dart';
import 'package:fpay/Utils/ChargesDialog.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Models/DmrBankData.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../Common/SuccessScreen.dart';

class ConfirmMoneyTransfer extends StatefulWidget {
  const ConfirmMoneyTransfer({Key? key}) : super(key: key);

  @override
  State<ConfirmMoneyTransfer> createState() => _ConfirmMoneyTransferState();
}

class _ConfirmMoneyTransferState extends State<ConfirmMoneyTransfer> {
  final controller = MoneyTransferController();
  late TextEditingController fullName;
  late TextEditingController accountNumber;
  late TextEditingController ifscCode;
  late TextEditingController bankName;
  TextEditingController amount = TextEditingController();
  PayoutReportResponse? transferAmountResponse;
  CommonResponse? chargesResponse;
  late DmrBankData bankData;

  @override
  void initState() {
    super.initState();
    bankData = Get.arguments;
    fullName = TextEditingController(text: bankData.beneficiaryName);
    accountNumber = TextEditingController(text: bankData.accountNo);
    ifscCode = TextEditingController(text: bankData.ifsc);

    //  bankName = TextEditingController(text: widget.bankData.);
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
          title: Text("Transfer Amount",
              style: AppStyle.txtPoppinsBold18.copyWith()),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
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
                        "Account Number",
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "IFSC Code",
                            style: AppStyle.formLabelHeading,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 10),
                            padding: const EdgeInsets.only(top: 3, bottom: 3),
                            decoration: BoxDecoration(
                                color: AppColor.lightBlue801.withOpacity(0.1),
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
                          /*   Text(
                            "Bank Name",
                            style: AppStyle.formLabelHeading,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 10),
                            padding: const EdgeInsets.only(top: 3, bottom: 3),
                            decoration: BoxDecoration(
                                color: AppColor.lightBlue801.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              enabled: false,
                              // controller: bankName,
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColor.gray600),
                              decoration: InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                hintText: "Enter Bank Name",
                                hintStyle: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                                contentPadding: const EdgeInsets.all( 10),
                                counterText: '',
                              ),
                            ),
                          ),*/
                        ],
                      )
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
                                  margin: const EdgeInsets.only(left: 15, right: 8),
                                  child: const Icon(
                                    Icons.currency_rupee,
                                  ))),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => transferAmount(),
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
      ),
    );
  }

  Future transferAmount() async {
    if (amount.value.text == "" || int.parse(amount.text.toString()) < 1) {
      DialogHelper.showToast("Please enter valid amount");
    } else {
      calculateCharges(amount.value.text.toString());
    }
  }

  Future calculateCharges(String amount) async {
    var body = {"SubServiceID": 31, "Amount": amount};
    var json = await controller.chargesCalculate(body);
    chargesResponse = CommonResponse.fromJson(json);
    if (chargesResponse?.status == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ChargesDialog(
                currentAmount: int.parse(amount),
                charges: chargesResponse?.data ?? 0.0,
                bankName: bankData.bankName!);
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

  Future getPin(dynamic totalAmount) async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecurityPin()),
    );
    if (results.containsKey("pin") && results.isNotEmpty) {
      setState(() {
        callApi(results["pin"], totalAmount.toInt());
      });
    }
  }

  Future callApi(String pin, int charges) async {
    var body = {
      "ServiceID": 3,
      "ID": bankData.id,
      "BeneficiaryID": bankData.beneficiaryID,
      "MobileNumber": bankData.mobile,
      "BankName": bankData.bankName,
      "AccountNumber": bankData.accountNo,
      "BankIfsc": bankData.ifsc,
      "BeneficiaryName": bankData.beneficiaryName,
      "TransactionMode": "IMPS",
      "TransactionSource": "APP",
      "TxnAmount": amount.value.text,
      "ChargeAmount": charges,
      "TotalAmount": charges + int.parse(amount.value.text.toString()),
      "tPass": pin
    };

    var json = await controller.moneyTransfer(body);
    transferAmountResponse = PayoutReportResponse.fromJson(json);
    if (transferAmountResponse?.status == true) {
      Get.offNamed('/success', arguments: {
        'serviceName': "DMT",
        'id': int.parse(transferAmountResponse?.data?[0].id.toString() ?? "0"),
        'amount': amount.value.text.toString(),
        'msg': transferAmountResponse?.data?[0].heading ?? "NA",
        'subServiceId': 31,
      });
    } else {
      if (transferAmountResponse?.code == 1001) {
        DialogHelper.showErrorDialog(
            description: transferAmountResponse!.message!);
      } else {
        if (transferAmountResponse!.message! == "Insufficient Balance !") {
          DialogHelper.showErrorDialog(
              description: transferAmountResponse!.message!);
        } else {
          Get.offNamed('/failed', arguments: {
            'serviceName': "DMT",
            'id': int.parse(
                transferAmountResponse?.data?[0].id.toString() ?? "0"),
            'amount': amount.value.text.toString(),
            'msg': transferAmountResponse?.data?[0].heading ?? "NA",
            'subServiceId': 31,
          });
        }
      }
    }

    /* setState(() {
        if (transferAmountResponse?.status == true) {
          DialogHelper.showSuccessWithBack(
              context: context, description: "Transfer Successfully Completed");
        } else {
          DialogHelper.showErrorDialog(
              description: transferAmountResponse!.message.toString());
        }
      });*/
  }
}
