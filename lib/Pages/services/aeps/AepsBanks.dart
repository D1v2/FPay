import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpay/Network/Controllers/AepsControllers.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Models/DropDownMasterResponse.dart';
import '../../../Utils/WidgetsConstant.dart';
import '../../../Utils/app_style.dart';

class AepsBanks extends StatefulWidget {
  AepsBanks({Key? key}) : super(key: key);

  @override
  State<AepsBanks> createState() => _AepsBanksState();
}

class _AepsBanksState extends State<AepsBanks> {
  final TextEditingController _searchController = TextEditingController();
  final controller = AepsControllers();

  var bankListOnSearch = [];
  var bankList = [];
  late bool aeps;

  @override
  void initState() {
    super.initState();
    aeps = Get.arguments;
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => fetchBanks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
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
        title: Text("Select Your Bank",
            style: AppStyle.txtPoppinsBold18.copyWith()),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              semanticContainer: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      bankListOnSearch = bankList
                          .where((element) => element.name
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
                        ? Container()
                        : bankList.isEmpty
                            ? Container()
                            : Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                    left: 15, top: 5, bottom: 10),
                                child: Text(
                                  "All Banks",
                                  style: TextStyle(
                                      color: AppColor.gray600,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      fontFamily: 'Poppins'),
                                )),
                    _searchController.text.isNotEmpty &&
                            bankListOnSearch.isEmpty
                        ? dataNotFound()
                        : bankList.isNotEmpty
                            ? showBankList()
                            : dataNotFound(),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Future<void> fetchBanks() async {
    var body = {"action": aeps ? "AepsBank" : "Bank", "id": "0"};
    var json = await controller.bankList(body);
    bankList = DropDownMasterResponse.fromJson(json).data!;
    setState(() {});
  }

  Widget showBankList() {
    return Expanded(
        child: ListView.separated(
            itemCount: _searchController.text.isNotEmpty
                ? bankListOnSearch.length
                : bankList.length,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.back(
                      result: _searchController.text.isNotEmpty
                          ? bankListOnSearch[index]
                          : bankList[index]);
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    ImageConstant.bankSVGIcon,
                    height: 20,
                    width: 20,
                    color: AppColor.blue500,
                  ),
                  title: Text(_searchController.text.isNotEmpty
                      ? bankListOnSearch[index].name!
                      : bankList[index].name!),
                ),
              );
            }));
  }
}
