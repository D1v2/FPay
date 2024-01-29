import 'package:flutter/material.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class HotelCityList extends StatefulWidget {
  const HotelCityList({super.key});

  @override
  State<HotelCityList> createState() => _HotelCityListState();
}

class _HotelCityListState extends State<HotelCityList> {
  TextEditingController cityController = TextEditingController();

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
        title: Text("City List", style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: cityController,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.gray50, width: 1),
                ),
                hintText: 'Search Location',
                fillColor: AppColor.gray301,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: (16.00), minHeight: (16.00)),
                counterText: '',
                prefixIcon: Container(
                    margin: const EdgeInsets.only(
                      left: 18,
                      right: 14,
                    ),
                    child: Image.asset(ImageConstant.searchIcon)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
