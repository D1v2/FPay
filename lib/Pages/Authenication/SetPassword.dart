import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Pages/Authenication/LoginPage.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Network/Controllers/AuthenticationController.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';
import '../../Utils/math_utils.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({Key? key}) : super(key: key);

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool _passwordVisible = true;
  bool _passwordConfirmVisible = true;
  String imgEye = ImageConstant.passwordHiddenIcon;
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final controller = AuthenticationController();
  CommonResponse? response;
  String? otp = "";

  @override
  void initState() {
    super.initState();
    otp = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColor.black900,
                  ),
                  onPressed: () => Navigator.pop(context)),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Text("Set the new Password",
                    style: AppStyle.txtPoppinsSemiBold18
                        .copyWith(fontSize: 22, fontWeight: FontWeight.w600)),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                    "Please Enter Your Register Mobile Number To Receive The New Password.",
                    textAlign: TextAlign.start,
                    style: AppStyle.txtPoppinsRegular16Gray803.copyWith(
                      height: 1.67,
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(
                    left: 5, top: 10, bottom: 10, right: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.gray50,
                ),
                child: TextFormField(
                  obscureText: !_passwordVisible,
                  controller: newPassword,
                  maxLength: 12,
                  maxLines: 1,
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
                          _passwordVisible = !_passwordVisible;
                          imgEye = ImageConstant.passwordViewIcon;
                        });
                      },
                      child: Image(
                        image: !_passwordVisible
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
                padding: const EdgeInsets.only(
                    left: 5, top: 10, bottom: 10, right: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.gray50,
                ),
                child: TextFormField(
                  obscureText: !_passwordConfirmVisible,
                  controller: confirmPassword,
                  maxLength: 12,
                  maxLines: 1,
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: "Confirm Password",
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
                          _passwordConfirmVisible = !_passwordConfirmVisible;
                          imgEye = ImageConstant.passwordViewIcon;
                        });
                      },
                      child: Image(
                        image: !_passwordConfirmVisible
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
                  onTap: () => setPassword(),
                  child: Container(
                      height: (60.00),
                      margin:
                          const EdgeInsets.only(left: 23, top: 20, right: 23),
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
                              child: Text("Save",
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

  Future setPassword() async {
    if (newPassword.value.text.isEmpty) {
      DialogHelper.showToast("Please enter the new password...");
    } else if (confirmPassword.value.text.isEmpty) {
      DialogHelper.showToast("Please enter the confirm password...");
    } else if (newPassword.value.text != confirmPassword.value.text) {
      DialogHelper.showToast(
          "New password and confirm password must be same...");
    } else {
      var body = {
        "action": "ForgotPassword",
        "otp": otp,
        "newPass": newPassword.value.text.toString(),
        "confirmPass": confirmPassword.value.text.toString()
      };
      var json = await controller.forgotCredentials(body);
      response = CommonResponse.fromJson(json);
      if (response?.status == true) {
        DialogHelper.showToast("Password has been changed successfully...");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else {
        DialogHelper.showErrorDialog(description: response!.message.toString());
      }
    }
  }
}
