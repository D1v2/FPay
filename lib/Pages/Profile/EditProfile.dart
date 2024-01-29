import 'package:flutter/material.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColor.lightBlue800,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Align(
            child: InkWell(
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text("Edit Profile",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 220,
                  width: 220,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                              color: Colors.grey.withOpacity(0.2),
                              border:
                                  Border.all(color: Colors.grey, width: 0.7)),
                          child: Center(
                            child: Container(
                                margin: const EdgeInsets.all(40),
                                child: Image.asset(
                                  ImageConstant.userIcon,
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15, right: 15),
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white),
                          child: Container(
                            height: 55,
                            width: 55,
                            margin: const EdgeInsets.only(bottom: 5, right: 5),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                color: Colors.grey.withOpacity(0.2),
                                border:
                                    Border.all(color: Colors.grey, width: 0.7)),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Name",
                    contentPadding: EdgeInsets.only(
                        left: 30, top: 20, bottom: 20, right: 30)),
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "Email",
                      contentPadding: const EdgeInsets.only(
                          left: 30, top: 20, bottom: 20, right: 30)),
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "Phone Number",
                      contentPadding: const EdgeInsets.only(
                          left: 30, top: 20, bottom: 20, right: 30)),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  maxLength: 10,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width / 2.3,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            hintText: "DOB",
                            suffixIcon: const Icon(Icons.date_range),
                            contentPadding: const EdgeInsets.only(
                                left: 30, top: 20, bottom: 20, right: 30)),
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.3,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            hintText: "City",
                            contentPadding: const EdgeInsets.only(
                                left: 30, top: 20, bottom: 20, right: 30)),
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "State",
                      contentPadding: const EdgeInsets.only(
                          left: 30, top: 20, bottom: 20, right: 30)),
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 150,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "Address",
                      contentPadding: const EdgeInsets.only(
                          left: 30, top: 20, bottom: 20, right: 30)),
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    //selectPlan();
                  },
                  child: Container(
                      height: 60,
                      width: size.width,
                      margin: const EdgeInsets.only(
                          top: 30, bottom: 20, left: 10, right: 10),
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
                                          margin: const EdgeInsets.only(
                                              right: 10, top: 12, bottom: 12),
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
}
