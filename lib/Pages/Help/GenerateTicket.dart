import 'package:flutter/material.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Network/Controllers/HelpControllers.dart';
import '../../Network/Models/CommonResponse.dart';
import '../../Network/Models/DropDownMasterResponse.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';

class GenerateTicket extends StatefulWidget {
  const GenerateTicket({Key? key}) : super(key: key);

  @override
  State<GenerateTicket> createState() => _GenerateTicket();
}

class _GenerateTicket extends State<GenerateTicket> {
  String? currentPriorityValue, currentDepartmentValue;
  final controller = HelpController();
  var priorityData = [];
  var departmentData = [];
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  CommonResponse? submitResponse;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => priorityList());
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
          title: Text("Raised New Ticket",
              style: AppStyle.txtPoppinsBold18.copyWith()),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Select Your Department",
                    style: TextStyle(
                        color: AppColor.gray80099,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Container(
                  width: size.width,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.only(
                      left: 20, top: 4, bottom: 4, right: 10),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    hint: const Text("Select Your Operator"),
                    value: currentDepartmentValue,
                    dropdownColor: Colors.white,
                    items: departmentData
                        .map((item) => DropdownMenuItem<String>(
                            value: item.id, child: Text(item.name!)))
                        .toList(),
                    onChanged: (item) => setState(
                        () => currentDepartmentValue = item.toString()),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Select The Priority",
                    style: TextStyle(
                        color: AppColor.gray80099,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Container(
                  width: size.width,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.only(
                      left: 20, top: 4, bottom: 4, right: 10),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    hint: const Text("Select Your Priority"),
                    value: currentPriorityValue,
                    dropdownColor: Colors.white,
                    items: priorityData.map((item) {
                      return DropdownMenuItem<String>(
                          value: item.id, child: Text(item.name!));
                    }).toList(),
                    onChanged: (item) =>
                        setState(() => currentPriorityValue = item.toString()),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Subject",
                    style: TextStyle(
                        color: AppColor.gray80099,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    controller: subjectController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: "Ex-Technical",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Message",
                    style: TextStyle(
                        color: AppColor.gray80099,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 150,
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: "Address",
                        contentPadding: const EdgeInsets.only(
                            left: 20, top: 20, bottom: 20, right: 30)),
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      submitForm();
                    },
                    child: Container(
                        height: (65.00),
                        margin:
                            const EdgeInsets.only(left: 23, top: 30, right: 23),
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
                                            shape:
                                                IconButtonShape.CircleBorder15,
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
                                child: Text("submit".toUpperCase(),
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
      ),
    );
  }

  Future<void> submitForm() async {
    if (currentDepartmentValue == "") {
      DialogHelper.showToast("Select department related to your query");
    } else if (currentPriorityValue == "") {
      DialogHelper.showToast("Select priority of your query");
    } else if (subjectController.text.toString().isEmpty) {
      DialogHelper.showToast("Please enter your subject");
    } else if (messageController.text.toString().isEmpty) {
      DialogHelper.showToast("Please enter your message");
    } else {
      var body = {
        "priorityID": currentPriorityValue,
        "departmentID": currentDepartmentValue,
        "subject": subjectController.text.toString(),
        "message": messageController.text.toString()
      };
      var json = await controller.submitForm(body);
      submitResponse = CommonResponse.fromJson(json);
      setState(() {
        if (submitResponse!.status == "0") {
          DialogHelper.showSuccessDialog(
              title: "Success", description: submitResponse!.message!);
        } else {
          DialogHelper.showErrorDialog(
              title: "Error", description: submitResponse!.message!);
        }
      });
    }
  }

  Future<void> priorityList() async {
    var body1 = {"action": "department", "id": "0"};
    var body2 = {"action": "priority", "id": "0"};
    var a = await controller.dropDown(body1);
    var b = await controller.dropDown(body2);
    departmentData = DropDownMasterResponse.fromJson(a).data!;
    priorityData = DropDownMasterResponse.fromJson(b).data!;
    setState(() {});
  }
}
