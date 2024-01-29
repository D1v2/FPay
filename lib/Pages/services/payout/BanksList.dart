import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Network/Controllers/PayoutController.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Network/Models/PayoutBankResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';

import '../../../Network/Models/PayoutBankData.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/WidgetsConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/math_utils.dart';

class BankList extends StatefulWidget {
  String serviceId = "";

  BankList({Key? key, required this.serviceId}) : super(key: key);

  @override
  State<BankList> createState() => _BankListState();
}

class _BankListState extends State<BankList> {
  final TextEditingController _searchController = TextEditingController();
  final payoutController = PayoutController();
  PayoutBankResponse? payoutBankResponse;
  CommonResponse? deleteResponse;
  var bankListOnSearch = [];
  var bankList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => addedBankList());
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
        title: Text(widget.serviceId == "25" ? "Bank Accounts" : "UPI Account",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 10),
            child: InkWell(
              onTap: () => addAccounts(),
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
        padding: const EdgeInsets.all( 15),
        child: payoutBankResponse.isNull ||
                payoutBankResponse?.data?.length == 0
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
            : Column(
                children: [
                  Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    semanticContainer: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {
                            bankListOnSearch = bankList
                                .where((element) =>
                                    (element.beneficiaryName)
                                        .toLowerCase()
                                        .contains(value.toLowerCase()) ||
                                    (element.accountNo)
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "Search here..",
                            suffixIcon: const Icon(Icons.search),
                            contentPadding: const EdgeInsets.only(left: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)))),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        _searchController.text.isNotEmpty &&
                                bankListOnSearch.isEmpty
                            ? dataNotFound()
                            : bankList.isNotEmpty
                                ? Expanded(
                                    child: ListView.builder(
                                      itemCount:
                                          _searchController.text.isNotEmpty
                                              ? bankListOnSearch.length
                                              : bankList.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                            onTap: () => goToInfo(
                                                _searchController
                                                        .text.isNotEmpty
                                                    ? bankListOnSearch[index]
                                                    : bankList[index]),
                                            child: bankItem(_searchController
                                                    .text.isNotEmpty
                                                ? bankListOnSearch[index]
                                                : bankList[index]));
                                      },
                                    ),
                                  )
                                : dataNotFound()
                      ],
                    ),
                  ),
                ],
              ),
      ),
    ));
  }

  void goToInfo(PayoutBankData? payoutBankData) {}

  Widget bankItem(PayoutBankData? payoutBankData) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      clipBehavior: Clip.hardEdge,
      color: AppColor.whiteA700,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 20),
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 12, right: 12),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.gray600, width: 1),
                                borderRadius: BorderRadius.circular(8)),
                            child: SvgPicture.asset(
                              widget.serviceId == "25"
                                  ? ImageConstant.Id25
                                  : ImageConstant.Id26,
                              height: widget.serviceId == "25" ? 35 : 15,
                              width: widget.serviceId == "25" ? 35 : 15,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              payoutBankData?.beneficiaryName ?? "NA",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.bankNameColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Gotham'),
                            ),
                            widget.serviceId == "25"
                                ? Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      payoutBankData?.bankName ?? "NA",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColor.bankNameColor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Gotham'),
                                    ),
                                  )
                                : Container(),
                          ],

                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => deleteAccount(payoutBankData),
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
              padding: const EdgeInsets.all( 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.formBackGround),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.serviceId == "25"
                          ? "AC     :     ${payoutBankData?.accountNo ?? "0"}"
                          : "UPI Id     :     ${payoutBankData?.accountNo ?? "0"}",
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColor.black901),
                    ),
                  ),
                  widget.serviceId == "25"
                      ? Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            "IFSC   :    ${payoutBankData?.ifsc ?? "NA"}",
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.black901),
                          ))
                      : Container(),
                ],
              ),
            ),
            widget.serviceId == "25"
                ? Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => {doImpsPayment(payoutBankData, "IMPS")},
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            width: size.width / 2.8 - 8,
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
                          onTap: () => doImpsPayment(payoutBankData, "NEFT"),
                          child: Container(
                              width: size.width / 2.8 - 8,
                              padding: const EdgeInsets.only(top: 15, bottom: 15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.gray503, width: 1),
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
                  )
                : InkWell(
                    onTap: () => doImpsPayment(payoutBankData, "UPI"),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      margin: const EdgeInsets.only(top: 10),
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
    );
  }

  void doImpsPayment(PayoutBankData? payoutBankData, String transactionType) {
    Get.toNamed('/bankPaymentPayout',
        arguments: {'bankData': payoutBankData, 'tt': transactionType});
  }

  void addAccounts() {
    widget.serviceId == "25"
        ? Get.toNamed('/addBankPayout')
        : Get.toNamed('/addUpiPayout', arguments: "");
  }

  Future addedBankList() async {
    var body = {"SubServiceID": widget.serviceId};
    var json = await payoutController.banksList(body);
    payoutBankResponse = PayoutBankResponse.fromJson(json);
    if (payoutBankResponse?.status != true) {
      DialogHelper.showErrorWithBack(
          context: context,
          description:
              payoutBankResponse?.message ?? "Something went wrong...");
    }
    bankList = PayoutBankResponse.fromJson(json).data!;
    setState(() {});
  }

  Future deleteAccount(PayoutBankData? data) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Warning',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: AppColor.black900),
            ),
            content: Text("Do you want to delete account?",
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
                  callDeleteApi(data);
                },
              ),
            ],
          );
        });
  }

  Future callDeleteApi(PayoutBankData? data) async {
    var body = {
      "ID": data?.id ?? 0,
      "SubServiceID": int.parse(widget.serviceId)
    };
    var json = await payoutController.deleteAccounts(body);
    deleteResponse = CommonResponse.fromJson(json);
    setState(() {});
    if (deleteResponse?.status == true) {
      DialogHelper.showSuccessDialog(
          description: "Account has been deleted successfully...");
      addedBankList();
    } else {
      DialogHelper.showErrorDialog(
          description: deleteResponse?.message ?? "NA");
    }
  }
}
