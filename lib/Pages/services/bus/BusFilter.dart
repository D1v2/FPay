import 'package:flutter/material.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/math_utils.dart';

class BusFilter extends StatefulWidget {
  const BusFilter({super.key});

  @override
  State<BusFilter> createState() => _BusFilterState();
}

class _BusFilterState extends State<BusFilter> {
  double _startValue = 100;
  double _endValue = 2500;
  double min = 100;
  double max = 10000;

  int sheetNumber = 1;

  void _updateRangeValues(RangeValues newValues) {
    setState(() {
      _startValue = newValues.start;
      _endValue = newValues.end;
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
        title: Text("Filter", style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 5, right: 10),
            child: InkWell(
              child: CommonImageView(
                imagePath: ImageConstant.refreshIcon,
                height: 12.00,
                width: 35.00,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25, bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColor.gray50, width: 1),
                  ),
                  hintText: 'From',
                  fillColor: AppColor.gray301,
                  prefixIconConstraints: const BoxConstraints(
                      minWidth: (16.00), minHeight: (16.00)),
                  counterText: '',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 30),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: AppColor.gray300),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Image.asset(
                    ImageConstant.sourceDestinationImage,
                    height: 40,
                    width: 40,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    decoration: BoxDecoration(
                      border: Border.all(width: .8, color: AppColor.gray300),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColor.gray50, width: 1),
                  ),
                  hintText: 'To',
                  fillColor: AppColor.gray301,
                  prefixIconConstraints: const BoxConstraints(
                      minWidth: (16.00), minHeight: (16.00)),
                  counterText: '',
                ),
              ),
            ),
            Text(
              "Pricing",
              style: AppStyle.normalLabelHeading.copyWith(fontSize: 15),
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
                  "₹$_startValue",
                  style: AppStyle.normalLabelHeading,
                ),
                Text(
                  "₹$_endValue",
                  style: AppStyle.normalLabelHeading,
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15), child: const Divider()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quantity",
                  style: AppStyle.normalLabelHeading.copyWith(fontSize: 18),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => setState(() {
                        sheetNumber = sheetNumber <= 1 ? 1 : sheetNumber--;
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
                        sheetNumber.toString(),
                        style: AppStyle.formLabelHeading
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    InkWell(
                      onTap: () => {
                        setState(() {
                          // sheetNumber = sheetNumber >= 5 ? 5 : sheetNumber++;
                          if (sheetNumber != 5) {
                            sheetNumber++;
                          }
                        })
                      },
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
            )
          ],
        ),
      ),
    ));
  }
}
