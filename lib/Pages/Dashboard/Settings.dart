import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpay/Pages/Dashboard/ChangMPin.dart';
import 'package:fpay/Pages/Dashboard/ChangePassword.dart';
import 'package:fpay/Pages/Dashboard/ForgotMPin.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Network/Controllers/AuthenticationController.dart';
import '../../Network/Models/CommonResponse.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import 'SideMenu.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final controller = AuthenticationController();
  CommonResponse? otpRes;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawerEnableOpenDragGesture: false,
        key: scaffoldKey,
        extendBody: true,
        endDrawer: const SideMenu(),
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
                child: CommonImageView(
                  svgPath: ImageConstant.mainNotificationIcon,
                  height: 34.00,
                  width: 34.00,
                ),
                onTap: () => goToNotification(),
              ),
            ),
          ),
          title: Text("Settings",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Align(
                child: InkWell(
                  child: CommonImageView(
                    svgPath: ImageConstant.menuIcon,
                    height: 16.00,
                    width: 20.00,
                  ),
                  onTap: () {
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                ),
              ),
            )
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 14,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => confirmDialog("password"),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          decoration: AppDecoration.fillGray50.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder9,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 24,
                                  top: 22,
                                  bottom: 22,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      ImageConstant.passwordIcon,
                                      height: 20,
                                      width: 20,
                                      color: AppColor.blue500,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 14,
                                        top: 3,
                                        bottom: 1,
                                      ),
                                      child: Text(
                                        "Change Password",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular14Gray800
                                            .copyWith(
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 25,
                                  right: 30,
                                  bottom: 25,
                                ),
                                child: SvgPicture.asset(
                                  ImageConstant.moveIconForward,
                                  height: 18,
                                  width: 12,
                                  color: AppColor.blue500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => confirmDialog("forgot"),
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            const EdgeInsets.only(left: 24, right: 24, top: 5),
                        decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder9,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                                top: 22,
                                bottom: 22,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    ImageConstant.passwordIcon,
                                    height: 20,
                                    width: 20,
                                    color: AppColor.blue500,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 14,
                                      top: 3,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "Forgot MPIN",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular14Gray800
                                          .copyWith(
                                        height: 1.00,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25,
                                right: 30,
                                bottom: 25,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.moveIconForward,
                                height: 18,
                                width: 12,
                                color: AppColor.blue500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => confirmDialog("mpin"),
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            const EdgeInsets.only(left: 24, right: 24, top: 5),
                        decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder9,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                                top: 22,
                                bottom: 22,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    ImageConstant.changeMPNIcon,
                                    height: 20,
                                    width: 20,
                                    color: AppColor.blue500,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 14,
                                      top: 3,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "Change MPIN",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular14Gray800
                                          .copyWith(
                                        height: 1.00,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25,
                                right: 30,
                                bottom: 25,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.moveIconForward,
                                height: 18,
                                width: 12,
                                color: AppColor.blue500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => goToNotification(),
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            const EdgeInsets.only(left: 24, right: 24, top: 5),
                        decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder9,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                                top: 22,
                                bottom: 22,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    ImageConstant.bankSVGIcon,
                                    height: 20,
                                    width: 20,
                                    color: AppColor.blue500,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 14,
                                      top: 3,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "My Bank Account",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular14Gray800
                                          .copyWith(
                                        height: 1.00,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25,
                                right: 30,
                                bottom: 25,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.moveIconForward,
                                height: 18,
                                width: 12,
                                color: AppColor.blue500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => goToNotification(),
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            const EdgeInsets.only(left: 24, right: 24, top: 5),
                        decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder9,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                                top: 22,
                                bottom: 22,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    ImageConstant.privacyIcon,
                                    height: 20,
                                    width: 20,
                                    color: AppColor.blue500,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 14,
                                      top: 3,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "Privacy Policy",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular14Gray800
                                          .copyWith(
                                        height: 1.00,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25,
                                right: 30,
                                bottom: 25,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.moveIconForward,
                                height: 18,
                                width: 12,
                                color: AppColor.blue500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => goToNotification(),
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            const EdgeInsets.only(left: 24, right: 24, top: 5),
                        decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder9,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                                top: 22,
                                bottom: 22,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    ImageConstant.termServiceIcon,
                                    height: 20,
                                    width: 20,
                                    color: AppColor.blue500,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                      top: 3,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "Terms Of Service",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular14Gray800
                                          .copyWith(
                                        height: 1.00,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25,
                                right: 30,
                                bottom: 25,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.moveIconForward,
                                height: 18,
                                width: 12,
                                color: AppColor.blue500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToNotification() {
    DialogHelper.showToast("Not Working on Testing Mode");
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const NotificationPage()),
    // );
  }

  confirmDialog(String value) {
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          child: Container(
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 15),
                  child: const Text(
                    "Warning",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Text(
                  "Are you want to change your $value.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  margin: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (Get.isDialogOpen == true) Get.back();
                          if (value == "forgot") {
                            sendOtp();
                          } else if (value == "password") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePassword()),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChangMPin()),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.lightBlue801),
                          child: Text("Confirm",
                              style: AppStyle.normalLabelHeading
                                  .copyWith(color: Colors.white)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (Get.isDialogOpen == true) Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColor.gray503, width: 1)),
                          child:
                              Text("Close", style: AppStyle.normalLabelHeading),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future getVerificationCode() async {
    var rs = await Get.toNamed('/otp', arguments: true);
    if (rs != null && rs is String) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ForgotMPin(
                    otp: rs,
                  )),
        );
      });
    }
  }

  Future sendOtp() async {
    var json = await controller.sendOTP({"TemplateId": "21"});
    otpRes = CommonResponse.fromJson(json);
    if (otpRes!.status == true) {
      getVerificationCode();
    } else {
      DialogHelper.showErrorWithBack(
          context: context, description: otpRes!.message.toString());
    }
  }
}
