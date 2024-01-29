import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpay/Network/Controllers/HelpControllers.dart';
import 'package:fpay/Network/Models/TicketHistoryResponse.dart';
import 'package:fpay/Pages/Help/GenerateTicket.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:intl/intl.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';

class GenerateTicketHistory extends StatefulWidget {
  const GenerateTicketHistory({Key? key}) : super(key: key);

  @override
  State<GenerateTicketHistory> createState() => _GenerateTicketHistoryState();
}

class _GenerateTicketHistoryState extends State<GenerateTicketHistory> {
  final controller = HelpController();
  TicketHistoryResponse? response;
  String fromDate = "";
  String toDate = "";

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    var formatter = DateFormat('dd/MM/yyyy');
    toDate = formatter.format(now);
    fromDate = DateFormat('dd/MM/yyyy')
        .format(DateTime(DateTime.now().year, DateTime.now().month - 1));
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => getCurrentData(fromDate, toDate));
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
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Ticket History",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Align(
                  child: ElevatedButton.icon(
                      onPressed: () {
                        goToGenerateTicket();
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.lightBlue800),
                      label: const Text(
                        "New",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 16),
                      ))),
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all( 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Current Month",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                        padding:
                        const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey, width: 0.9)),
                        child: SvgPicture.asset(ImageConstant.moreIcon))
                  ],
                ),
                if (response?.data?.length != null) getList()
              ],
            )),
      ),
    );
  }

  Future<void> getCurrentData(String fromDate, String toDate) async {
    var body = {"fromDate": fromDate, "toDate": toDate};
    var a = await controller.ticketsList(body);
    response = TicketHistoryResponse.fromJson(a);
    setState(() {});
  }

  Widget getList() {
    return Expanded(
        child: ListView.builder(
            itemCount: response?.data?.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.7),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Text(
                              response?.data?[index].subject ?? 'NA',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: true,
                              style: TextStyle(
                                  color: AppColor.black900,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Text(
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                          response?.data?[index].addDate ?? 'NA',
                          style: const TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 12),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Text(
                                response?.data?[index].message ?? 'NA',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: true,
                              ),
                            ),
                          ),
                          Text(response?.data?[index].status ?? 'NA')
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  goToGenerateTicket() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GenerateTicket()),
    );
  }
}
