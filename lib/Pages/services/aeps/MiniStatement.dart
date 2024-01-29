import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class MiniStatement extends StatefulWidget {
  const MiniStatement({Key? key}) : super(key: key);

  @override
  State<MiniStatement> createState() => _MiniStatementState();
}

class _MiniStatementState extends State<MiniStatement> {
  var confirmData;
  var ministatment;

  @override
  void initState() {
    super.initState();
    confirmData = json.decode(Get.arguments);
    ministatment = confirmData["miniStatement"];
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
        title:
            Text("Mini Statement", style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all( 15),
                decoration: BoxDecoration(
                    color: AppColor.lightBlue801.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  padding: const EdgeInsets.all( 15),
                  decoration: BoxDecoration(
                      color: AppColor.whiteA700,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Account Number        :",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            confirmData["accountNumber"],
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Balance Amount         :",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              "₹ ${confirmData["closingBalance"]}",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: AppColor.amountColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.lightBlue801.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                      const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                      decoration: AppDecoration.mainGradient
                          .copyWith(borderRadius: BorderRadius.circular(10)),
                      child: Text("Excel",
                          style: TextStyle(
                              color: AppColor.whiteA700,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              fontSize: 14)),
                    ),
                    Container(
                      padding:
                      const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                      decoration: BoxDecoration(
                          color: AppColor.whiteA700,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "PDF",
                        style: TextStyle(
                            color: AppColor.gray500,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 14),
                      ),
                    ),
                    Container(
                      padding:
                      const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                      decoration: AppDecoration.mainGradient
                          .copyWith(borderRadius: BorderRadius.circular(10)),
                      child: Text("Print",
                          style: TextStyle(
                              color: AppColor.whiteA700,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              fontSize: 14)),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppColor.lightBlue801.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  padding: const EdgeInsets.all( 5),
                  decoration: BoxDecoration(
                      color: AppColor.whiteA700,
                      borderRadius: BorderRadius.circular(15)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(
                            label: Text(
                          "No",
                          style: TextStyle(),
                        )),
                        DataColumn(label: Text("Date")),
                        DataColumn(label: Text("TxnType")),
                        DataColumn(label: Text("Amount")),
                        DataColumn(label: Text("Narration")),
                      ],
                      rows: [
                        for (var i = 0; i < ministatment.length; i++) rows(i)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  DataRow rows(int i) {
    return DataRow(cells: [
      DataCell(Text(i.toString())),
      DataCell(Text(ministatment[i]["date"])),
      DataCell(Text(ministatment[i]["txnType"])),
      DataCell(Text("₹ ${ministatment[i]["amount"]}")),
      DataCell(Text(ministatment[i]["narration"])),
    ]);
  }
}
