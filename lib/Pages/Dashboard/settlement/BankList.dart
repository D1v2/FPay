import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Controllers/SelfSettlementController.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Network/Models/SelfBankResponse.dart';
import 'package:fpay/Pages/Dashboard/settlement/AddBank.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class BankList extends StatefulWidget {
  const BankList({Key? key}) : super(key: key);

  @override
  State<BankList> createState() => _BankListState();
}

class _BankListState extends State<BankList> {
  final controller = SelfSettlementController();
  TextEditingController amountController = TextEditingController();
  SelfBankResponse? response;
  CommonResponse? commonResponse;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => bankList());
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
                margin: const EdgeInsets.only(left: 20),
                child: Align(
                  child: InkWell(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
              title: Column(
                children: [
                  Text("Self Settlement",
                      style: AppStyle.txtPoppinsBold18.copyWith()),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(
                        "Available Limit ${response?.data?[0].aepsBalance ?? "NA"}",
                        style:
                            AppStyle.txtPoppinsBold18.copyWith(fontSize: 12)),
                  ),
                ],
              ),
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20.0))),
              actions: [
                response.isNull || response?.data?.length == 0
                    ? Container(
                        margin: const EdgeInsets.only(right: 20, top: 10),
                        child: InkWell(
                          onTap: () => addAccount(),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.whiteA700.withOpacity(0.3)),
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              ),
                              Icon(
                                Icons.add,
                                color: AppColor.lightBlue801,
                              )
                            ],
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            body: Container(
                padding: const EdgeInsets.all( 20),
                child: response.isNull || response!.data!.isEmpty
                    ? Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 50,
                              color: AppColor.gray600,
                            ),
                            Text(
                              "No Data Found",
                              style: TextStyle(
                                color: AppColor.gray600,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      )
                    : SingleChildScrollView(
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
                                      color: AppColor.lightBlue801
                                          .withOpacity(0.1),
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  child: TextFormField(
                                    enabled: false,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColor.gray600),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                      hintText:
                                          response?.data?[0].holderName ??
                                              "NA",
                                      hintStyle: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                      contentPadding: const EdgeInsets.all(10),
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
                                      color: AppColor.lightBlue801
                                          .withOpacity(0.1),
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    maxLength: 18,
                                    enabled: false,
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColor.gray600),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                      hintText: response
                                              ?.data?[0].accountNumber ??
                                          "NA",
                                      hintStyle: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                      contentPadding: const EdgeInsets.all(10),
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
                                      color: AppColor.lightBlue801
                                          .withOpacity(0.1),
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    maxLength: 18,
                                    enabled: false,
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColor.gray600),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                      hintText:
                                          response?.data?[0].ifsc ?? "NA",
                                      hintStyle: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                      contentPadding: const EdgeInsets.all(10),
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
                                      color: AppColor.lightBlue801
                                          .withOpacity(0.1),
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    maxLength: 18,
                                    enabled: false,
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColor.gray600),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                      hintText:
                                          response?.data?[0].branch ?? "NA",
                                      hintStyle: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                      contentPadding: const EdgeInsets.all(10),
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
                                      border: Border.all(
                                          color: AppColor.whiteA700,
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  child: TextFormField(
                                    controller: amountController,
                                    keyboardType: TextInputType.phone,
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
                                        contentPadding: const EdgeInsets.all( 10),
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
                              decoration:
                                  AppDecoration.mainGradient.copyWith(
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
                    ))));
  }

  Future bankList() async {
    var json = await controller.bankList({});
    response = SelfBankResponse.fromJson(json);
    setState(() {});
  }

  addAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddBank()),
    );
  }

  Future sendAmount() async {
    if (amountController.value.text.isEmpty ||
        int.parse(amountController.value.text.toString()) <= 0) {
      DialogHelper.showToast("Please enter the valid amount...");
    } else {
      var body = {
        "BankAutoId": response?.data?[0].bankAutoId,
        "AccountNumber": response?.data?[0].accountNumber,
        "IFSC": response?.data?[0].ifsc,
        "HolderName": response?.data?[0].holderName,
        "Branch": response?.data?[0].branch,
        "AccountType": response?.data?[0].accountType,
        "IpAddress": ":1",
        "AepsBalance": response?.data?[0].aepsBalance.toString(),
        "BankName": response?.data?[0].bankName,
        "TransferAmount": amountController.value.text
      };
      var json = await controller.selfTransaction(body);
      commonResponse = CommonResponse.fromJson(json);
      if (commonResponse?.status == true) {
        DialogHelper.showSuccessWithBack(
            context: context,
            description:
                commonResponse?.message ?? "Amount has been transferred");
      } else {
        DialogHelper.showErrorDialog(
            description: commonResponse?.message ?? "Something went wrong !!");
      }
    }
  }
}