import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Utils/DialogHelper.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';

class HotelFormDetail extends StatefulWidget {
  const HotelFormDetail({super.key});

  @override
  State<HotelFormDetail> createState() => _HotelFormDetailState();
}

class _HotelFormDetailState extends State<HotelFormDetail> {
  bool isChecked = false;
  String fromDate = "";

  int adults = 2;
  int children = 0;
  int rooms = 1;
  List<int> ageArray = [];

  void updateValues(int ad, int rm, int chld, List<int> array) {
    setState(() {
      adults = ad;
      rooms = rm;
      children = chld;
      ageArray = array;
    });
  }

  @override
  void initState() {
    super.initState();
    DateTime currentDate = DateTime.now();
    fromDate = "${currentDate.year}-${currentDate.month}-${currentDate.day}";
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
        title: Text("From Detail", style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: getPadding(all: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.formBackGround),
              padding: getPadding(all: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Information Detail",
                    style: AppStyle.normalLabelHeading
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 17),
                  ),
                  Container(
                      margin: getMargin(top: 8, bottom: 8),
                      child: const Divider()),
                  Text(
                    "Dates",
                    style: AppStyle.formLabelHeading,
                  ),
                  InkWell(
                    onTap: () => selectDate(),
                    child: Container(
                      padding: getPadding(all: 15),
                      margin: getMargin(top: 5, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.whiteA700),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.date_range),
                              Text(" $fromDate")
                            ],
                          ),
                          const Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Guest",
                    style: AppStyle.formLabelHeading,
                  ),
                  InkWell(
                    onTap: () => showBottomSheet(context),
                    child: Container(
                      padding: getPadding(all: 15),
                      margin: getMargin(top: 5, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.whiteA700),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Icons.person),
                                Expanded(
                                  child: Text(
                                    " $adults Persons and $rooms are rooms $children are children",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Room Types",
                    style: AppStyle.formLabelHeading,
                  ),
                  Container(
                    padding: getPadding(all: 15),
                    margin: getMargin(top: 5, bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.whiteA700),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.home),
                            Text(" Select Room Type")
                          ],
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  Text(
                    "Phone Number",
                    style: AppStyle.formLabelHeading,
                  ),
                  Container(
                    padding: getPadding(all: 15),
                    margin: getMargin(top: 5, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.whiteA700),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Icon(Icons.phone), Text(" Your Phone Number")],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: AppColor.lightBlue801,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                ),
                Text(
                  "Agree on terms and conditions",
                  style: AppStyle.normalLabelHeading
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
            GestureDetector(
                onTap: () {},
                child: Container(
                    height: (60.00),
                    margin: const EdgeInsets.only(left: 23, top: 30, right: 23),
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
                            child: Text("continue".toUpperCase(),
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

  Future selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        fromDate = picked.toString().substring(0, 11);
      });
    }
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
      padding: getPadding(all: 15),
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
                      padding: getPadding(all: 10),
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
                    margin: getMargin(left: 15, right: 15),
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
                      padding: getPadding(all: 10),
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
            margin: getMargin(top: 10, bottom: 10),
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
                        padding: getPadding(all: 10),
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
                      margin: getMargin(left: 15, right: 15),
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
                        padding: getPadding(all: 10),
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
            margin: getMargin(top: 10, bottom: 10),
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
                        padding: getPadding(all: 10),
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
                      margin: getMargin(left: 15, right: 15),
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
                        padding: getPadding(all: 10),
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
        padding: getPadding(left: 10, right: 10, top: 30, bottom: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: getMargin(top: 20, bottom: 20),
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
              margin: getMargin(bottom: 20, top: 20, left: 20, right: 20),
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
                        padding: getPadding(left: 20, right: 20),
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
                        padding: getPadding(left: 20, right: 20),
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
