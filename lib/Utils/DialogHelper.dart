import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/app_style.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';

import '../Pages/Authenication/LoginPage.dart';
import 'PreferenceManager.dart';
import 'app_decoration.dart';

class DialogHelper {
  // without back click
  static showErrorDialog(
      {String title = "Warning !",
      String description = "Something went wrong"}) {
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          child: Container(
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: SvgPicture.asset(ImageConstant.errorIconDialog),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (Get.isDialogOpen == true) Get.back();
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 25),
                    padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red,
                        border: Border.all(color: Colors.black12, width: 0.9)),
                    child: Text(
                      "close".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  //Show error dialog with back
  static showErrorWithBack(
      {String title = "Warning !",
      String description = "Something went wrong",
      required BuildContext context}) {
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: SvgPicture.asset(ImageConstant.errorIconDialog),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  margin: const EdgeInsets.only(top: 15),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (Get.isDialogOpen == true) Get.back();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding:
                    const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                    margin: const EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red,
                        border: Border.all(color: Colors.black12, width: 0.9)),
                    child: Text(
                      "Back".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  //Success Dialog
  static showSuccessDialog(
      {String title = "Success", String description = "Successfully done"}) {
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: SvgPicture.asset(ImageConstant.successIconDialog),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (Get.isDialogOpen == true) Get.back();
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding:
                    const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                    margin: const EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.lightBlue801,
                        border: Border.all(color: Colors.black12, width: 0.9)),
                    child: const Text(
                      "Done",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  //Show success dialog with back

  static showSuccessWithBack(
      {String title = "Success",
      String description = "Successfully done",
      required BuildContext context}) {
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: SvgPicture.asset(ImageConstant.successIconDialog),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  alignment: Alignment.center,
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (Get.isDialogOpen == true) Get.back();
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding:
                    const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                    margin: const EdgeInsets.only(top: 25),
                    decoration: AppDecoration.mainGradient
                        .copyWith(borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  // Show Toast
  static showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white);
  }

  //Show Loading
  static void showLoading() {
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const CircularProgressIndicator(),
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Please wait...",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  //Hide Dialog
  static void hideLoading() {
    if (Get.isDialogOpen == true) Get.back();
  }

  //SignOut Dialog
  static void logOutDialog(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageConstant.logoutIcon),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text(
                "Logout",
                style: AppStyle.normalLabelHeading
                    .copyWith(fontSize: 35, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Are you sure, you want to logout?",
                textAlign: TextAlign.center,
                style: AppStyle.normalLabelHeading
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 17),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      PreferenceManager.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: Container(
                      width: size.width / 3.5,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.gray500.withOpacity(0.3)),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: AppColor.whiteA701),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: size.width / 3.5,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.red700),
                      child: Text(
                        "No",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: AppColor.whiteA701),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  exitDialog(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.lightBlue801),
              child: const Icon(
                Icons.logout,
                size: 50,
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text(
                "Exit",
                style: AppStyle.normalLabelHeading
                    .copyWith(fontSize: 35, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Are you sure, you want to exit?",
                textAlign: TextAlign.center,
                style: AppStyle.normalLabelHeading
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 17),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      exit(0);
                    },
                    child: Container(
                      width: size.width / 3.5,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.gray500.withOpacity(0.3)),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: AppColor.whiteA701),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: size.width / 3.5,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.red700),
                      child: Text(
                        "No",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: AppColor.whiteA701),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  static void successSnackBar(BuildContext context, String msg) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: AppColor.greenA700,
      message: msg,
      title: 'Success',
      icon: const Icon(
        Icons.gpp_good,
        size: 38.0,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
    ).show(context);
    /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
            height: 120,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColor.greenA700),
            child: Row(
              children: [
                Icon(
                  Icons.gpp_good,
                  color: AppColor.whiteA701,
                  size: 40,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Success",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Poppins'),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(
                              msg,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColor.whiteA701),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ))));*/
  }

  static void errorSnackBar(BuildContext context, String msg) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: AppColor.red700,
      message: msg,
      title: 'Error',
      icon: const Icon(
        Icons.cancel_outlined,
        size: 38.0,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
    ).show(context);
    /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        content: Container(
            height: 120,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColor.red700),
            child: Row(
              children: [
                Icon(
                  Icons.cancel_outlined,
                  color: AppColor.whiteA701,
                  size: 40,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Failed",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Poppins'),
                        ),
                        Expanded(
                          child: Container(
                            margin:const EdgeInsets.only(top: 5),
                            child: Text(
                              msg,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColor.whiteA701),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ))));*/
  }
}
