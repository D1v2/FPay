import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fpay/Pages/Authenication/MobileVerification.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';
import '../../Utils/custom_text_form_field.dart';
import '../../Utils/math_utils.dart';

class MobileSignup extends StatefulWidget {
  const MobileSignup({Key? key}) : super(key: key);

  @override
  State<MobileSignup> createState() => _MobileSignupState();
}

class _MobileSignupState extends State<MobileSignup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.whiteA700,
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      width: double.infinity,
                                      decoration: AppDecoration.fillWhiteA700,
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: size.width,
                                                alignment: Alignment.topLeft,
                                                margin: const EdgeInsets.only(
                                                    left: 10, top: 20),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.arrow_back,
                                                    color: AppColor.black900,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                )),
                                            Container(
                                                width: size.width,
                                                margin: const EdgeInsets.only(
                                                    left: 29,
                                                    top: 26.58,
                                                    right: 29),
                                                child: Stack(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 3,
                                                                      top: 66,
                                                                      right: 10,
                                                                      bottom:
                                                                          66),
                                                              child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    CommonImageView(
                                                                        svgPath:
                                                                            ImageConstant
                                                                                .imgPath432,
                                                                        height:
                                                                            (1.00),
                                                                        width:
                                                                            (1.00)),
                                                                    CommonImageView(
                                                                        svgPath:
                                                                            ImageConstant
                                                                                .imgPath534,
                                                                        height:
                                                                            (1.00),
                                                                        width:
                                                                            (1.00))
                                                                  ]))),
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "Enter Mobile Number",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsSemiBold24
                                                                        .copyWith()),
                                                                Container(
                                                                    margin: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            18),
                                                                    child: Text(
                                                                        "Create your account and manage your finances with ease",
                                                                        maxLines:
                                                                            null,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtPoppinsRegular15
                                                                            .copyWith(height: 1.67))),
                                                                CustomTextFormField(
                                                                  variant:
                                                                      TextFormFieldVariant
                                                                          .Outline,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  width: size
                                                                      .width,
                                                                  focusNode:
                                                                      FocusNode(),
                                                                  controller:
                                                                      mobileController,
                                                                  maxLength: 10,
                                                                  hintText:
                                                                      "Mobile Number",
                                                                  margin: const EdgeInsets
                                                                          .only(
                                                                      top: 23),
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .done,
                                                                  prefix: Container(
                                                                      margin: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              15,
                                                                          top:
                                                                              18,
                                                                          right:
                                                                              12,
                                                                          bottom:
                                                                              19),
                                                                      child: CommonImageView(
                                                                          svgPath:
                                                                              ImageConstant.callIcon)),
                                                                  prefixConstraints: const BoxConstraints(
                                                                      minWidth:
                                                                          (18.00),
                                                                      minHeight:
                                                                          (18.00)),
                                                                )
                                                              ]))
                                                    ])),
                                            GestureDetector(
                                              onTap: () {
                                                onTapSignup();
                                              },
                                              child: Container(
                                                  height: (58.00),
                                                  width: size.width,
                                                  margin: const EdgeInsets.only(
                                                      left: 52,
                                                      top: 30,
                                                      right: 52),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Container(
                                                                decoration: AppDecoration
                                                                    .gradientLightblue800Blue500
                                                                    .copyWith(
                                                                        borderRadius:
                                                                            BorderRadiusStyle
                                                                                .roundedBorder15),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomIconButton(
                                                                          height:
                                                                              30,
                                                                          width:
                                                                              30,
                                                                          margin: const EdgeInsets.all(
                                                                              14),
                                                                          variant: IconButtonVariant
                                                                              .OutlineWhiteA701,
                                                                          shape: IconButtonShape
                                                                              .CircleBorder15,
                                                                          padding: IconButtonPadding
                                                                              .PaddingAll8,
                                                                          alignment: Alignment
                                                                              .centerRight,
                                                                          child:
                                                                              CommonImageView(svgPath: ImageConstant.moveIcon))
                                                                    ]))),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 40,
                                                                      top: 21,
                                                                      right: 40,
                                                                      bottom:
                                                                          20),
                                                              child: Text(
                                                                  "Next"
                                                                      .toUpperCase(),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtPoppinsSemiBold16
                                                                      .copyWith(
                                                                          letterSpacing:
                                                                              1.00))),
                                                        )
                                                      ])),
                                            ),
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    left: 66,
                                                    top: 50,
                                                    right: 66),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "Already have an account? ",
                                                          style: TextStyle(
                                                              color: AppColor
                                                                  .gray800,
                                                              fontSize: (15),
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1.00)),
                                                      TextSpan(
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap = () {
                                                                  onTapLogin();
                                                                },
                                                          text: "Login",
                                                          style: TextStyle(
                                                              color: AppColor
                                                                  .lightBlue800,
                                                              fontSize: (15),
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 1.00))
                                                    ]),
                                                    textAlign: TextAlign.left))
                                          ])))
                            ]))))));
  }

  void onTapSignup() {
    if (mobileController.text.length != 10) {
      Fluttertoast.showToast(
          msg: "Please enter valid mobile number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MobileVerification()),
      );
    }
  }

  onTapLogin() {
    Navigator.pop(context);
  }
}
