import 'package:flutter/material.dart';
import 'package:fpay/Utils/FunctionUtils.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';

class SelectSeat extends StatefulWidget {
  const SelectSeat({super.key});

  @override
  State<SelectSeat> createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 160,
        flexibleSpace: Container(
          decoration: AppDecoration.mainGradient.copyWith(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        title: Container(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text("Select Seat",
                      style: AppStyle.txtPoppinsBold18.copyWith()),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 5, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColor.whiteA700.withOpacity(0.1)),
                    child: InkWell(
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                        child: CommonImageView(
                          svgPath: ImageConstant.moreIcon,
                          height: 12.00,
                          width: 15.00,
                        ),
                      ),
                      //onTap: () => filter(),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Mathura",
                        style: AppStyle.txtPoppinsBold18.copyWith()),
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset(ImageConstant.directionIcon),
                    ),
                    Text("Jaipur", style: AppStyle.txtPoppinsBold18.copyWith()),
                  ],
                ),
              ),
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        color: AppColor.whiteA700,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ena Paribahon",
                          style: AppStyle.normalLabelHeading.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "7.30 PM",
                          style: AppStyle.normalLabelHeading.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Type: ",
                                style: AppStyle.normalLabelHeading
                                    .copyWith(color: AppColor.gray400),
                              ),
                              Text(
                                "AC(2)",
                                style: AppStyle.normalLabelHeading.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.lightBlue800),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Price ",
                                style: AppStyle.normalLabelHeading
                                    .copyWith(color: AppColor.gray400),
                              ),
                              Text(
                                "₹130",
                                style: AppStyle.normalLabelHeading.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: AppColor.blue800, width: 1)),
                      ),
                      Text(
                        "Available",
                        style:
                            AppStyle.normalLabelHeading.copyWith(fontSize: 14),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: AppColor.black900B2,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1)),
                      ),
                      Text(
                        "Selected",
                        style:
                            AppStyle.normalLabelHeading.copyWith(fontSize: 14),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: AppColor.blue800,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: AppColor.blue800,
                            )),
                      ),
                      Text(
                        "Booked",
                        style:
                            AppStyle.normalLabelHeading.copyWith(fontSize: 14),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.formBackGround,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(150),
                              topRight: Radius.circular(150))),
                      child: Container(
                        margin: const EdgeInsets.only(top: 60),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.all(40),
                                  decoration: BoxDecoration(
                                      color: AppColor.whiteA700,
                                      borderRadius: BorderRadius.circular(0)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 20, bottom: 10),
                                  child: CommonImageView(
                                    imagePath: ImageConstant.staringIcon,
                                    height: 25.00,
                                    width: 25.00,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.rotate(
                              angle: 50,
                              child: Container(
                                margin: const EdgeInsets.only(left: 50),
                                width: 20,
                                height: 30,
                                padding: const EdgeInsets.all(40),
                                decoration: BoxDecoration(
                                    color: AppColor.formBackGround,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                            Transform.rotate(
                              angle: 169.93,
                              child: Container(
                                margin: const EdgeInsets.only(right: 50),
                                width: 20,
                                height: 30,
                                padding: const EdgeInsets.all(40),
                                decoration: BoxDecoration(
                                    color: AppColor.formBackGround,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColor.formBackGround,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: AppColor.blue800,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColor.blue800,
                                    )),
                              ),
                              Text(
                                "Booked",
                                style: AppStyle.normalLabelHeading
                                    .copyWith(fontSize: 14),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: AppColor.blue800,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColor.blue800,
                                    )),
                              ),
                              Text(
                                "Booked",
                                style: AppStyle.normalLabelHeading
                                    .copyWith(fontSize: 14),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: AppColor.blue800,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColor.blue800,
                                    )),
                              ),
                              Text(
                                "Booked",
                                style: AppStyle.normalLabelHeading
                                    .copyWith(fontSize: 14),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: AppColor.blue800,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColor.blue800,
                                    )),
                              ),
                              Text(
                                "Booked",
                                style: AppStyle.normalLabelHeading
                                    .copyWith(fontSize: 14),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: AppColor.blue800,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColor.blue800,
                                    )),
                              ),
                              Text(
                                "Booked",
                                style: AppStyle.normalLabelHeading
                                    .copyWith(fontSize: 14),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: AppColor.blue800,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColor.blue800,
                                    )),
                              ),
                              Text(
                                "Booked",
                                style: AppStyle.normalLabelHeading
                                    .copyWith(fontSize: 14),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: AppColor.blue800,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColor.blue800,
                                    )),
                              ),
                              Text(
                                "Booked",
                                style: AppStyle.normalLabelHeading
                                    .copyWith(fontSize: 14),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: AppColor.blue800,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColor.blue800,
                                    )),
                              ),
                              Text(
                                "Booked",
                                style: AppStyle.normalLabelHeading
                                    .copyWith(fontSize: 14),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            GestureDetector(
                onTap: () => goWithTo('/busTravellerInformation'),
                child: Container(
                    height: (60.00),
                    margin: const EdgeInsets.only(top: 30),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomIconButton(
                                        height: 25,
                                        width: 25,
                                        margin: const EdgeInsets.all(10),
                                        variant:
                                            IconButtonVariant.OutlineWhiteA701,
                                        shape: IconButtonShape.CircleBorder15,
                                        padding: IconButtonPadding.PaddingAll8,
                                        alignment: Alignment.centerRight,
                                        child: CommonImageView(
                                            svgPath: ImageConstant.moveIcon))
                                  ]))),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 40, top: 21, right: 40, bottom: 20),
                            child: Text("(2) Buy Now",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsSemiBold16
                                    .copyWith(letterSpacing: 1.00))),
                      )
                    ]))),
          ],
        ),
      ),
    ));
  }
}
