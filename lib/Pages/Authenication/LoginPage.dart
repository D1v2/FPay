import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Pages/Authenication/ForgotPassword.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';

import '../../Network/Controllers/AuthenticationController.dart';
import '../../Network/Models/LoginResponse.dart';
import '../../Utils/FunctionUtils.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/PreferenceManager.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';
import '../Common/OTPScreen.dart';
import 'MobileSignup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginResponse? loginResponse, response;

  TextEditingController mobileNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  String imgEye = ImageConstant.passwordHiddenIcon;

  bool _passwordVisible = true;

  final controller = AuthenticationController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          /* bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin:
                      const EdgeInsets.only(bottom: 64, left: 66, right: 66),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account?  ",
                            style: TextStyle(
                                color: AppColor.gray800,
                                fontSize: (15),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1.00)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                onTapSignup();
                              },
                            text: "Sign up",
                            style: TextStyle(
                                color: AppColor.lightBlue800,
                                fontSize: (15),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                height: 1.00))
                      ]),
                      textAlign: TextAlign.left)),
            ],
          ),*/
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 29.0, right: 29.0, top: 73.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Login ",
                              style: AppStyle.txtPoppinsSemiBold24.copyWith()),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                              "Login to a world of seamless finance management",
                              style: AppStyle.txtPoppinsRegular15
                                  .copyWith(height: 1.67)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.gray50,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            controller: mobileNumber,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: 'Mobile Number',
                              fillColor: AppColor.gray50,
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: (16.00), minHeight: (16.00)),
                              counterText: '',
                              prefixIcon: Container(
                                  margin: const EdgeInsets.only(
                                    left: 18,
                                    right: 14,
                                  ),
                                  child: CommonImageView(
                                      svgPath: ImageConstant.callIcon)),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.gray50,
                          ),
                          child: TextFormField(
                            obscureText: !_passwordVisible,
                            controller: password,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: 'Password',
                              fillColor: AppColor.gray50,
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: (16.00), minHeight: (16.00)),
                              counterText: '',
                              prefixIcon: Container(
                                  margin: const EdgeInsets.only(
                                    left: 18,
                                    right: 14,
                                  ),
                                  child: CommonImageView(
                                      svgPath: ImageConstant.lockIcon)),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                    imgEye = ImageConstant.passwordViewIcon;
                                  });
                                },
                                child: Image(
                                  image: !_passwordVisible
                                      ? AssetImage(
                                          ImageConstant.passwordHiddenIcon)
                                      : AssetImage(
                                          ImageConstant.passwordViewIcon),
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
                            onTap: () {
                              onTapLogin(context);
                            },
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 23, top: 50, right: 23),
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              decoration: AppDecoration
                                                  .gradientLightblue800Blue500
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder15),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    CustomIconButton(
                                                        height: 25,
                                                        width: 25,
                                                        margin: const EdgeInsets
                                                            .all(5),
                                                        variant: IconButtonVariant
                                                            .OutlineWhiteA701,
                                                        shape: IconButtonShape
                                                            .CircleBorder15,
                                                        padding:
                                                            IconButtonPadding
                                                                .PaddingAll8,
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: CommonImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .moveIcon))
                                                  ]))),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 40,
                                                top: 10,
                                                right: 40,
                                                bottom: 10),
                                            child: Text("login".toUpperCase(),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsSemiBold16
                                                    .copyWith(
                                                        letterSpacing: 1.00))),
                                      )
                                    ]))),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: InkWell(
                            onTap: () {
                              onTapForgotPassword();
                            },
                            child: Text("Forgot Password?",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColor.lightBlue801,
                                  fontSize: (15),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onClick() {
    SystemNavigator.pop();
  }

  onTapSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MobileSignup()),
    );
  }

  onTapForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPassword()),
    );
  }

  Future<void> onTapLogin(BuildContext context) async {
    if (mobileNumber.value.text.isEmpty) {
      DialogHelper.errorSnackBar(context, "Mobile number can not be empty");
    } else if (!isMobileNumber(mobileNumber.value.text.toString())) {
      DialogHelper.errorSnackBar(context, "Please enter valid mobile number");
    } else if (password.text.isEmpty) {
      DialogHelper.errorSnackBar(context, "Please enter password");
    } else {
      PreferenceManager.setNumber(mobileNumber.value.text.toString());
      final body = {
        "action": "CustomerLogin",
        'userName': mobileNumber.value.text,
        'password': password.value.text,
        'tPass': "",
        'ipAddress': "-1",
        "otp": ""
      };
      var a = await controller.login(body);
      loginResponse = LoginResponse.fromJson(a);
      if (loginResponse?.status == true) {
        getOtp(body);
      } else {
        DialogHelper.showErrorDialog(
            description: loginResponse!.message.toString());
      }
    }
  }

  Future getOtp(var body) async {
    var rs = await Get.toNamed('/otp', arguments: true);
    if (rs != null && rs is String) {
      setState(() {
        callApi(rs, body);
      });
    }
  }

  Future callApi(String otp, var body) async {
    body['action'] = "CustomerLoginVerifyOtp";
    body['otp'] = otp;
    var json = await controller.login(body);
    print("json -- $json");
    response = LoginResponse.fromJson(json);
    if (response?.status == true && !(response!.data.isNull)) {
      PreferenceManager.setLogin();
      PreferenceManager.setMemberTypeId(
          response!.data!.memberTypeID.toString());
      PreferenceManager.setMsrNumber(response!.data!.msrNo!.toInt());
      PreferenceManager.setName(
          "${response?.data?.firstName} ${response?.data?.lastName}");
      PreferenceManager.setEmail(response!.data!.email.toString());
      PreferenceManager.setNumber(response!.data!.mobile.toString());
      Get.offNamed('/dashboard');
    } else {
      DialogHelper.showErrorDialog(description: response!.message.toString());
    }
  }
}

// 9175417786
// Salman@2512
// 322201