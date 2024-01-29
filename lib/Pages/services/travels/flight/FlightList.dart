import 'package:flutter/material.dart';
import 'package:fpay/Pages/StatelessItems/Classes/FlightDetailModel.dart';
import 'package:fpay/Pages/StatelessItems/Classes/FlightModel.dart';
import 'package:fpay/Pages/StatelessItems/Views/FlightItem.dart';
import 'package:fpay/Pages/services/travels/flight/FlightDetail.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../../../AppManager/ThemeColor.dart';
import '../../../../Utils/ImageConstant.dart';
import '../../../../Utils/app_style.dart';

class FlightList extends StatefulWidget {
  const FlightList({Key? key}) : super(key: key);

  @override
  State<FlightList> createState() => _FlightListState();
}

class _FlightListState extends State<FlightList> {
  int selectedFareType = 0;
  int flightDetailSelected = 0;

  Widget fareType(String type, String amount, String time, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedFareType = index;
        });
      },
      child: Container(
        padding: getPadding(left: 15, top: 10, right: 15, bottom: 10),
        margin: getMargin(left: 5, right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColor.gray600, width: 0.4),
            color: (selectedFareType == index)
                ? AppColor.lightBlue801
                : AppColor.whiteA701),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                type,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: (selectedFareType == index)
                      ? AppColor.whiteA701
                      : AppColor.black901,
                ),
              ),
            ),
            Container(
              margin: getMargin(top: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      "₹ $amount",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: (selectedFareType == index)
                              ? AppColor.whiteA701
                              : AppColor.black901),
                    ),
                  ),
                  Container(
                    margin: getMargin(left: 4, right: 4),
                    height: 10,
                    width: 1,
                    decoration: BoxDecoration(
                        color: (selectedFareType == index)
                            ? AppColor.whiteA701
                            : AppColor.black901),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: (selectedFareType == index)
                            ? AppColor.whiteA701
                            : AppColor.black901),
                  ),
                ],
              ),
            )
          ],
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
        title: Text("Flights", style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: getMargin(all: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: getPadding(all: 15),
                decoration: BoxDecoration(
                    color: AppColor.lightBlue802.withOpacity(0.09),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Text(
                                "Delhi",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    color: AppColor.black901),
                              ),
                              Container(
                                  margin: getMargin(left: 10, right: 10),
                                  child: const Icon(Icons.arrow_forward_sharp)),
                              Text(
                                "Mumbai",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    color: AppColor.black901),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: getMargin(top: 5),
                          child: Row(
                            children: [
                              Text(
                                "10 Mar 23, ",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.gray600),
                              ),
                              Text(
                                "1 Adult, ",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.gray600),
                              ),
                              Text(
                                "Economy",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.gray600),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.edit,
                            color: AppColor.lightBlue801,
                          ),
                          Text(
                            "Edit",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.lightBlue801),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: getMargin(top: 15, bottom: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      fareType("Cheapest", "4012", "2h 10m", 0),
                      fareType("Non Stop First", "4012", "2h", 1),
                      fareType("You May Prefer", "4012", "2h", 2),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: FlightModel().itemList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              context: context,
                              builder: (BuildContext context) {
                                return flightInformation();
                              });
                        },
                        child: FlightItem(
                          data: FlightModel().itemList[index],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget flightInformation() {
    return Container(
      padding: getPadding(top: 5, right: 10, left: 10, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            width: 40,
            height: 2,
            decoration: BoxDecoration(
                color: AppColor.gray800,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            margin: getMargin(top: 10),
            padding: getPadding(all: 10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.gray600, width: 0.2),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(ImageConstant.tataNueIcon),
                        Text(
                          "IndiGo",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColor.gray700,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "6E-6841",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColor.gray700,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Container(
                      margin: getMargin(left: 8),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Delhi",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                color: AppColor.black901),
                          ),
                          Text(
                            "02:00",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                color: AppColor.black901),
                          ),
                          Text(
                            "Tue, 7 Mar",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: AppColor.black901),
                          ),
                          Flexible(
                              child: Container(
                            width: 100,
                            child: Text(
                              "(T 1) Indira Gandhi Airport",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: AppColor.black901),
                            ),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "2h 15m",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black901),
                    ),
                    Container(
                      width: 60,
                      height: 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.lightBlue801),
                    ),
                    Text(
                      "Non Stop",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.gray600),
                    ),
                  ],
                ),
                Container(
                  margin: getMargin(left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Mumbai",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: AppColor.black901),
                      ),
                      Text(
                        "04:15",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            color: AppColor.black901),
                      ),
                      Text(
                        "Tue, 7 Mar",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: AppColor.black901),
                      ),
                      Flexible(
                          child: SizedBox(
                        width: 100,
                        child: Text(
                          "(T 2) Chhatrapati Shivaji Maharaj Airport",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              color: AppColor.black901),
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: getMargin(top: 15, bottom: 10),
            child: Text(
              "Would you like to upgrade?",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  color: AppColor.black901),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: getMargin(bottom: 10),
            child: Text(
              "Fare for 1 Traveller",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  color: AppColor.gray600),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < FlightDetailModel().itemList.length; i++)
                  flightDetail(FlightDetailModel().itemList[i], i),
              ],
            ),
          ),
          Positioned(
              child: Column(
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
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FlightDetail()),
                      );
                    },
                    child: Container(
                      padding:
                          getPadding(left: 20, right: 20, top: 10, bottom: 10),
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
          ))
        ],
      ),
    );
  }

  Widget flightDetail(FlightDetailItemData data, int index) {

    return InkWell(
      onTap: () {
        setState(() {
          flightDetailSelected = index;
        });
      },
      child: Container(
        margin: getMargin(all: 5),
        child: Stack(
          children: [
            Container(
              margin: getMargin(top: 10),
              padding: getPadding(all: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.gray600,
                    width: 0.3,
                  ),
                  color: (flightDetailSelected == index)
                      ? AppColor.gray600.withOpacity(0.2)
                      : AppColor.whiteA700),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.plus,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor.black900),
                  ),
                  Container(
                    margin: getMargin(top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Container(
                          height: 14,
                          width: 14,
                          margin: getMargin(right: 5),
                          decoration: BoxDecoration(
                              color: (flightDetailSelected == index)
                                  ? AppColor.lightBlue801.withOpacity(0.2)
                                  : AppColor.whiteA700,
                              border: Border.all(
                                  color: AppColor.lightBlue801, width: 0.9),
                              shape: BoxShape.circle),
                        ),
                        Text(
                          data.amount,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.black900),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 100,
                    color: Colors.black,
                    margin: getMargin(top: 5, bottom: 5),
                  ),
                  Container(
                      margin: getMargin(top: 5, bottom: 4),
                      child: Text(
                        "Seat",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.gray600),
                      )),
                  Text(
                    data.seat,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColor.black901),
                  ),
                  Container(
                      margin: getMargin(top: 15, bottom: 4),
                      child: Text(
                        "Meal",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.gray600),
                      )),
                  Text(
                    data.meal,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColor.black901),
                  ),
                  Container(
                      margin: getMargin(top: 15, bottom: 4),
                      child: Text(
                        "Change Fee",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.gray600),
                      )),
                  Text(
                    data.changeFee,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColor.black901),
                  ),
                  Container(
                      margin: getMargin(top: 15, bottom: 4),
                      child: Text(
                        "Cancellation Fee",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.gray600),
                      )),
                  Text(
                    data.cancellationFee,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColor.black901),
                  ),
                  Container(
                      margin: getMargin(top: 15, bottom: 4),
                      child: Text(
                        "Check in beg",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.gray600),
                      )),
                  Text(
                    data.changeFee,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColor.black901),
                  ),
                  Container(
                      margin: getMargin(top: 15, bottom: 4),
                      child: Text(
                        "Hand Beg",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.gray600),
                      )),
                  Text(
                    data.changeFee,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColor.black901),
                  ),
                  Container(
                    height: 50,
                  )
                ],
              ),
            ),
            Container(
              margin: getMargin(left: 10),
              padding: getPadding(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.yellow),
              child: Text(
                data.valueType,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black901),
              ),
            )
          ],
        ),
      ),
    );
  }
}
