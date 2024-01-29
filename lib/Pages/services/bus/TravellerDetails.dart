import 'package:flutter/material.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class TravellerDetails extends StatefulWidget {
  const TravellerDetails({super.key});

  @override
  State<TravellerDetails> createState() => _TravellerDetailsState();
}

class _TravellerDetailsState extends State<TravellerDetails> {
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
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Align(
            child: InkWell(
              child: Icon(
                Icons.arrow_back,
                color: AppColor.whiteA700,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text("Traveller Details",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Laxmi travallers jaipur",
                    style: AppStyle.formLabelHeading
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "1 Travallers",
                    style: AppStyle.normalLabelHeading
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "AC, Seater",
                      style: AppStyle.formLabelHeading.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColor.gray400),
                    ),
                    Text(
                      "Seat 1",
                      style: AppStyle.formLabelHeading.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColor.gray500),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: AppColor.gray400, width: 1)),
                child: Column(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
