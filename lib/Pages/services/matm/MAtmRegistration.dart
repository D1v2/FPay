import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/MAtmController.dart';
import '../../../Network/Models/CommonResponse.dart';
import '../../../Utils/DialogHelper.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class MAtmRegistration extends StatefulWidget {
  const MAtmRegistration({super.key});

  @override
  State<MAtmRegistration> createState() => _MAtmRegistrationState();
}

class _MAtmRegistrationState extends State<MAtmRegistration> {
  static const aepsChannel = MethodChannel('aeps');
  int currentScanDevice = 0;
  late bool registration;
  final controller = MAtmController();
  CommonResponse? commonResponse;

  @override
  void initState() {
    super.initState();
    registration = Get.arguments;
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
        title: Text(registration ? "Complete Registration" : "Complete Login",
            style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: SvgPicture.asset(
              ImageConstant.pendingIcon,
              height: 150,
            )),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                registration
                    ? "Please complete your registration first"
                    : "Today Login",
                style: AppStyle.formLabelHeading.copyWith(fontSize: 15),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Select Device",
                  style: AppStyle.normalLabelHeading,
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: AppColor.lightBlue801, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customScannerButton("Mantra", 0),
                      customScannerButton("Morpho", 1),
                    ],
                  ),
                ),
              ],
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
    ));
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

  void scan() async {
    if (Platform.isAndroid) {
      var arguments = {'device': currentScanDevice == 0 ? "Mantra" : "Morpho"};
      var data = await aepsChannel.invokeMethod('AEPSPIDDATA', arguments);
      setState(() {
        if (data.substring(0, 1) == "0") {
          completeRegistration(data.substring(2));
        } else {
          DialogHelper.showErrorDialog(description: data.substring(2));
        }
      });
    } else {
      DialogHelper.errorSnackBar(
          context, "AEPS functionality work only android mobile");
    }
  }

  Future completeRegistration(String pidData) async {
    var body = {
      "Action": "RegistrationOrLogin",
      "IpAddress": "192.187.125.399",
      "Latitude": "17.4185",
      "Longitude": "178.2525",
      "PidData": pidData
    };
    var jsonBody = await controller.checkOnboarding(body);
    commonResponse = CommonResponse.fromJson(jsonBody);
    if (commonResponse?.status == true) {
      Get.offNamed('/matm');
    } else {
      DialogHelper.showErrorDialog(
          description: commonResponse!.message.toString());
    }
  }
}
