import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';

class BusDashboard extends StatefulWidget {
  const BusDashboard({super.key});

  @override
  State<BusDashboard> createState() => _BusDashboardState();
}

class _BusDashboardState extends State<BusDashboard> {
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    dateController.text = formatDate(now);
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
        title: Text("Bus Booking", style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
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
                    hintText: 'Enter source location',
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
                margin: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColor.gray50, width: 1),
                    ),
                    hintText: 'Enter destination location',
                    fillColor: AppColor.gray301,
                    prefixIconConstraints: const BoxConstraints(
                        minWidth: (16.00), minHeight: (16.00)),
                    counterText: '',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      isDense: true,
                      enabled: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: AppColor.gray50, width: 1),
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
                    style: TextStyle(color: AppColor.gray700),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () => busList(),
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
                              child: Text("Search Buses",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold16
                                      .copyWith(letterSpacing: 1.00))),
                        )
                      ]))),
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

  busList() {
    Get.toNamed('/busList');
  }

  formatDate(DateTime date) {
    return DateFormat('EEEE, dd MMMM').format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: currentDate,
        lastDate: currentDate.add(const Duration(days: 365)));

    if (selectedDate != null && selectedDate != currentDate) {
      setState(() {
        dateController.text = formatDate(selectedDate);
      });
    }
  }
}
