import 'package:flutter/material.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/common_image_view.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';

class RechargeSuccess extends StatefulWidget {
  const RechargeSuccess({Key? key}) : super(key: key);

  @override
  State<RechargeSuccess> createState() => _RechargeSuccessState();
}

class _RechargeSuccessState extends State<RechargeSuccess> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.only(top: 30),
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColor.lightBlue800,
                ),
                child: const Text(
                  "Top Up Success",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              height: size.height / 2.4,
              decoration: BoxDecoration(
                  color: AppColor.lightBlue800,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Center(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 240,
                        width: 240,
                        padding: const EdgeInsets.all(100),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(150))),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 170,
                        width: 170,
                        padding: const EdgeInsets.all(100),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.all(100),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CommonImageView(
                        imagePath: ImageConstant.rightIcon,
                        height: 30,
                        width: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: AppColor.lightBlue800,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: const Text(
                          "Add Total Amount",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "₹ ",
                            style: TextStyle(
                                color: AppColor.black900,
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                          Text("100.50",
                              style: TextStyle(
                                  color: AppColor.black900,
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800))
                        ],
                      ))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: AppColor.lightBlue800,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: const Text(
                          "Your balance",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "₹ ",
                            style: TextStyle(
                                color: AppColor.black900,
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                          Text("1000",
                              style: TextStyle(
                                  color: AppColor.black900,
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800))
                        ],
                      ))
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  //successRecharge();
                },
                child: Container(
                    height: (55.00),
                    margin: const EdgeInsets.only(left: 20, top: 40, right: 20),
                    decoration: AppDecoration.gradientLightblue800Blue500
                        .copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder15),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Done",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsSemiBold16
                              .copyWith(letterSpacing: 1.00)),
                    ))),
          ],
        ),
      ),
    );
  }
}
