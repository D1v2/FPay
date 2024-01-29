import 'package:flutter/material.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Pages/services/travels/flight/AddPassenger.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/math_utils.dart';

enum CancelProtection { YES, NO }

enum Coupons { BESTDEAL, FLYWFPAY }

class FlightDetail extends StatefulWidget {
  const FlightDetail({Key? key}) : super(key: key);

  @override
  State<FlightDetail> createState() => _FlightDetailState();
}

class _FlightDetailState extends State<FlightDetail> {
  CancelProtection cancelProtection = CancelProtection.YES;
  Coupons coupons = Coupons.BESTDEAL;
  final importantPoints = [
    "   Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
    "   Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
    "   Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
    "   Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Baggage Policy",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: AppColor.black901),
              ),
              Container(
                margin: getMargin(top: 10, bottom: 15),
                child: Card(
                  color: AppColor.cardBackground,
                  child: Container(
                    padding: getPadding(all: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  ImageConstant.bagIcon,
                                  height: 30,
                                  width: 30,
                                ),
                                Container(
                                  margin: getMargin(left: 10),
                                  child: Text(
                                    "Cabin Bag",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        color: AppColor.black901),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "7 Kgs(1 piece only)",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  color: AppColor.gray500),
                            )
                          ],
                        ),
                        Container(
                          margin: getMargin(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    ImageConstant.baggageIcon,
                                    height: 30,
                                    width: 30,
                                  ),
                                  Container(
                                    margin: getMargin(left: 10),
                                    child: Text(
                                      "Check-in Bag",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          color: AppColor.black901),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "15 Kgs(1 piece only)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    color: AppColor.gray500),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Image.asset(ImageConstant.securityIcon),
                  Container(
                    margin: getMargin(left: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cancellation Refund Policy",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              color: AppColor.black901),
                        ),
                        Container(
                            margin: getMargin(top: 4),
                            alignment: Alignment.center,
                            padding: getPadding(
                                top: 4, bottom: 4, left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              "No Questions Asked",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: AppColor.black901),
                            )),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: getPadding(all: 10),
                margin: getMargin(top: 20, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.cardBackground,
                    border: Border.all(color: AppColor.black901, width: 0.4)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Pay  just  ₹449 per passenger',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: AppColor.black901),
                      ),
                      subtitle: Text(
                        "Approx. Refund:  ₹4,199",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: AppColor.greenA700),
                      ),
                      leading: Radio(
                        value: CancelProtection.YES,
                        groupValue: cancelProtection,
                        onChanged: (CancelProtection? value) {
                          setState(() {
                            cancelProtection = value!;
                          });
                        },
                      ),
                    ),
                    Divider(
                      color: AppColor.black901,
                    ),
                    ListTile(
                      title: Text(
                        'No, I don’t want Cancel Protect',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: AppColor.black901),
                      ),
                      subtitle: Text(
                        "Approx. Refund:  ₹699",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: AppColor.red700),
                      ),
                      leading: Radio(
                        value: CancelProtection.NO,
                        groupValue: cancelProtection,
                        onChanged: (CancelProtection? value) {
                          setState(() {
                            cancelProtection = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Offers",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: AppColor.black901),
              ),
              Container(
                padding: getPadding(all: 10),
                margin: getMargin(top: 20, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.cardBackground,
                    border: Border.all(color: AppColor.black901, width: 0.4)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Container(
                            margin: getMargin(right: 8),
                            child: Text(
                              "BESTDEAL",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  color: AppColor.black901),
                            ),
                          ),
                          Text(
                            "Save ₹267",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                color: AppColor.greenA700),
                          )
                        ],
                      ),
                      subtitle: Text(
                        "Avail up to Rs. 3000 instant discount on all domestic flights. T&C",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: AppColor.black901),
                      ),
                      leading: Radio(
                        value: CancelProtection.YES,
                        groupValue: cancelProtection,
                        onChanged: (CancelProtection? value) {
                          setState(() {
                            cancelProtection = value!;
                          });
                        },
                      ),
                    ),
                    Divider(
                      color: AppColor.black901,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Container(
                            margin: getMargin(right: 8),
                            child: Text(
                              "FLYWFPAY",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  color: AppColor.black901),
                            ),
                          ),
                          Text(
                            "Save ₹999",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                color: AppColor.greenA700),
                          )
                        ],
                      ),
                      subtitle: Text(
                        "Flat 15% instant discount up to Rs. 1500 with AU Bank Credit Card transactions. T&C",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: AppColor.black901),
                      ),
                      leading: Radio(
                        value: CancelProtection.NO,
                        groupValue: cancelProtection,
                        onChanged: (CancelProtection? value) {
                          setState(() {
                            cancelProtection = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Contact Information",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: AppColor.black901),
              ),
              Container(
                padding: getPadding(all: 10),
                margin: getMargin(top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.cardBackground,
                    border: Border.all(color: AppColor.black901, width: 0.4)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        "Primary Contact Details",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            color: AppColor.black901),
                      ),
                      subtitle: Text(
                        "Your ticket SMS and Email will be sent here",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: AppColor.gray600),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(hintText: "Mobile Number"),
                    ),
                    Container(
                      margin: getMargin(top: 15),
                      child: const TextField(
                        decoration: InputDecoration(hintText: "Email Id"),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                title: Text("Important",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        color: AppColor.black901)),
                subtitle: Text("Mandatory Checklist for travellers",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: AppColor.gray600)),
              ),
              SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: importantPoints.length,
                    itemBuilder: (context, index) {
                      return Flexible(
                          child: Text("\u2022 ${importantPoints[index]}",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: AppColor.black901)));
                    }),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    color: AppColor.black901,
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddPassenger()),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
