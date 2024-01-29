import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Network/Controllers/MoneyTransferController.dart';
import 'package:fpay/Network/Models/CommonResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Models/HomeIconsResponse.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';
class CheckNumber extends StatefulWidget {
  const CheckNumber({Key? key}) : super(key: key);

  @override
  State<CheckNumber> createState() => _CheckNumberState();
}

class _CheckNumberState extends State<CheckNumber> {
  final TextEditingController _mobileController = TextEditingController();
  final controller = MoneyTransferController();
  CommonResponse? commonResponse;
  late HomeIconsData? homeIconsData;

  @override
  void initState() {
    super.initState();
    homeIconsData = Get.arguments;
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
            title: Text(homeIconsData!.serviceName!,
                style: AppStyle.txtPoppinsBold18.copyWith()),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20.0))),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.formBackGround),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Remitter Mobile Number",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: AppColor.whiteA700,
                            border:
                                Border.all(color: AppColor.whiteA700, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          controller: _mobileController,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: 'Enter Remitter Number',
                            hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                            contentPadding: EdgeInsets.all(10),
                            counterText: '',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  child: GestureDetector(
                      onTap: () {
                        checkNumber();
                      },
                      child: Container(
                          height: (65.00),
                          margin: const EdgeInsets.only(
                              left: 23, top: 30, right: 23, bottom: 30),
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
                                              height: 30,
                                              width: 30,
                                              margin: const EdgeInsets.all(14),
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
                                  child: Text("Process To Next",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsSemiBold16
                                          .copyWith(letterSpacing: 1.00))),
                            )
                          ]))),
                )
              ],
            ),
          )),
    );
  }

  Future checkNumber() async {
    if (_mobileController.value.text.isEmpty) {
      DialogHelper.errorSnackBar(context, "Mobile number can not be empty");
    } else if (!isMobileNumber(_mobileController.value.text)) {
      DialogHelper.errorSnackBar(context, "Please enter valid mobile number");
    } else {
      var body = {
        "ServiceID": 3,
        "Mobile": _mobileController.value.text.toString()
      };
      var json = await controller.checkNumber(body);
      commonResponse = CommonResponse.fromJson(json);
      setState(() {
        if (commonResponse?.status == true) {
          Get.toNamed('/dmrBank', arguments: {
            'number': _mobileController.text.toString(),
            'iconData': homeIconsData
          });
        } else {
          Get.toNamed('/addNumberMoneyTransfer', arguments: {
            'number': _mobileController.text.toString(),
            'iconData': homeIconsData
          });
        }
      });
    }
  }
}
