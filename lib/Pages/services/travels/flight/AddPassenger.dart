import 'package:flutter/material.dart';
import 'package:fpay/Pages/services/travels/flight/SelectSheat.dart';

import '../../../../AppManager/ThemeColor.dart';
import '../../../../Utils/ImageConstant.dart';
import '../../../../Utils/math_utils.dart';

class AddPassenger extends StatefulWidget {
  const AddPassenger({Key? key}) : super(key: key);

  @override
  State<AddPassenger> createState() => _AddPassenger();
}

class _AddPassenger extends State<AddPassenger> {
  String? title;
  bool frequentFlayNumber = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lightBlue800,
        toolbarHeight: 280,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Text("Trip To",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: AppColor.whiteA700)),
            Container(
                margin: getMargin(top: 5),
                child: Text(
                  "Mumbai",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColor.whiteA700),
                )),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: AppColor.whiteA700,
                ),
              ),
            ),
            Container(
              margin: getMargin(top: 10, left: 10, right: 10, bottom: 10),
              child: Row(
                children: [
                  Image.asset(ImageConstant.tataNueIcon),
                  Container(
                    margin: getMargin(left: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DEL - BOM",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.whiteA700),
                        ),
                        Flexible(
                            child: Text(
                          "Tue, 7 Mar | 02:00 - 04:15 | 2h 15m | Non Stop",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.whiteA700),
                        )),
                        Text(
                          "Economy - SAVER",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.whiteA700),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: getMargin(left: 20, right: 20, top: 20, bottom: 20),
              padding: getPadding(
                top: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColor.whiteA700, width: 0.3),
              ),
              child: Text(
                "VIEW FLIGHT & FARE DETAILS",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: AppColor.whiteA700),
              ),
            )
          ],
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: getPadding(all: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Enter Passenger Details"),
                subtitle: Text("Name should be same as in Government ID Proof"),
              ),
              Container(
                margin: getMargin(top: 20),
                padding: getPadding(all: 10),
                decoration: BoxDecoration(
                    color: AppColor.cardBackground,
                    border: Border.all(color: AppColor.gray600, width: 0.3),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Adult 1"),
                    Container(
                      margin: getMargin(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 'Mr.',
                                  groupValue: title,
                                  onChanged: (value) {
                                    setState(() {
                                      title = value;
                                    });
                                  }),
                              Text("Mr.")
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'Ms.',
                                  groupValue: title,
                                  onChanged: (value) {
                                    setState(() {
                                      title = value;
                                    });
                                  }),
                              Text("Ms.")
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'Mrs.',
                                  groupValue: title,
                                  onChanged: (value) {
                                    setState(() {
                                      title = value;
                                    });
                                  }),
                              Text("Mrs.")
                            ],
                          ),
                        ],
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(hintText: "First Name"),
                    ),
                    Container(
                      margin: getMargin(top: 15),
                      child: const TextField(
                        decoration: InputDecoration(hintText: "Last Name"),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: frequentFlayNumber, onChanged: (value) {}),
                        Text(
                          "Frequent Flyer Number",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: AppColor.gray800),
                        )
                      ],
                    ),
                    const TextField(
                      decoration: InputDecoration(hintText: "Flight Operator"),
                    ),
                    Container(
                      margin: getMargin(top: 15),
                      child: const TextField(
                        decoration:
                            InputDecoration(hintText: "Frequent Flyer Number"),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: getMargin(top: 20),
                      padding: getPadding(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppColor.lightBlue801, width: 0.3)),
                      child: Text("SAVE"),
                    ),
                  ],
                ),
              ),
              Container(
                margin: getMargin(top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SelectSheet()),
                            );
                          },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
