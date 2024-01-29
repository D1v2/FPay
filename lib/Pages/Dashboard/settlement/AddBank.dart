import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/SelfSettlementController.dart';
import '../../../Network/Models/BankResponse.dart';
import '../../../Utils/DialogHelper.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../Common/BankList.dart';

class AddBank extends StatefulWidget {
  const AddBank({Key? key}) : super(key: key);

  @override
  State<AddBank> createState() => _AddBankState();
}

class _AddBankState extends State<AddBank> {
  final controller = SelfSettlementController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController holderName = TextEditingController();
  TextEditingController branchName = TextEditingController();
  BankData? bankData;
  int currentScanDevice = 0;
  CommonResponse? commonResponse;

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
        title: Text("Add Bank Account",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding:  const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding:  const EdgeInsets.all(15),
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
                        padding:  const EdgeInsets.only(
                            top: 15, bottom: 15, left: 10, right: 10),
                        margin:  const EdgeInsets.only(top: 5, bottom: 10),
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
                margin:  const EdgeInsets.only(top: 15),
                padding:  const EdgeInsets.all(15),
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
                      margin:  const EdgeInsets.only(top: 5, bottom: 10),
                      padding:  const EdgeInsets.only(top: 3, bottom: 3),
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
                          hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          contentPadding:  EdgeInsets.all( 10),
                          counterText: '',
                        ),
                      ),
                    ),
                    Text(
                      "IFSC Code",
                      style: AppStyle.formLabelHeading,
                    ),
                    Container(
                      margin:  const EdgeInsets.only(top: 5, bottom: 10),
                      padding:  const EdgeInsets.only(top: 3, bottom: 3),
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
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Enter IFSC Code",
                          hintStyle:  TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          contentPadding:   EdgeInsets.all(10),
                          counterText: '',
                        ),
                      ),
                    ),
                    Text(
                      "Account Holder Name",
                      style: AppStyle.formLabelHeading,
                    ),
                    Container(
                      margin:  const EdgeInsets.only(top: 5, bottom: 10),
                      padding:  const EdgeInsets.only(top: 3, bottom: 3),
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
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Enter Account Holder Name",
                          hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          contentPadding:  EdgeInsets.all(10),
                          counterText: '',
                        ),
                      ),
                    ),
                    Text(
                      "Branch Name",
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
                        maxLength: 100,
                        maxLines: 1,
                        controller: branchName,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Enter Branch Name",
                          hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          contentPadding:  EdgeInsets.all(10),
                          counterText: '',
                        ),
                      ),
                    ),
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
                      "Account Type",
                      style: AppStyle.formLabelHeading,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColor.lightBlue801, width: 1)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            customScannerButton("Saving", 0),
                            customScannerButton("Current", 1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => addBank(),
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
            ],
          ),
        ),
      ),
    ));
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

  Future addBank() async {
    if (bankData == null) {
      DialogHelper.showToast("Please select the bank");
    } else if (!isAccountNumber(accountNumber.value.text.toString())) {
      DialogHelper.showToast("Please enter the valid account number...");
    } else if (!isIfscCode(ifscCode.value.text.toString())) {
      DialogHelper.showToast("Please enter the valid ifsc code...");
    } else if (holderName.value.text.isEmpty) {
      DialogHelper.showToast("Please enter the holder name...");
    } else if (branchName.value.text.isEmpty) {
      DialogHelper.showToast("Please enter the branch name...");
    } else {
      var body = {
        "BankAutoId": bankData!.bankID,
        "AccountNumber": accountNumber.value.text,
        "IFSC": ifscCode.value.text,
        "HolderName": holderName.value.text,
        "Branch": branchName.value.text,
        "AccountType": currentScanDevice == 0 ? "Saving" : "Current",
        "IpAddress": ":1"
      };
      var json = await controller.addBank(body);
      commonResponse = CommonResponse.fromJson(json);
      if (commonResponse?.status == true) {
        DialogHelper.showSuccessWithBack(
            context: context, description: commonResponse!.message.toString());
      } else {
        DialogHelper.showErrorDialog(
            description: commonResponse!.message.toString());
      }
    }
  }
}
