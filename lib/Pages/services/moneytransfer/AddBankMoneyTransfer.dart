import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Controllers/MoneyTransferController.dart';
import 'package:fpay/Network/Models/BankResponse.dart';
import 'package:fpay/Pages/Common/BankList.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/PayoutController.dart';
import '../../../Network/Models/CommonResponse.dart';
import '../../../Network/Models/HomeIconsResponse.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';
import '../../Common/OTPScreen.dart';

class AddBankMoneyTransfer extends StatefulWidget {
  const AddBankMoneyTransfer({Key? key}) : super(key: key);

  @override
  State<AddBankMoneyTransfer> createState() => _AddBankMoneyTransferState();
}

class _AddBankMoneyTransferState extends State<AddBankMoneyTransfer> {
  BankData? bankData;
  CommonResponse? response;
  TextEditingController holderName = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  final payoutController = PayoutController();
  late CommonResponse accountInformation,
      accountVerification,
      addAccountResponse;
  var focusNode = FocusNode();
  bool isAccountVerify = false;
  bool isCheck = false;
  final controller = MoneyTransferController();

  late String number;
  late HomeIconsData? homeIconsData;

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> arguments = Get.arguments;
    homeIconsData = arguments['iconData'];

    mobileNumber.value = TextEditingValue(text:arguments['number']);
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
          title: Text("Add Bank", style: AppStyle.txtPoppinsBold18.copyWith()),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                        "Select Your Bank",
                        style: AppStyle.formLabelHeading,
                      ),
                      InkWell(
                        onTap: () {
                          selectBank();
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 10, right: 10),
                          margin: const EdgeInsets.only(top: 5, bottom: 10),
                          decoration: BoxDecoration(
                              color: AppColor.whiteA700,
                              border: Border.all(
                                  color: AppColor.whiteA700, width: 1),
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
                        "Account Information",
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
                        "Account Number",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
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
                          maxLines: 1,
                          maxLength: 18,
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
                            contentPadding: EdgeInsets.all(10),
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
                          maxLines: 1,
                          textCapitalization: TextCapitalization.characters,
                          controller: ifscCode,
                          maxLength: 11,
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
                          focusNode: focusNode,
                          controller: holderName,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: "Enter Account Holder Name",
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
                          margin: const EdgeInsets.only(top: 3, right: 5, bottom: 25),
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
                      Text(
                        "Mobile Number",
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
                          maxLines: 1,
                          maxLength: 10,
                          controller: mobileNumber,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: "Enter Mobile Number",
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
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      addBank();
                    },
                    child: Container(
                        height: (65.00),
                        margin: const EdgeInsets.only(
                            left: 23, top: 30, right: 23, bottom: 10),
                        child: Stack(alignment: Alignment.center, children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  decoration: AppDecoration
                                      .gradientLightblue800Blue500
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder15),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomIconButton(
                                            height: 30,
                                            width: 30,
                                            margin: const EdgeInsets.all(14),
                                            variant: IconButtonVariant
                                                .OutlineWhiteA701,
                                            shape:
                                                IconButtonShape.CircleBorder15,
                                            padding:
                                                IconButtonPadding.PaddingAll8,
                                            alignment: Alignment.centerRight,
                                            child: CommonImageView(
                                                svgPath:
                                                    ImageConstant.moveIcon))
                                      ]))),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 40, top: 21, right: 40, bottom: 20),
                                child: Text("Add Bank",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsSemiBold16
                                        .copyWith(letterSpacing: 1.00))),
                          )
                        ])))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future selectBank() async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BankList(service: "DMR")),
    );
    if (results.containsKey('bankData')) {
      setState(() {
        bankData = results['bankData'];
        ifscCode.value = TextEditingValue(text: bankData!.ifscGlobal!);
      });
    }
  }

  Future addBank() async {
    if (bankData == null) {
      DialogHelper.showToast("Please select your bank");
    } else if (holderName.text.toString().isEmpty) {
      DialogHelper.showToast("Please enter your name");
    } else if (!isAccountNumber(accountNumber.value.text.toString())) {
      DialogHelper.showToast("Please enter valid account number");
    } else if (!isMobileNumber(mobileNumber.value.text.toString())) {
      DialogHelper.showToast("Please enter valid mobile number");
    } else if (!isIfscCode(ifscCode.value.text.toString())) {
      DialogHelper.showToast("Enter valid ifsc code");
    } else {
      var body = {
        "ServiceID": 3,
        "BankId": bankData!.bankID,
        "Action": "SaveAndGenerateOTP",
        "IFSC": ifscCode.value.text,
        "AccountNo": accountNumber.value.text,
        "BeneficiaryName": holderName.value.text,
        "Mobile": mobileNumber.value.text,
        "OTP": "",
        "OtpReference": ""
      };
      var json = await controller.addBank(body);
      response = CommonResponse.fromJson(json);

      if (response!.status == true) {
        verifyOtp(body, response!.message!.toString());
      } else {
        DialogHelper.showErrorDialog(description: response!.message.toString());
      }
      setState(() {});
    }
  }

  Future verifyOtp(var body, String otpRef) async {
    var rs = await Get.toNamed('/otp', arguments: true);
    if (rs != null && rs is String) {
      setState(() {
        callApi(rs, body, otpRef);
      });
    }
  }

  Future callApi(String otp, var body, String otpRef) async {
    body['Action'] = "ValidateOTP";
    body['OTP'] = otp;
    body['OtpReference'] = otpRef;

    var json = await controller.deleteBank(body);
    addAccountResponse = CommonResponse.fromJson(json);
    setState(() {
      if (addAccountResponse.status == true) {
        DialogHelper.showSuccessWithBack(
            context: context,
            description: "Bank has been deleted successfully...");
      } else {
        DialogHelper.showErrorDialog(
            description: addAccountResponse.message.toString());
      }
    });
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
        "VerifyFrom": "DMT",
        "IpAddress": ":1",
        "IsAlreadyVerified": 0
      };
      var json = await payoutController.verifyAccount(body);
      accountVerification = CommonResponse.fromJson(json);

      if (accountVerification.status == true) {
        isAccountVerify = true;
        holderName.value = TextEditingValue(text: accountVerification.message!);
        DialogHelper.showToast("Account has been verified successfully...");
      } else {
        DialogHelper.showErrorDialog(
            description: accountVerification.message.toString());
      }
    }
  }
}