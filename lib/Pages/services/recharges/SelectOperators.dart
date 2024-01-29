import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';

import '../../../Network/Models/DropDownMasterResponse.dart';
import '../../../Network/Models/OperatorData.dart';
import '../../../Utils/WidgetsConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class SelectOperators extends StatefulWidget {
  const SelectOperators({Key? key}) : super(key: key);

  @override
  State<SelectOperators> createState() => _SelectOperatorsState();
}

class _SelectOperatorsState extends State<SelectOperators> {
  final TextEditingController _searchController = TextEditingController();
  var bankListOnSearch = [];

  late List<OperatorData>? operatorList;
  late List<DropDownMasterData>? circleList;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> ar = Get.arguments;
    operatorList = ar['ol'];
    circleList = ar['cl'];
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
        title: Text(operatorList.isNull ? "Select Circle" : 'Select Operator',
            style: AppStyle.txtPoppinsBold18.copyWith()),
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
            circleList.isNull
                ? Container()
                : Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    semanticContainer: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {
                            bankListOnSearch = circleList!
                                .where((element) => element.name!
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "Search here..",
                            suffixIcon: const Icon(Icons.search),
                            contentPadding: const EdgeInsets.only(left: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)))),
                  ),
            Expanded(
                child: Card(
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _searchController.text.isNotEmpty &&
                            bankListOnSearch.isEmpty
                        ? dataNotFound()
                        : showBankList(),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    ));
  }

  Widget showBankList() {
    return Expanded(
        child: ListView.separated(
            itemCount: _searchController.text.isNotEmpty
                ? bankListOnSearch.length
                : operatorList.isNull
                    ? circleList!.length
                    : operatorList!.length,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  operatorList.isNull
                      ? onBackPressedCircle(_searchController.text.isNotEmpty
                          ? bankListOnSearch[index]
                          : circleList![index])
                      : onBackPressedOperator(operatorList![index]);
                },
                child: ListTile(
                  leading: operatorList.isNull
                      ? SvgPicture.asset(ImageConstant.userAvatarIcon)
                      : Image.network(
                          "https://fpay.net.in/SoftwareImage/RechargeDynamicLogo/${operatorList?[index].operatorLogo}",
                          height: 55,
                          width: 55,
                        ),
                  title: Text(
                    _searchController.text.isNotEmpty
                        ? bankListOnSearch[index].name!
                        : operatorList.isNull
                            ? circleList![index].name
                            : operatorList![index].operatorName,
                  ),
                ),
              );
            }));
  }

  onBackPressedCircle(DropDownMasterData bankData) {
    Get.back(result: bankData);
  }

  onBackPressedOperator(OperatorData bankData) {
    Get.back(result: bankData);
  }
}
