import 'package:flutter/material.dart';
import 'package:fpay/Pages/services/travels/flight/FlightList.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../../../AppManager/ThemeColor.dart';
import '../../../../Utils/app_decoration.dart';
import '../../../../Utils/app_style.dart';
import '../../../../Utils/common_image_view.dart';
import '../../../../Utils/custom_icon_button.dart';

class SelectRoute extends StatefulWidget {
  const SelectRoute({Key? key}) : super(key: key);

  @override
  State<SelectRoute> createState() => _SelectRouteState();
}

class _SelectRouteState extends State<SelectRoute> {
  int selected = 0;
  bool nonStop = false;

  Widget customRadioButton(String txt, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width / 2.7,
        padding: getPadding(left: 10, top: 5, bottom: 5, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: (selected == index) ? AppColor.whiteA701 : Colors.transparent,
        ),
        child: Text(
          txt,
          style: TextStyle(
              color: (selected == index) ? Colors.black : AppColor.whiteA701,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 17),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColor.lightBlue800,
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
        title: Text("Select Your Route",
            style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              margin: getMargin(all: 15),
              padding: getPadding(all: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColor.gray800, width: 0.5)),
              child: Column(
                children: [
                  Container(
                    padding: getPadding(all: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.lightBlue801),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customRadioButton("One Way", 0),
                        customRadioButton("Round Trip", 1),
                      ],
                    ),
                  ),
                  Container(
                    margin: getMargin(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "From",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: AppColor.gray600),
                        ),
                        Text("To",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: AppColor.gray600)),
                      ],
                    ),
                  ),
                  Container(
                    margin: getMargin(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "DEL",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: AppColor.black901),
                            ),
                            Text("Delhi",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: AppColor.black901)),
                          ],
                        ),
                        Image.asset(ImageConstant.directionIcon),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "BOM",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: AppColor.black901),
                            ),
                            Text("Mumbai",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: AppColor.black901)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: getMargin(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray600, width: 0.3)),
                  ),
                  Container(
                    margin: getMargin(top: 15),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Departure Date",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: AppColor.gray600),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: getMargin(top: 5),
                    child: Text("Fri, 10 Mar 2023",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: AppColor.black901)),
                  ),
                  Container(
                    margin: getMargin(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray600, width: 0.3)),
                  ),
                  Container(
                    margin: getMargin(top: 15),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Travellers & Cabin Class",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: AppColor.gray600),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: getMargin(top: 5),
                    child: Row(
                      children: [
                        Text("1 Adult",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: AppColor.black901)),
                        Container(
                          height: 8,
                          width: 8,
                          margin: getMargin(left: 10, right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColor.gray600),
                        ),
                        Text("Economy",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: AppColor.black901)),
                      ],
                    ),
                  ),
                  Container(
                    margin: getMargin(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray600, width: 0.3)),
                  ),
                  Row(
                    children: [
                      Checkbox(value: nonStop, onChanged: (value) {}),
                      Text(
                        "Show Non-stop flights only",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: AppColor.gray800),
                      )
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FlightList()),
                        );
                      },
                      child: Container(
                          height: (60.00),
                          margin: getMargin(top: 15),
                          child: Stack(alignment: Alignment.center, children: [
                            Container(
                                alignment: Alignment.centerLeft,
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
                                    ])),
                            Container(
                              alignment: Alignment.center,
                              child: Text("Search Flights".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold16
                                      .copyWith(letterSpacing: 1.00)),
                            )
                          ]))),
                ],
              ),
            ),
            CommonImageView(
              imagePath: ImageConstant.banner,
              height: getVerticalSize(
                120.00,
              ),
              width: getHorizontalSize(
                280.00,
              ),
            )
          ],
        ),
      ),
    );
  }
}
