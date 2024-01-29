import 'package:flutter/material.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../../../AppManager/ThemeColor.dart';

class SelectSheet extends StatefulWidget {
  const SelectSheet({Key? key}) : super(key: key);

  @override
  State<SelectSheet> createState() => _SelectSheet();
}

class _SelectSheet extends State<SelectSheet> {
  int selected = 0;

  Widget optionType(String name, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        margin: getMargin(left: 15, right: 15),
        padding: getPadding(left: 15, right: 15, top: 7, bottom: 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color:
                (selected == index) ? AppColor.whiteA700 : Colors.transparent),
        child: Text(name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.lightBlue800,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: getPadding(all: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                    )),
                Container(
                    padding: getPadding(left: 10, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(color: AppColor.cardBackground),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        optionType("Seat", 0),
                        optionType("Meal", 1),
                        optionType("Add ons", 2)
                      ],
                    )),
                Text("Skip")
              ],
            ),
            Positioned(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      color: AppColor.black900,
                    ),
                    Container(
                      margin: getMargin(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                decoration:
                                    BoxDecoration(color: AppColor.lightBlue800),
                                child: Text("XL"),
                              ),
                              Container(
                                  margin: getMargin(left: 5),
                                  child: Text("Extra Legroom"))
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(ImageConstant.nonRecliningIcon),
                              Container(
                                  margin: getMargin(left: 5),
                                  child: Text("Non-Reclining"))
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(ImageConstant.emergancyexitIcon),
                              Container(
                                  margin: getMargin(left: 5),
                                  child: Text("Emergency Exit"))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColor.black900,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fare",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: AppColor.gray600),
                            ),
                            Text(
                              "Rs 4,435",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  color: AppColor.black901),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: getPadding(
                                left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.lightBlue801,
                            ),
                            child: Text(
                              "Proceed",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  color: AppColor.whiteA700),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
