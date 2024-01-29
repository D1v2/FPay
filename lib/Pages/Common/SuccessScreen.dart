import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Pages/Dashboard/reports/AepsInfo.dart';
import 'package:fpay/Pages/Dashboard/reports/DMTInfo.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:get/get.dart';

import '../../Utils/FunctionUtils.dart';
import '../Dashboard/reports/PayoutInfo.dart';
import '../Dashboard/reports/RechargeInfo.dart';

class SuccessScreen extends StatefulWidget {
 const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late String serviceName;
  late int id;
  late String amount;
  late String msg;
  late int subServiceId;

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> arguments = Get.arguments;
    serviceName = arguments['serviceName'];
    id = arguments['id'];
    amount = arguments['amount'];
    msg = arguments['msg'];
    subServiceId = arguments['subServiceId'];
    playLocalAsset();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColor.lightBlue800,
              image: DecorationImage(
                image: AssetImage(ImageConstant.successImage),
                fit: BoxFit.cover,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1)),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2)),
                  child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Image.asset(ImageConstant.successGif)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 30),
                child: Text(
                  "₹$amount.00",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: AppColor.whiteA700.withOpacity(0.8),
                      fontSize: 41),
                ),
              ),
              Text(
                "Transaction is Successful",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: AppColor.whiteA700.withOpacity(0.8)),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Text(
                    msg,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: AppColor.whiteA700.withOpacity(0.8),
                        fontSize: 15),
                  )),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => goToInfo(),
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width / 2.5 -16,
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.whiteA700.withOpacity(0.8),
                                width: 1),
                            borderRadius: BorderRadius.circular(18)),
                        child: Text(
                          "View Details".toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: AppColor.whiteA700.withOpacity(0.8)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => goToHome(context),
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width / 2.5 - 16,
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.whiteA700.withOpacity(0.8),
                                width: 1),
                            borderRadius: BorderRadius.circular(18)),
                        child: Text(
                          "done".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: AppColor.whiteA700.withOpacity(0.8)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void goToInfo() {
    if (serviceName == "DMT") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DMTInfo(
                  isHome: true,
                  id: id,
                  subService: subServiceId,
                )),
      );
    } else if (serviceName == "BANK" || serviceName == "UPI") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => PayoutInfo(
                  isHome: true,
                  id: id,
                  subService: subServiceId,
                )),
      );
    } else if (serviceName == "AEPS") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => AepsInfo(
                  isHome: true,
                  id: id,
                  subService: subServiceId,
                )),
      );
    } else if (serviceName == "BBPS" ||
        serviceName == "RECHARGE") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => RechargeInfo(
                  isHome: true,
                  id: id,
                  subServiceId: subServiceId,
                )),
      );
    } else if (serviceName == "CREDIT") {
      DialogHelper.showToast("Coming soon....");
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => RechargeInfo(
      //             isHome: true,
      //             id: widget.id,
      //             subServiceId: widget.subServiceId,
      //           )),
      // );
    }else if(serviceName == "MATM"){
      DialogHelper.showToast("Coming soon....");
    }
  }

  void playLocalAsset() async {
    AudioPlayer player = AudioPlayer();
    ByteData bytes = await rootBundle
        .load(ImageConstant.successRingtone); //load audio from assets
    Uint8List audioBytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await player.playBytes(audioBytes);
    if (result == 1) {
      //play success
      print("---------- audio is playing.");
    } else {
      print("---------------- Error while playing audio.");
    }
  }
}
