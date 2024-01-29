import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Network/Controllers/AuthenticationController.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final controller = AuthenticationController();
  CommonResponse? response;
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String imgEye = ImageConstant.passwordHiddenIcon;

  bool _passwordVisible1 = true;
  bool _passwordVisible2 = true;
  bool _passwordVisible3 = true;

  @override
  void initState() {
    super.initState();
    _passwordVisible1 = false;
    _passwordVisible2 = false;
    _passwordVisible3 = false;
    imgEye = ImageConstant.passwordHiddenIcon;
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
          title: Text("Change Password ",
              style: AppStyle.txtPoppinsBold18.copyWith()),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
        ),
        body: Container(
          padding: const EdgeInsets.all( 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Change Your Password",
                    style: AppStyle.normalLabelHeading
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  "OTP sent to your registered mobile, a secure and easy way to verify your identity.",
                  style: AppStyle.normalLabelHeading
                      .copyWith(fontSize: 14, color: AppColor.gray600),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.gray50,
                  ),
                  child: TextFormField(
                    obscureText: !_passwordVisible1,
                    controller: currentPassword,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Old Password',
                      fillColor: AppColor.gray50,
                      prefixIconConstraints: const BoxConstraints(
                          minWidth: (16.00), minHeight: (16.00)),
                      counterText: '',
                      prefixIcon: Container(
                          margin: const EdgeInsets.only(
                            left: 18,
                            right: 14,
                          ),
                          child:
                              CommonImageView(svgPath: ImageConstant.lockIcon)),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _passwordVisible1 = !_passwordVisible1;
                            imgEye = ImageConstant.passwordViewIcon;
                          });
                        },
                        child: Image(
                          image: !_passwordVisible1
                              ? AssetImage(ImageConstant.passwordHiddenIcon)
                              : AssetImage(ImageConstant.passwordViewIcon),
                          height: 20,
                          width: 20,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                          minWidth: (18.00), minHeight: (14.00)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.gray50,
                  ),
                  child: TextFormField(
                    obscureText: !_passwordVisible2,
                    controller: newPassword,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'New Password',
                      fillColor: AppColor.gray50,
                      prefixIconConstraints: const BoxConstraints(
                          minWidth: (16.00), minHeight: (16.00)),
                      counterText: '',
                      prefixIcon: Container(
                          margin: const EdgeInsets.only(
                            left: 18,
                            right: 14,
                          ),
                          child:
                              CommonImageView(svgPath: ImageConstant.lockIcon)),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _passwordVisible2 = !_passwordVisible2;
                            imgEye = ImageConstant.passwordViewIcon;
                          });
                        },
                        child: Image(
                          image: !_passwordVisible2
                              ? AssetImage(ImageConstant.passwordHiddenIcon)
                              : AssetImage(ImageConstant.passwordViewIcon),
                          height: 20,
                          width: 20,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                          minWidth: (18.00), minHeight: (14.00)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.gray50,
                  ),
                  child: TextFormField(
                    obscureText: !_passwordVisible3,
                    controller: confirmPassword,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Confirm Password',
                      fillColor: AppColor.gray50,
                      prefixIconConstraints: const BoxConstraints(
                          minWidth: (16.00), minHeight: (16.00)),
                      counterText: '',
                      prefixIcon: Container(
                          margin: const EdgeInsets.only(
                            left: 18,
                            right: 14,
                          ),
                          child:
                              CommonImageView(svgPath: ImageConstant.lockIcon)),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _passwordVisible3 = !_passwordVisible3;
                            imgEye = ImageConstant.passwordViewIcon;
                          });
                        },
                        child: Image(
                          image: !_passwordVisible3
                              ? AssetImage(ImageConstant.passwordHiddenIcon)
                              : AssetImage(ImageConstant.passwordViewIcon),
                          height: 20,
                          width: 20,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                          minWidth: (18.00), minHeight: (14.00)),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () => onChangePassword(context),
                    child: Container(
                        height: (65.00),
                        margin:
                            const EdgeInsets.only(left: 23, top: 30, right: 23),
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
                                            margin: const EdgeInsets.all(14),
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
                                child: Text("change password".toUpperCase(),
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
      ),
    );
  }

  Future<void> onChangePassword(BuildContext context) async {
    if (currentPassword.text.toString().isEmpty) {
      DialogHelper.showToast("Please enter your current password");
    } else if (newPassword.text.toString().isEmpty) {
      DialogHelper.showToast("Please enter your new password");
    } else if (confirmPassword.text.toString().isEmpty) {
      DialogHelper.showToast("Please fill confirm password");
    } else {
      var body = {
        "action": "ChangePassword",
        "oldPass": currentPassword.text.toString(),
        "newPass": newPassword.text.toString(),
        "confirmPass": confirmPassword.text.toString()
      };
      var res = await controller.changeCredentials(body);
      response = CommonResponse.fromJson(res);
      if (response?.status == true) {
        DialogHelper.showSuccessWithBack(
            context: context, description: response!.message!);
      } else {
        DialogHelper.showErrorDialog(description: response!.message!);
      }
    }
  }
}
