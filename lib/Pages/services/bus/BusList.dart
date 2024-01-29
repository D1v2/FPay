import 'package:flutter/material.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Utils/DashLinePainter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/math_utils.dart';

class BusList extends StatefulWidget {
  const BusList({super.key});

  @override
  State<BusList> createState() => _BusListState();
}

class _BusListState extends State<BusList> {
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
                  Text("All Buses",
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
                      onTap: () => filter(),
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
        color: AppColor.gray200.withOpacity(0.5),
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    selectSeat();
                  },
                  child: busItem());
            }),
      ),
    ));
  }

  Widget busItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.whiteA700,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Ena Paribahon",
                        style: AppStyle.normalLabelHeading.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.gray300),
                          child: const Icon(Icons.navigation_outlined),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mathura",
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: AppStyle.normalLabelHeading.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            Text("24 Sunday 1990",
                                style: AppStyle.normalLabelHeading.copyWith(
                                    color: AppColor.gray400,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17))
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 17),
                      child: CustomPaint(
                        size: const Size(1, 50),
                        painter: DashLinePainter(AppColor.gray400),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.lightBlue800.withOpacity(0.1)),
                          child: Icon(
                            Icons.location_pin,
                            color: AppColor.lightBlue801,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mathura",
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: AppStyle.normalLabelHeading.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            Text("24 Sunday 1990",
                                style: AppStyle.normalLabelHeading.copyWith(
                                    color: AppColor.gray400,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColor.gray200.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                      )),
                ),
                CustomPaint(
                  size: const Size(1, 160),
                  painter: DashLinePainter(AppColor.gray400),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColor.gray200.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: AppDecoration.mainGradient.copyWith(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: Text(
                        "AC",
                        style: AppStyle.normalLabelHeading.copyWith(
                            color: AppColor.whiteA700,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "7.30 PM",
                          style: AppStyle.normalLabelHeading.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 30),
                          decoration: AppDecoration.mainGradient.copyWith(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 8, bottom: 8),
                          child: Text(
                            "Buy Ticket",
                            textAlign: TextAlign.center,
                            style: AppStyle.normalLabelHeading.copyWith(
                                color: AppColor.whiteA700,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Price",
                              style: AppStyle.normalLabelHeading
                                  .copyWith(color: AppColor.gray400),
                            ),
                            Text(
                              " ₹ 130",
                              style: AppStyle.normalLabelHeading.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  filter() {
    Get.toNamed('/busFilter');
  }

  selectSeat() {
    Get.toNamed('/busSelectSeat');
  }
}
