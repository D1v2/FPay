import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fpay/Pages/Authenication/KycVerification.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';
import '../../Utils/custom_text_form_field.dart';
import '../../Utils/math_utils.dart';

class KYCAadhaar extends StatefulWidget {
  const KYCAadhaar({Key? key}) : super(key: key);

  @override
  State<KYCAadhaar> createState() => _KYCAadhaarState();
}

class _KYCAadhaarState extends State<KYCAadhaar> {
  File? imageFile;

  TextEditingController emailController = TextEditingController();
  TextEditingController aadhaarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: size.width,
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: AppColor.black900,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Complete Your KYC",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: AppStyle.txtPoppinsSemiBold24.copyWith(),
                          ),
                        )
                      ],
                    )),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      openCamera();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 40.0),
                      width: 220.0,
                      height: 220.0,
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(48),
                            child: imageFile != null
                                ? Image.file(
                                    imageFile!,
                                    fit: BoxFit.fill,
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Image.asset(ImageConstant.userIcon,
                                        fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: const Text("Upload Your Image",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            wordSpacing: 1,
                            fontStyle: FontStyle.normal)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 23),
                  child: CustomTextFormField(
                      variant: TextFormFieldVariant.Outline,
                      keyboardType: TextInputType.emailAddress,
                      width: size.width,
                      focusNode: FocusNode(),
                      controller: emailController,
                      hintText: "Email Id",
                      margin: const EdgeInsets.only(top: 20),
                      textInputAction: TextInputAction.done,
                      prefix: Container(
                          margin: const EdgeInsets.only(
                              left: 18, top: 19, right: 12, bottom: 19),
                          child: const Icon(Icons.email)),
                      prefixConstraints: const BoxConstraints(
                          minWidth: (16.00), minHeight: (16.00)),
                      isObscureText: false),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomTextFormField(
                      variant: TextFormFieldVariant.Outline,
                      keyboardType: TextInputType.number,
                      maxLength: 12,
                      width: size.width,
                      focusNode: FocusNode(),
                      controller: aadhaarController,
                      hintText: "Aadhaar Card Number",
                      margin: const EdgeInsets.only(top: 20),
                      textInputAction: TextInputAction.done,
                      prefix: Container(
                          margin: const EdgeInsets.only(
                              left: 18, top: 19, right: 12, bottom: 19),
                          child: const Icon(Icons.verified_user)),
                      prefixConstraints: const BoxConstraints(
                          minWidth: (16.00), minHeight: (16.00)),
                      isObscureText: false),
                ),
                GestureDetector(
                    onTap: () {
                      onTapLogin(context);
                    },
                    child: Container(
                        height: (65.00),
                        width: size.width,
                        margin:
                            const EdgeInsets.only(left: 12, top: 36, right: 12),
                        child: Stack(alignment: Alignment.center, children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  decoration: AppDecoration
                                      .gradientLightblue800Blue500
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder15),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomIconButton(
                                            height: 30,
                                            width: 30,
                                            margin: const EdgeInsets.all(14),
                                            variant: IconButtonVariant
                                                .OutlineWhiteA701,
                                            shape:
                                                IconButtonShape.CircleBorder15,
                                            padding:
                                                IconButtonPadding.PaddingAll8,
                                            alignment: Alignment.centerRight,
                                            child: CommonImageView(
                                                svgPath:
                                                    ImageConstant.moveIcon))
                                      ]))),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 40, top: 21, right: 40, bottom: 20),
                                child: Text("Submit".toUpperCase(),
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

  void onTapLogin(BuildContext context) {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter email id",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white);
    } else if (!emailController.text.isEmail) {
      Fluttertoast.showToast(
          msg: "Please enter valid email id",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white);
    } else if (aadhaarController.text.isEmpty ||
        aadhaarController.text.length != 12) {
      Fluttertoast.showToast(
          msg: "Please enter valid aadhaar card number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white);
    } else if (imageFile.isNull) {
      Fluttertoast.showToast(
          msg: "Please upload your image",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const KycVerification()),
      );
    }
  }

  void openCamera() async {
    XFile? pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxHeight: 400, maxWidth: 400);
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }
}
