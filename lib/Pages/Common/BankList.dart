import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpay/Network/Controllers/MoneyTransferController.dart';
import 'package:fpay/Network/Models/BankResponse.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Network/Controllers/PayoutController.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/WidgetsConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';

class BankList extends StatefulWidget {
  String service;

  BankList({Key? key, required this.service}) : super(key: key);

  @override
  State<BankList> createState() => _BankListState();
}

class _BankListState extends State<BankList> {
  final TextEditingController _searchController = TextEditingController();
  final dmrController = MoneyTransferController();
  final payoutController = PayoutController();

  var bankListOnSearch = [];
  var bankList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => fetchBanks());
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
          title: Text("Select Bank", style: AppStyle.txtPoppinsBold18.copyWith()),
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
                            .where((element) => element.bankName
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
      ),
    );
  }

  Future fetchBanks() async {
    if (widget.service == "Payout") {
      var json = await payoutController.allBanksList();
      if(json!=null){
        bankList = BankResponse.fromJson(json).data!;
      }

    } else {
      var json = await dmrController.allBankList({});
      bankList = BankResponse.fromJson(json).data!;
    }

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
                  onBackPressed(_searchController.text.isNotEmpty
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
                      ? bankListOnSearch[index].bankName!
                      : bankList[index].bankName!),
                ),
              );
            }));
  }

  onBackPressed(BankData bankData) {
    Navigator.of(context).pop({'bankData': bankData});
  }
}
