import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpay/Network/Controllers/MoneyTransferController.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Network/Models/DMRBankResponse.dart';
import 'package:fpay/Pages/Common/OTPScreen.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:get/get.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Models/DmrBankData.dart';
import '../../../Network/Models/HomeIconsResponse.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class DMRBanks extends StatefulWidget {
  const DMRBanks({Key? key}) : super(key: key);

  @override
  State<DMRBanks> createState() => _DMRBanksState();
}

class _DMRBanksState extends State<DMRBanks> {
  final controller = MoneyTransferController();
  List<DmrBankData>? dmrBankData = <DmrBankData>[];
  DmrBankResponse dmrBankResponse = DmrBankResponse();
  CommonResponse? deleteResponse, limitResponse;
  late String number;
  late HomeIconsData? homeIconsData;

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> arguments = Get.arguments;
    number = arguments['number'];
    homeIconsData = arguments['iconData'];
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => allBanks());
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
          title: Column(
            children: [
              Text("Money Transfer",
                  style: AppStyle.txtPoppinsBold18.copyWith()),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text("Available Limit ${limitResponse?.message ?? "NA"}",
                    style: AppStyle.txtPoppinsBold18.copyWith(fontSize: 12)),
              ),
            ],
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20, top: 10),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/addBankMoneyTransfer',
                      arguments: {'number': number, 'iconData': homeIconsData});
                },
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
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    Icon(
                      Icons.add,
                      color: AppColor.lightBlue801,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: !dmrBankData.isNull
              ? RefreshIndicator(
                  onRefresh: allBanks, child: showBankList())
              : Container(
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
                        "No Banks Found \n Please Add Bank To Transfer Amount",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.gray600,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget bankItem(DmrBankData bankData) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 12, right: 12),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColor.gray600, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(
                          ImageConstant.Id25,
                          height: 35,
                          width: 35,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          bankData.beneficiaryName ?? "NA",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColor.lightBlue801,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Gotham'),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            bankData.mobile ?? "NA",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColor.lightBlue801,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Gotham'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => deleteBank(bankData),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.gray503.withOpacity(0.3)),
                    child: const Icon(Icons.delete),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.gray100),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Account Number     :      ${bankData.accountNo ?? "NA"}",
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColor.black901),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        "IFSC                           :      ${bankData.ifsc ?? "NA"}",
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.black901),
                      )),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Status                        :      ${bankData.verified == null ? "Not Verified" : "Verified"}",
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: bankData.verified == null
                                ? AppColor.gray600
                                : AppColor.greenA700),
                      ))
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/confirmMoneyTransfer', arguments: bankData);
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  alignment: Alignment.center,
                  decoration: AppDecoration.mainGradient
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
                  child: Text(
                    "Transfer",
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColor.whiteA700),
                  )),
            ),
            /* Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all( 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    //  onTap: () => {doImpsPayment(payoutBankData, "IMPS")},
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      width: size.width / 2.8,
                      decoration: AppDecoration.mainGradient.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder18),
                      child: Text(
                        "IMPS",
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColor.whiteA700),
                      ),
                    ),
                  ),
                  InkWell(
                    // onTap: () => doImpsPayment(payoutBankData, "NEFT"),
                    child: Container(
                        width: size.width / 2.8,
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColor.gray503, width: 1),
                            borderRadius: BorderRadius.circular(18)),
                        child: Text(
                          "NEFT",
                          style: TextStyle(
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColor.gray600),
                        )),
                  ),
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }

  Widget showBankList() {
    return ListView.separated(
        itemCount: dmrBankData!.length,
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          return bankItem(dmrBankData![index]);
        });
  }

  Future allBanks() async {
    var body = {"ServiceID": 3, "Mobile": number};
    var json = await controller.bankList(body);
    dmrBankResponse = DmrBankResponse.fromJson(json);
    setState(() {});
    if (dmrBankResponse.status == true) {
      dmrBankData = dmrBankResponse.data;
      limit();
    } else {
      DialogHelper.showErrorDialog(
          description: dmrBankResponse.message.toString());
    }
  }

  Future limit() async {
    var body = {"ServiceID": 3, "Mobile": number};
    var json = await controller.limit(body);
    limitResponse = CommonResponse.fromJson(json);
    setState(() {});
  }

  Future deleteBank(DmrBankData data) async {
    var body = {
      "Action": "DeleteBeneficiary",
      "ServiceID": 3,
      "BeneficiaryID": data.beneficiaryID,
      "Mobile": data.mobile,
    };
    var json = await controller.deleteBank(body);
    deleteResponse = CommonResponse.fromJson(json);
    setState(() {
      if (deleteResponse?.status == true) {
        verifyOtp(data, deleteResponse!.message!);
      } else {
        DialogHelper.showErrorDialog(
            description: deleteResponse!.message.toString());
      }
    });
  }

  Future verifyOtp(DmrBankData data, String otpRef) async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OTPScreen()),
    );
    if (results.containsKey("pin") && results.isNotEmpty) {
      setState(() {
        callApi(results["pin"], data, otpRef);
      });
    }
  }

  Future callApi(String otp, DmrBankData data, String otpRef) async {
    var body = {
      "Action": "ValidateOTP",
      "ServiceID": 3,
      "BeneficiaryID": data.beneficiaryID,
      "Mobile": data.mobile,
      "OTP": otp,
      "OtpReference": otpRef
    };
    var json = await controller.deleteBank(body);
    deleteResponse = CommonResponse.fromJson(json);
    setState(() {
      if (deleteResponse?.status == true) {
        DialogHelper.showToast("Bank has been deleted successfully...");
        allBanks();
      } else {
        DialogHelper.showErrorDialog(
            description: deleteResponse!.message.toString());
      }
    });
  }
}
