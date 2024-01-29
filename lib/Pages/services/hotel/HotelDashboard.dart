import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Pages/services/hotel/HotelCityList.dart';
import 'package:fpay/Pages/services/hotel/HotelList.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';

class HotelDashboard extends StatefulWidget {
  const HotelDashboard({super.key});

  @override
  State<HotelDashboard> createState() => _HotelDashboardState();
}

class _HotelDashboardState extends State<HotelDashboard> {
  int adults = 2;
  bool isChecked = false;
  int children = 0;
  int rooms = 1;
  List<int> ageArray = [];

  TextEditingController cityController = TextEditingController();

  void updateValues(int ad, int rm, int chld, List<int> array) {
    setState(() {
      adults = ad;
      rooms = rm;
      children = chld;
      ageArray = array;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: AppDecoration.mainGradient.copyWith(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
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
        title: Text("Find Hotel", style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Find Your Next Stay",
                    style: AppStyle.normalLabelHeading
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 10),
                    child: Text(
                      "Search low Prices on hotels, homes and much more",
                      style: AppStyle.formLabelHeading,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      cityList();
                    },
                    child: TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(
                        isDense: true,
                        enabled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: AppColor.gray50, width: 1),
                        ),
                        hintText: 'Around Current Location',
                        fillColor: AppColor.gray301,
                        prefixIconConstraints: const BoxConstraints(
                            minWidth: (16.00), minHeight: (16.00)),
                        counterText: '',
                        prefixIcon: Container(
                            margin: const EdgeInsets.only(
                              left: 18,
                              right: 14,
                            ),
                            child: Image.asset(ImageConstant.searchIcon)),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 25, bottom: 20),
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: AppColor.gray50.withOpacity(0.03),
                          border: Border.all(width: 0.3),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: AppColor.gray50, width: 1),
                              ),
                              hintText: 'Check In Date',
                              fillColor: AppColor.gray301,
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: (16.00), minHeight: (16.00)),
                              counterText: '',
                              suffixIcon: Container(
                                  margin: const EdgeInsets.only(
                                    left: 18,
                                    right: 14,
                                  ),
                                  child: Icon(
                                    Icons.date_range,
                                    color: AppColor.blue700,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: AppColor.gray50, width: 1),
                              ),
                              hintText: 'Check Out Date',
                              fillColor: AppColor.gray301,
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: (16.00), minHeight: (16.00)),
                              counterText: '',
                              suffixIcon: Container(
                                  margin: const EdgeInsets.only(
                                    left: 18,
                                    right: 14,
                                  ),
                                  child: Icon(
                                    Icons.date_range,
                                    color: AppColor.blue700,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => showBottomSheet(context),
                          child: Container(
                            margin: const EdgeInsets.only(left: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColor.gray700, width: 1)),
                            child: Column(
                              children: [
                                Text(
                                  "Adults",
                                  style: AppStyle.formLabelHeading,
                                ),
                                Text(
                                  adults.toString(),
                                  style: AppStyle.normalLabelHeading,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => showBottomSheet(context),
                          child: Container(
                            margin: const EdgeInsets.only(left: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColor.gray700, width: 1)),
                            child: Column(
                              children: [
                                Text(
                                  "Children",
                                  style: AppStyle.formLabelHeading,
                                ),
                                Text(
                                  children.toString(),
                                  style: AppStyle.normalLabelHeading,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => showBottomSheet(context),
                          child: Container(
                            margin: const EdgeInsets.only(left: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColor.gray700, width: 1)),
                            child: Column(
                              children: [
                                Text(
                                  "Rooms",
                                  style: AppStyle.formLabelHeading,
                                ),
                                Text(
                                  rooms.toString(),
                                  style: AppStyle.normalLabelHeading,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                      ),
                      Text(
                        "I'm Travelling for work",
                        style: AppStyle.normalLabelHeading.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        checkAllHotel();
                      },
                      child: Container(
                          height: (60.00),
                          margin: const EdgeInsets.only(
                              left: 23, top: 30, right: 23),
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
                                              height: 25,
                                              width: 25,
                                              margin: const EdgeInsets.all(10),
                                              variant: IconButtonVariant
                                                  .OutlineWhiteA701,
                                              shape: IconButtonShape
                                                  .CircleBorder15,
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
                                  child: Text("search".toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsSemiBold16
                                          .copyWith(letterSpacing: 1.00))),
                            )
                          ]))),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: double.infinity,
                    child: Image.asset(
                      ImageConstant.hotelBottomImage,
                      fit: BoxFit.cover,
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  checkAllHotel() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HotelList()),
    );
  }

  showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return bottomSheet(
              updateValue: updateValues,
              adults: adults,
              rooms: rooms,
              children: children,
              ageArray: ageArray);
        });
  }

  Future cityList() async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HotelCityList()),
    );
    if (results.containsKey("hotel") && results.isNotEmpty) {
      setState(() {
        // hitApi(results["pin"]);
      });
    }
  }
}

class bottomSheet extends StatefulWidget {
  Function(int, int, int, List<int>) updateValue;
  int adults;
  int rooms;
  int children;
  List<int> ageArray;

  bottomSheet(
      {super.key,
      required this.updateValue,
      required this.adults,
      required this.rooms,
      required this.children,
      required this.ageArray});

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Adults",
                style: AppStyle.formLabelHeading
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      widget.adults =
                          widget.adults <= 1 ? 1 : widget.adults - 1;
                      widget.updateValue(widget.adults, widget.rooms,
                          widget.children, widget.ageArray);
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: AppColor.gray700, width: 0.5)),
                      child: const Icon(
                        Icons.exposure_minus_1,
                        size: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      widget.adults.toString(),
                      style: AppStyle.formLabelHeading
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      widget.adults =
                          widget.adults >= 30 ? 30 : widget.adults + 1;
                      widget.updateValue(widget.adults, widget.rooms,
                          widget.children, widget.ageArray);
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: AppColor.gray700, width: 0.5)),
                      child: const Icon(
                        Icons.plus_one,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rooms",
                  style: AppStyle.formLabelHeading
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => setState(() {
                        widget.rooms = widget.rooms <= 1 ? 1 : widget.rooms - 1;
                        widget.updateValue(widget.adults, widget.rooms,
                            widget.children, widget.ageArray);
                      }),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: AppColor.gray700, width: 0.5)),
                        child: const Icon(
                          Icons.exposure_minus_1,
                          size: 15,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        widget.rooms.toString(),
                        style: AppStyle.formLabelHeading
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        widget.rooms =
                            widget.rooms >= 30 ? 30 : widget.rooms + 1;
                        widget.updateValue(widget.adults, widget.rooms,
                            widget.children, widget.ageArray);
                      }),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: AppColor.gray700, width: 0.5)),
                        child: const Icon(
                          Icons.plus_one,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Children",
                  style: AppStyle.formLabelHeading
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => setState(() {
                        widget.children =
                            widget.children <= 0 ? 0 : widget.children - 1;
                        if (widget.children >= 0) {
                          widget.ageArray.removeLast();
                        }
                        widget.updateValue(widget.adults, widget.rooms,
                            widget.children, widget.ageArray);
                      }),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: AppColor.gray700, width: 0.5)),
                        child: const Icon(
                          Icons.exposure_minus_1,
                          size: 15,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        widget.children.toString(),
                        style: AppStyle.formLabelHeading
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        takeInput(context);
                      }),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: AppColor.gray700, width: 0.5)),
                        child: const Icon(
                          Icons.plus_one,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.ageArray.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Children ${index + 1}",
                        style: AppStyle.formLabelHeading,
                      ),
                      Text(
                        'Age : ${widget.ageArray[index]}',
                        style: AppStyle.formLabelHeading
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void takeInput(BuildContext context) {
    TextEditingController age = TextEditingController();
    Get.dialog(Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Enter the age of children",
                textAlign: TextAlign.center,
                style: AppStyle.normalLabelHeading
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 17),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              maxLength: 2,
              controller: age,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.gray50, width: 1),
                ),
                hintText: 'Enter the age',
                fillColor: AppColor.gray301,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: (16.00), minHeight: (16.00)),
                counterText: '',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  bottom: 20, top: 20, left: 20, right: 20),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (age.value.text.toString().isEmpty) {
                          DialogHelper.showToast("Please enter the age...");
                        } else if (int.parse(age.value.text.toString()) > 18) {
                          DialogHelper.showToast("Please enter valid age...");
                        } else {
                          setState(() {
                            widget.children = widget.children >= 10
                                ? 10
                                : widget.children + 1;
                            widget.ageArray
                                .add(int.parse(age.value.text.toString()));
                            widget.updateValue(widget.adults, widget.rooms,
                                widget.children, widget.ageArray);
                          });
                          Get.back();
                        }
                      },
                      child: Container(
                        width: size.width / 3.5,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.lightBlue800),
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: AppColor.whiteA701),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: size.width / 3.5,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.red700),
                        child: Text(
                          "No",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: AppColor.whiteA701),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
