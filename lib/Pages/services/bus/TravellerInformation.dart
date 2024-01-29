import 'package:flutter/material.dart';
import 'package:fpay/Utils/FunctionUtils.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';

class TravellerInformation extends StatefulWidget {
  const TravellerInformation({super.key});

  @override
  State<TravellerInformation> createState() => _TravellerInformationState();
}

class _TravellerInformationState extends State<TravellerInformation> {
  int currentScanDevice = 0;

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
        title: Text("Traveller Information",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 10),
            child: InkWell(
              //  onTap: () => addAccounts(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.whiteA700.withOpacity(0.3)),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                  Icon(
                    Icons.add,
                    color: AppColor.lightBlue801,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              formItems(1, 2),
              formItems(3, 4),
              GestureDetector(
                  onTap: () => goWithTo('/busTravellerDetails'),
                  child: Container(
                      height: (60.00),
                      margin: const EdgeInsets.only(top: 30),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomIconButton(
                                          height: 25,
                                          width: 25,
                                          margin: const EdgeInsets.all(10),
                                          variant: IconButtonVariant
                                              .OutlineWhiteA701,
                                          shape: IconButtonShape.CircleBorder15,
                                          padding:
                                              IconButtonPadding.PaddingAll8,
                                          alignment: Alignment.centerRight,
                                          child: CommonImageView(
                                              svgPath: ImageConstant.moveIcon))
                                    ]))),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 40, top: 21, right: 40, bottom: 20),
                              child: Text("Process To Book",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold16
                                      .copyWith(letterSpacing: 1.00))),
                        )
                      ]))),
            ],
          ),
        ),
      ),
    ));
  }

  Widget formItems(int firstValue, int secondValue) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.gray400, width: 0.6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Passenger 1",
            style: AppStyle.formLabelHeading
                .copyWith(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25, bottom: 10),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.gray50, width: 1),
                ),
                hintText: 'Full Name',
                fillColor: AppColor.gray301,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: (16.00), minHeight: (16.00)),
                counterText: '',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 10),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.gray50, width: 1),
                ),
                hintText: 'Age',
                fillColor: AppColor.gray301,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: (16.00), minHeight: (16.00)),
                counterText: '',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 10),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.gray50, width: 1),
                ),
                hintText: 'Mobile Number',
                fillColor: AppColor.gray301,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: (16.00), minHeight: (16.00)),
                counterText: '',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.gray50, width: 1),
                ),
                hintText: 'Email',
                fillColor: AppColor.gray301,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: (16.00), minHeight: (16.00)),
                counterText: '',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              customScannerButton("Male", firstValue, Icons.male),
              customScannerButton("Female", secondValue, Icons.female),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: AppDecoration.mainGradient
                      .copyWith(borderRadius: BorderRadius.circular(10)),
                  child: Text("S1",
                      style: AppStyle.normalLabelHeading.copyWith(
                          fontSize: 15,
                          color: AppColor.whiteA700,
                          fontWeight: FontWeight.w500)),
                ),
                Text(
                  "On Ward",
                  style: AppStyle.formLabelHeading.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColor.lightBlue801),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customScannerButton(String txt, int index, IconData icons) {
    return InkWell(
      onTap: () {
        setState(() {
          currentScanDevice = index;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (currentScanDevice == index)
                    ? AppColor.lightBlue800.withOpacity(0.3)
                    : AppColor.gray300,
              ),
              child: Icon(
                icons,
                color: (currentScanDevice == index)
                    ? AppColor.lightBlue800
                    : AppColor.gray500,
              )),
          Text(
            "  ${txt.toUpperCase()}",
            style: TextStyle(
                color: (currentScanDevice == index)
                    ? AppColor.lightBlue801
                    : AppColor.gray500,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}
