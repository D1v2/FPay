import 'package:flutter/material.dart';
import 'package:fpay/Network/Controllers/HotelController.dart';
import 'package:fpay/Network/Models/hotelModel/hotelList/His.dart';
import 'package:fpay/Network/Models/hotelModel/hotelList/HotelListResponse.dart';
import 'package:fpay/Pages/services/hotel/HotelDetail.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';

class HotelList extends StatefulWidget {
  const HotelList({super.key});

  @override
  State<HotelList> createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  var hotelController = HotelController();
  HotelListResponse? hotelListResponse;
  List<Widget> item = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => hotelList());
  }

  Widget itemView(His data) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          hotelDetail(data.id!);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                data.img![0].url!,
                width: 200,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 14,
                    color: Colors.orangeAccent,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      data.rt.toString(),
                      style: AppStyle.formLabelHeading.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  Text(
                    "(251)",
                    style: AppStyle.formLabelHeading.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Text(
              data.name ?? "NA",
              style: AppStyle.normalLabelHeading.copyWith(fontSize: 15),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                data.ad?.adr ?? "NA",
                style: AppStyle.formLabelHeading.copyWith(fontSize: 12),
              ),
            ),
            Row(
              children: [
                Text(
                  "₹ ${data.pops?[0].tpc}  ",
                  style: AppStyle.normalLabelHeading.copyWith(fontSize: 13),
                ),
                Text(
                  "${data.pops?[0].fc?[0]}",
                  style: AppStyle.normalLabelHeading
                      .copyWith(fontSize: 13, color: AppColor.gray400),
                ),
              ],
            )
          ],
        ),
      ),
    );
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
        title: Text("All Hotel", style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: AppColor.gray50, width: 1),
                      ),
                      hintText: 'Search hotel',
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
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    topLeft: Radius.circular(40))),
                            builder: (BuildContext context) {
                              return const BottomSheet();
                            })
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: AppDecoration.mainGradient
                            .copyWith(borderRadius: BorderRadius.circular(15)),
                        margin: const EdgeInsets.only(left: 10),
                        child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                            child: CommonImageView(
                              svgPath: ImageConstant.moreIcon,
                              height: 10,
                              width: 10,
                            )),
                      ),
                    ))
              ],
            ),
            item.isEmpty
                ? Center(
                    child: Text("No Hotel Founded"),
                  )
                : Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                          ),
                          children: item,
                        )))
          ],
        ),
      ),
    ));
  }

  hotelDetail(String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HotelDetail(
                hotelId: id,
              )),
    );
  }

  Future hotelList() async {
    var body = {"searchId": "hsid5253913912"};
    var json = await hotelController.hotelList(body);
    hotelListResponse = HotelListResponse.fromJson(json);
    if (hotelListResponse?.status?.success == true) {
      if (hotelListResponse?.searchResult != null) {
        for (int i = 0; i <= hotelListResponse!.searchResult!.size! - 1; i++) {
          item.add(itemView(hotelListResponse!.searchResult!.his![i]));
        }
      } else {
        DialogHelper.showErrorDialog(description: "Hotel Not found");
      }
    } else {
      if (hotelListResponse?.errors != null) {
        DialogHelper.showErrorDialog(
            description: hotelListResponse!.errors![0].message.toString());
      } else {
        DialogHelper.showErrorDialog(description: "Something went wrong...");
      }
    }
    setState(() {});
  }
}

class BottomSheet extends StatefulWidget {
  const BottomSheet({super.key});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  int ratingNumber = 5;

  double _startValue = 100;
  double _endValue = 2500;
  double min = 100;
  double max = 10000;

  void _updateRangeValues(RangeValues newValues) {
    setState(() {
      _startValue = newValues.start;
      _endValue = newValues.end;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 30,
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 2, bottom: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.gray400),
              ),
            ),
            Text(
              "Filter",
              style: AppStyle.normalLabelHeading
                  .copyWith(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.formBackGround),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Placeholder",
                    style: AppStyle.formLabelHeading,
                  ),
                  DropdownButton(items: const [], onChanged: (value) {})
                ],
              ),
            ),
            Text(
              "Price Range",
              style: AppStyle.normalLabelHeading.copyWith(fontSize: 14),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0),
              child: RangeSlider(
                values: RangeValues(_startValue, _endValue),
                min: min,
                divisions: 100,
                activeColor: AppColor.lightBlue801,
                inactiveColor: AppColor.gray400,
                max: max,
                onChanged: _updateRangeValues,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _startValue.toString(),
                  style: AppStyle.normalLabelHeading,
                ),
                Text(
                  _endValue.toString(),
                  style: AppStyle.normalLabelHeading,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.formBackGround),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Facilities",
                    style: AppStyle.formLabelHeading,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColor.whiteA700),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          visualDensity: const VisualDensity(
                            horizontal: 0.0,
                            vertical: -4.0,
                          ),
                          title: Text(
                            'Free Wifi',
                            style: AppStyle.normalLabelHeading,
                          ),
                          value: true,
                          activeColor: AppColor.lightBlue801,
                          onChanged: (newValue) {
                            setState(() {
                              // _isChecked = newValue;
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        CheckboxListTile(
                          visualDensity: const VisualDensity(
                            horizontal: 0.0,
                            vertical: -4.0,
                          ),
                          title: Text(
                            'Swimming Pool',
                            style: AppStyle.normalLabelHeading,
                          ),
                          value: false,
                          activeColor: AppColor.lightBlue801,
                          onChanged: (newValue) {
                            setState(() {
                              // _isChecked = newValue;
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        CheckboxListTile(
                          visualDensity: const VisualDensity(
                            horizontal: 0.0,
                            vertical: -4.0,
                          ),
                          title: Text(
                            'TV',
                            style: AppStyle.normalLabelHeading,
                          ),
                          value: true,
                          activeColor: AppColor.lightBlue801,
                          onChanged: (newValue) {
                            setState(() {
                              // _isChecked = newValue;
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        CheckboxListTile(
                          visualDensity: const VisualDensity(
                            horizontal: 0.0,
                            vertical: -4.0,
                          ),
                          title: Text(
                            'Laundry',
                            style: AppStyle.normalLabelHeading,
                          ),
                          value: true,
                          activeColor: AppColor.lightBlue801,
                          onChanged: (newValue) {
                            setState(() {
                              // _isChecked = newValue;
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.formBackGround),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ratings",
                    style: AppStyle.formLabelHeading,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ratingItem(5),
                        ratingItem(4),
                        ratingItem(3),
                        ratingItem(2),
                        ratingItem(1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: () {},
                child: Container(
                    height: (60.00),
                    margin: const EdgeInsets.only(
                        left: 23, top: 20, right: 23, bottom: 10),
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
                            child: Text("Apply Filter".toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsSemiBold16
                                    .copyWith(letterSpacing: 1.00))),
                      )
                    ]))),
          ],
        ),
      ),
    );
  }

  Widget ratingItem(int number) {
    return InkWell(
      onTap: () {
        setState(() {
          ratingNumber = number;
        });
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
        decoration: (ratingNumber == number)
            ? AppDecoration.mainGradient.copyWith(
                borderRadius: BorderRadius.circular(15),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.whiteA700),
        child: Row(
          children: [
            Icon(
              Icons.star,
              size: 20,
              color: (ratingNumber == number)
                  ? AppColor.whiteA700
                  : AppColor.black900,
            ),
            Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(number.toString(),
                    style: AppStyle.normalLabelHeading.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: (ratingNumber == number)
                            ? AppColor.whiteA700
                            : AppColor.black900)))
          ],
        ),
      ),
    );
  }
}
