import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/AepsControllers.dart';
import '../../../Network/Models/AepsLoginStatus.dart';
import '../../../Network/Models/CommonResponse.dart';
import '../../../Network/Models/DropDownMasterResponse.dart';
import '../../../Network/Models/ReportApesResponse.dart';
import '../../../Utils/DialogHelper.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class AepsPro extends StatefulWidget {
  const AepsPro({super.key});

  @override
  State<AepsPro> createState() => _AepsProState();
}

class _AepsProState extends State<AepsPro> {
  static const aepsChannel = MethodChannel('aeps');
  int selected = 0;
  int currentScanDevice = 0;
  DropDownMasterData? bankData;
  ReportApesResponse? response;
  CommonResponse? commonResponse, outletLoginResponse;
  AepsLoginStatus? aepsLoginStatus;

  final aepsController = AepsControllers();

  TextEditingController mobileNumber = TextEditingController();
  TextEditingController aadhaarNumber = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController amount = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => checkOnBoarding(1));
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
        title: Text("APES PRO", style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
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
                      customRadioButton("Cash Withdrawal", 1),
                      customRadioButton("Aadhaar Pay", 2),
                      customRadioButton("Mini Statement", 3),
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
                    const Text(
                      "Aadhaar Number",
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
                        maxLength: 12,
                        controller: aadhaarNumber,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter Aadhaar Number',
                          hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          contentPadding: EdgeInsets.all(10),
                          counterText: '',
                        ),
                      ),
                    ),
                    const Text(
                      "Bank Name",
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
                            top: 11, bottom: 11, left: 10, right: 10),
                        margin: const EdgeInsets.only(top: 5, bottom: 20),
                        decoration: BoxDecoration(
                            color: AppColor.whiteA700,
                            border:
                                Border.all(color: AppColor.whiteA700, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          bankData?.name ?? "Select Your Bank",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: bankData?.name == null
                                  ? AppColor.gray503
                                  : AppColor.black900,
                              fontSize: 13),
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
                                    const EdgeInsets.only(top: 5, bottom: 10),
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
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.formBackGround),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Device",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
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
                              customScannerButton("Mantra", 0),
                              customScannerButton("Morpho", 1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  scan();
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
                    "Scan Now",
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

  Widget customRadioButton(String txt, int index) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(() {
          selected = index;
          if (index == 1) {
            checkOnBoarding(2);
          }
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width / 3.0,
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
        width: size.width / 2.8,
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

  Future selectBank() async {
    var rs = await Get.toNamed('/aepsBank', arguments: true);
    if (rs != null && rs is DropDownMasterData) {
      setState(() {
        bankData = rs;
      });
    }
  }

  Future checkOnBoarding(int value) async {
    var body = {
      "Action": value == 1 ? "CheckOnboarding" : "CheckAepsProAuthencity"
    };
    var jsonBody = await aepsController.checkOnBoardingPro(body);
    commonResponse = CommonResponse.fromJson(jsonBody);
    if (commonResponse?.status == false && value == 2) {
      showLoginSheet("AuthenticityCW");
    } else if (value == 1 && commonResponse?.code == 201) {
      Get.offNamed("/aepsProOnboarding");
    } else if (value == 1 && commonResponse?.code == 202) {
      showLoginSheet("Authentication");
    } else {}
  }

  Future showLoginSheet(String status) {
    final Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        constraints: BoxConstraints.loose(Size(size.width, size.height * 0.20)),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.gray500,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "AEPS Outlet Login",
                      style: AppStyle.normalLabelHeading.copyWith(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => scanFinger('Mantra', status),
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 16,
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                color: AppColor.lightBlue801,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "MANTRA",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: AppColor.whiteA700.withOpacity(0.8)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => scanFinger('Morpho', status),
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 16,
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                color: AppColor.gray503.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(18)),
                            child: Text(
                              "MORPHO",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: AppColor.black901.withOpacity(0.8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void scanFinger(String deviceName, status) async {
    if (Platform.isAndroid) {
      var arguments = {'device': deviceName};
      var data = await aepsChannel.invokeMethod('AEPSPIDDATA', arguments);
      setState(() {
        if (data.substring(0, 1) == "0") {
          outLetLogin(data.substring(2), status);
          if (Get.isDialogOpen == true) Get.back();
        } else {
          DialogHelper.showErrorDialog(description: data.substring(2));
        }
      });
    } else {
      DialogHelper.errorSnackBar(
          context, "AEPS functionality work only android mobile");
    }
  }

  Future outLetLogin(String pidData, status) async {
    var body = {
      "Action": status,
      "IpAddress": "192.187.125.399",
      "Latitude": "17.4185",
      "Longitude": "178.2525",
      "PidData": pidData
    };
    var json = await aepsController.checkOnBoardingPro(body);
    outletLoginResponse = CommonResponse.fromJson(json);
    if (outletLoginResponse?.status != true) {
      DialogHelper.showErrorWithBack(
          context: context,
          description: outletLoginResponse!.message.toString());
    } else {
      DialogHelper.showSuccessDialog(
          description: outletLoginResponse!.message.toString());
    }
  }

  void scan() async {
    if (mobileNumber.text.toString().isEmpty ||
        mobileNumber.text.toString().length != 10) {
      DialogHelper.showToast("Please enter valid mobile number");
    } else if (aadhaarNumber.text.toString().isEmpty ||
        aadhaarNumber.text.toString().length != 12) {
      DialogHelper.showToast("Please enter valid aadhaar number");
    } else if (bankData == null) {
      DialogHelper.showToast("Please select your bank");
    } else if (selected == 1 || selected == 2) {
      if (amount.text.toString().isEmpty ||
          int.parse(amount.text.toString()) <= 0) {
        DialogHelper.showToast("Please enter valid amount");
      } else {
        if (Platform.isAndroid) {
          var arguments = {
            'device': currentScanDevice == 0 ? "Mantra" : "Morpho"
          };
          var data = await aepsChannel.invokeMethod('AEPSPIDDATA', arguments);
          setState(() {
            if (data.substring(0, 1) == "0") {
              doAeps(data.substring(2));
            } else {
              DialogHelper.showErrorDialog(description: data.substring(2));
            }
          });
        } else {
          DialogHelper.errorSnackBar(
              context, "AEPS functionality work only android mobile");
        }
      }
    } else {
      if (Platform.isAndroid) {
        var arguments = {
          'device': currentScanDevice == 0 ? "Mantra" : "Morpho"
        };
        var data = await aepsChannel.invokeMethod('AEPSPIDDATA', arguments);
        setState(() {
          if (data.substring(0, 1) == "0") {
            doAeps(data.substring(2));
          } else {
            DialogHelper.showErrorDialog(description: data.substring(2));
          }
        });
      } else {
        DialogHelper.errorSnackBar(
            context, "AEPS functionality work only android mobile");
      }
    }
  }

  Future doAeps(String pidData) async {
    var body = {
      "SubServiceID": selected == 0
          ? "21"
          : selected == 1
              ? "23"
              : selected == 2
                  ? "24"
                  : "22",
      "BankId": bankData!.id.toString(),
      "MobileNumber": mobileNumber.value.text.toString(),
      "AdhaarNumber": aadhaarNumber.value.text.toString(),
      "RequestRemarks": "Nothing",
      "Amount":
          (selected == 0 || selected == 3) ? 0 : amount.value.text.toString(),
      "IpAddress": ":1",
      "PidData": pidData
    };

    var json = await aepsController.doAeps(body);
    response = ReportApesResponse.fromJson(json);
    if (response?.status == true) {
      if (selected == 3) {
        Get.offNamed('/miniStatement', arguments: response?.message ?? "NA");
      } else if (selected == 0) {
        showBottomSheet();
      } else {
        Get.offNamed('/success', arguments: {
          'serviceName': "AEPS",
          'id': response!.data![0].id!,
          'amount': amount.value.text.toString(),
          'msg': response!.data![0].heading ?? "NA",
          'subServiceId': selected == 1 ? 23 : 24
        });
      }
    } else {
      if (selected == 1 || selected == 2) {
        Get.offNamed('/failed', arguments: {
          'serviceName': "AEPS",
          'id': response?.data?[0].id ?? 0,
          'amount': amount.value.text.toString(),
          'msg': response!.data![0].heading ?? "NA",
          'subServiceId': selected == 1
              ? 23
              : selected == 2
                  ? 24
                  : 0
        });
      } else {
        DialogHelper.showErrorDialog(
            description: response!.message!.toString());
      }
    }
  }

  Future showBottomSheet() {
    return showModalBottomSheet(
        context: context,
        constraints: BoxConstraints.loose(Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.40)),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.gray500,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray100, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColor.gray600.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  response?.data?[0].memberID ?? "NA",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.normalLabelHeading
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Status",
                                          style: AppStyle.normalLabelHeading
                                              .copyWith(
                                                  color: AppColor.amountColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12)),
                                      Text("Success",
                                          style: AppStyle.normalLabelHeading
                                              .copyWith(
                                                  color: AppColor.amountColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Transaction ID",
                                        style: AppStyle.normalLabelHeading,
                                      ),
                                      Text(response?.data?[0].refId ?? "NA",
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle.normalLabelHeading),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Bank Name",
                                          style: AppStyle.normalLabelHeading),
                                      Text(bankData?.name ?? "NA",
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle.normalLabelHeading),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Aadhaar No",
                                          style: AppStyle.normalLabelHeading),
                                      Text(aadhaarNumber.value.text.toString(),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle.normalLabelHeading),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColor.gray600.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Remaining Balance",
                                          style: AppStyle.normalLabelHeading),
                                      Text("₹ ${response?.message ?? "NA"}",
                                          maxLines: 1,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle.normalLabelHeading),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("API Message",
                                          style: AppStyle.normalLabelHeading),
                                      Text("Balance Fetch Successfully",
                                          style: AppStyle.normalLabelHeading
                                              .copyWith(
                                                  color: AppColor.amountColor)),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}