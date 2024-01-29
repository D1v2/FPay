import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpay/Network/Models/DoRechargeResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/common_image_view.dart';
import 'package:get/get.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/RechargeControllers.dart';
import '../../../Network/Models/DropDownMasterResponse.dart';
import '../../../Network/Models/HomeIconsResponse.dart';
import '../../../Network/Models/OperatorData.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/custom_icon_button.dart';
import '../../Common/SecurityPin.dart';

class RechargePayment extends StatefulWidget {
  const RechargePayment({Key? key}) : super(key: key);

  @override
  State<RechargePayment> createState() => _RechargePaymentState();
}

class _RechargePaymentState extends State<RechargePayment> {
  final controller = RechargeControllers();
  DoRechargeResponse? rechargeResponse;
  TextEditingController amountController = TextEditingController();

  String? address;

  late String? mobile;
  late String? name;
  late HomeIconsData? homeIconsData;
  late String? amount;
  late String? validation;
  late OperatorData operatorData;
  late DropDownMasterData? circleData;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> arguments = Get.arguments;
    mobile = arguments['number'];
    name = arguments['name'];
    homeIconsData = arguments['iconData'];
    validation = arguments['validation'];
    operatorData = arguments['operatorData'];
    circleData = arguments['circleData'];
    ipAddress();
    amountController = TextEditingController(text: arguments['amount']);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
          title: Text("Recharge Payment",
              style: AppStyle.txtPoppinsBold18.copyWith()),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: ListTile(
                  leading: SvgPicture.asset(ImageConstant.userAvatarIcon),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name ?? "NA",
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                      Text(
                        "Validity: $validation",
                        style: AppStyle.normalLabelHeading
                            .copyWith(color: AppColor.lightBlue801),
                      )
                    ],
                  ),
                  subtitle: Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          mobile ?? "NA",
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                        Text(
                          "${operatorData.operatorName}, ${circleData?.name ?? "NA"}",
                          style: AppStyle.normalLabelHeading
                              .copyWith(color: AppColor.gray500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: size.height / 3,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CommonImageView(
                      imagePath: ImageConstant.rechargePaymentBackgroundImage,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 40, top: 80),
                            alignment: Alignment.center,
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              alignment: Alignment.center,
                              width: 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("₹",
                                      textAlign: TextAlign.center,
                                      style: AppStyle.normalLabelHeading
                                          .copyWith(
                                              color: AppColor.lightBlue800,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w800)),
                                  Container(
                                    width: 100,
                                    margin: const EdgeInsets.only(left: 5),
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      enabled: false,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '00',
                                        counterText: '',
                                      ),
                                      maxLines: 1,
                                      maxLength: 5,
                                      controller: amountController,
                                      textAlign: TextAlign.start,
                                      style: AppStyle.normalLabelHeading
                                          .copyWith(
                                              color: AppColor.lightBlue800,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  height: (60.00),
                                  width: 220,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      begin: const Alignment(
                                        0.5,
                                        -3.0616171314629196e-17,
                                      ),
                                      end: const Alignment(
                                        0.5,
                                        0.9999999999999999,
                                      ),
                                      colors: [
                                        AppColor.lightBlue800,
                                        AppColor.blue500,
                                      ],
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Change Plan",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsSemiBold16
                                            .copyWith(letterSpacing: 1.00)),
                                  ))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              /* Container(
                margin: const EdgeInsets.all(30),
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.percent,
                          color: AppColor.lightBlue800,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: const Text(
                            "Apply Promocode",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),*/
              GestureDetector(
                  onTap: () {
                    if (amountController.value.text.isEmpty) {
                      DialogHelper.showToast("Please enter the amount...");
                    } else if (int.parse(
                            amountController.value.text.toString()) <=
                        9) {
                      DialogHelper.showToast("Please select the valid plan...");
                    } else {
                      getPin();
                    }
                  },
                  child: Container(
                      margin:
                          const EdgeInsets.only(top: 70, left: 30, right: 30),
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
                                          height: 30,
                                          width: 30,
                                          margin: const EdgeInsets.all(5),
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
                              child: Text("pay".toUpperCase(),
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
    );
  }

  Future getPin() async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecurityPin()),
    );
    if (results.containsKey("pin") && results.isNotEmpty) {
      setState(() {
        hitApi(results["pin"]);
      });
    }
  }

  Future hitApi(String mpin) async {
    var body = {
      "SubServiceId": homeIconsData!.id,
      "RechargeOperatorId": operatorData.id,
      "CircleId": circleData?.id ?? "0",
      "MobileNo": "",
      "CaNumber": mobile,
      "RechargeAmount": amountController.value.text,
      "IpAddress": address,
      "tPass": mpin
    };
    var json = await controller.doRechargePlans(body);
    rechargeResponse = DoRechargeResponse.fromJson(json);
    setState(() {
      if (rechargeResponse?.status == true && rechargeResponse?.code == 200) {
        Get.offNamed('/success', arguments: {
          'serviceName': "RECHARGE",
          'id': int.parse(rechargeResponse?.data?[0].id.toString() ?? "0"),
          'amount': amountController.value.text.toString(),
          'msg': rechargeResponse?.data?[0].heading ?? "NA",
          'subServiceId': int.parse(homeIconsData?.id ?? "1"),
        });
      } else if (rechargeResponse?.status == true &&
          rechargeResponse?.code == 1002) {
        Get.offNamed('/pending', arguments: {
          'serviceName': "RECHARGE",
          'id': int.parse(rechargeResponse?.data?[0].id.toString() ?? "0"),
          'amount': amountController.value.text.toString(),
          'msg': rechargeResponse?.data?[0].heading ?? "NA",
          'subServiceId': int.parse(homeIconsData?.id ?? "1"),
        });
      } else {
        if (rechargeResponse?.code == 1001) {
          DialogHelper.showErrorDialog(
              description: rechargeResponse!.message.toString());
        } else {
          if (rechargeResponse!.message! == "Insufficient Balance !") {
            DialogHelper.showErrorDialog(
                description: rechargeResponse!.message!);
          } else {
            Get.offNamed('/failed', arguments: {
              'serviceName': "RECHARGE",
              'id': int.parse(rechargeResponse?.data?[0].id.toString() ?? "0"),
              'amount': amountController.value.text.toString(),
              'msg': rechargeResponse?.data?[0].heading ?? "NA",
              'subServiceId': int.parse(homeIconsData?.id ?? "1"),
            });
          }
        }
      }
    });
  }

  Future ipAddress() async {
    address = await Ipify.ipv4();
  }
}
