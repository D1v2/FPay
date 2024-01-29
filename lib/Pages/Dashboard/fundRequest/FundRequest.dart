import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/ApiConstants.dart';
import '../../../Network/Models/DropDownMasterResponse.dart';
import '../../../Utils/DateFormatField.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/JWTTokenProvider.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';

class FundRequest extends StatefulWidget {
  const FundRequest({Key? key}) : super(key: key);

  @override
  State<FundRequest> createState() => _FundRequestState();
}

class _FundRequestState extends State<FundRequest> {
  var textReference = TextEditingController();
  var textRemark = TextEditingController();
  var textAmount = TextEditingController();
  DropDownMasterData? bankData;
  String selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  String selectedValue = "Credit";
  var values = ["Cash", "Online", "QR", "Credit"];
  CommonResponse? commonResponse;
  File? imageFile;
  DateTime now = DateTime.now();
  String formattedTime = "";

  @override
  void initState() {
    super.initState();
    formattedTime = " ${now.hour}:${now.minute}:${now.second}";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColor.lightBlue800,
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
        title: Text("Fund Request",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
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
                    Text(
                      "Select Your Payment Mode",
                      style: AppStyle.formLabelHeading,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1)),
                          contentPadding: const EdgeInsets.only(
                              top: 3, bottom: 3, left: 10, right: 10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: selectedValue,
                            items: values.map((e) {
                              return DropdownMenuItem(value: e, child: Text(e));
                            }).toList(),
                            onChanged: (String? selectedValues) {
                              setState(() {
                                selectedValue = selectedValues!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    selectedValue == "Online"
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                      top: 15, bottom: 15, left: 10, right: 10),
                                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                                  decoration: BoxDecoration(
                                      color: AppColor.whiteA700,
                                      border: Border.all(
                                          color: AppColor.whiteA700, width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    bankData?.name ?? "Select Your Bank",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.gray503,
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                              Text(
                                "Reference",
                                style: AppStyle.formLabelHeading,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5, bottom: 10),
                                padding: const EdgeInsets.only(top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                    color: AppColor.whiteA700,
                                    border: Border.all(
                                        color: AppColor.whiteA700, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  maxLength: 16,
                                  controller: textReference,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    hintText: "Enter Reference Number",
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
                                "Remark",
                                style: AppStyle.formLabelHeading,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5, bottom: 10),
                                padding: const EdgeInsets.only(top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                    color: AppColor.whiteA700,
                                    border: Border.all(
                                        color: AppColor.whiteA700, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  maxLength: 200,
                                  controller: textRemark,
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    hintText: "Enter Remark",
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
                                "Choose Image",
                                style: AppStyle.formLabelHeading,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5, bottom: 10),
                                child: Stack(children: [
                                  Container(
                                    height: 60,
                                    margin: const EdgeInsets.only(top: 5, bottom: 10),
                                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                                    decoration: BoxDecoration(
                                        color: AppColor.whiteA700,
                                        border: Border.all(
                                            color: AppColor.whiteA700,
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        border: InputBorder.none,
                                        hintText:
                                            imageFile?.path ?? "Choose Image",
                                        hintStyle: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                        contentPadding: const EdgeInsets.all(10),
                                        counterText: '',
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => selectImageType(),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(top: 5),
                                        width: 65,
                                        height: 60,
                                        decoration: AppDecoration.mainGradient
                                            .copyWith(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10))),
                                        child: const Text(
                                          "Upload",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.formBackGround),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Select Date",
                      style: AppStyle.formLabelHeading,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      child: DateFormatFields(
                        initialDate: DateTime.now(),
                        dateFormat: 'yyyy-MM-dd',
                        onChanged: (DateTime date) {
                          selectedDate = DateFormat('yyyy-MM-dd').format(date);
                        },
                      ),
                    ),
                    Text(
                      "Amount",
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
                        maxLength: 6,
                        controller: textAmount,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Amount",
                          hintStyle:  TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          contentPadding:  EdgeInsets.all( 10),
                          counterText: '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () => checkCondition(),
                  child: Container(
                      height: (60.00),
                      margin:
                          const EdgeInsets.only(left: 25, top: 20, right: 25),
                      child: Stack(alignment: Alignment.center, children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                decoration: AppDecoration
                                    .gradientLightblue800Blue500
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder15),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomIconButton(
                                          height: 25,
                                          width: 25,
                                          margin: const EdgeInsets.all(10),
                                          variant: IconButtonVariant
                                              .OutlineWhiteA701,
                                          shape: IconButtonShape.CircleBorder15,
                                          padding:
                                              IconButtonPadding.PaddingAll8,
                                          alignment: Alignment.centerRight,
                                          child: CommonImageView(
                                              svgPath: ImageConstant.moveIcon))
                                    ]))),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 40, top: 21, right: 40, bottom: 20),
                              child: Text("Confirm".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold16
                                      .copyWith(letterSpacing: 1.00))),
                        )
                      ]))),
            ],
          ),
        ),
      ),
    ));
  }

  Future selectBank() async {
    // Map results = await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => AepsBanks(
    //             aeps: false,
    //           )),
    // );
    // if (results.containsKey("bankData") && results.isNotEmpty) {
    //   setState(() {
    //     bankData = results["bankData"];
    //   });
    // }
  }

  Future selectImageType() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Gallery'),
                onTap: () {
                  captureImage(false);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  captureImage(true);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> captureImage(bool camera) async {
    Navigator.of(context).pop();
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: camera ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    } else {}
  }

  checkCondition() {
    if (textAmount.value.text.toString().isEmpty) {
      DialogHelper.showToast("Please enter the amount...");
    } else if (int.parse(textAmount.value.text.toString()) <= 0) {
      DialogHelper.showToast("Please enter the valid  amount...");
    } else if (bankData == null && selectedValue == "Online") {
      DialogHelper.showToast("Please select the bank...");
    } else if (textReference.text.toString().isEmpty &&
        selectedValue == "Online") {
      DialogHelper.showToast("Please enter the reference number...");
    } else if (imageFile.isNull && selectedValue == "Online") {
      DialogHelper.showToast("Please upload the image...");
    } else {
      DialogHelper.showLoading();
      sendRequest();
    }
  }

  Future sendRequest() async {
    String token = JWTTokenProvider().getToken();
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(ApiConstants.baseUrl + ApiConstants.fundRequest),
      );
      request.headers['Authorization'] = 'Bearer $token';
      if (imageFile != null) {
        var imageUploadStream = http.ByteStream(imageFile!.openRead());
        var length = await imageFile!.length();
        var multipartFile =
            http.MultipartFile('Attachment', imageUploadStream, length);
        request.files.add(multipartFile);
      }

      request.fields['PaymentModeID'] = selectedValue == "Cash"
          ? "1"
          : selectedValue == "Online"
              ? "2"
              : selectedValue == "QR"
                  ? "3"
                  : "4";

      request.fields['Amount'] = textAmount.value.text.toString().trim();
      request.fields['RequestDate'] = selectedDate + formattedTime;
      request.fields['ToBanks'] = bankData?.id ?? "0";
      request.fields['Refno'] = textReference.value.text.toString().trim();
      request.fields['Remark'] = textRemark.value.text.toString().trim();
      request.fields['Action'] = "Request";
      request.fields['StatusId'] = "0";
      var response = await request.send();
      DialogHelper.hideLoading();
      response.stream.bytesToString().then((value) {
        final responseJson = jsonDecode(value);
        commonResponse = CommonResponse.fromJson(responseJson);
        if (commonResponse!.status!) {
          DialogHelper.showSuccessDialog(
              description: commonResponse!.message.toString());
        } else {
          DialogHelper.showErrorDialog(
              description: commonResponse!.message.toString());
        }
      });
    } catch (e) {
      print("exceptions ----- $e");
    }
  }
}


