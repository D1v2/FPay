import 'package:flutter/material.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Network/Controllers/DashboardController.dart';
import 'package:fpay/Network/Models/NotificationResponse.dart';
import 'package:fpay/Utils/DialogHelper.dart';

import '../../Models/ListViewItems/NotificationViewItem.dart';
import '../../Utils/WidgetsConstant.dart';
import '../../Utils/app_style.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final controller = DashboardController();
  NotificationResponse? notificationResponse;
  var data = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => notificationList());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
        title: Text("NotificationPage",
            style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          data.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return NotificationViewItem(data: data[index]);
                    },
                  ),
                )
              : dataNotFound()
        ],
      ),
    ));
  }

  Future notificationList() async {
    var body = {};
    var json = await controller.notificationList(body);
    notificationResponse = NotificationResponse.fromJson(json);
    setState(() {
      if (notificationResponse?.status == true) {
        data = notificationResponse!.data!;
      } else {
        DialogHelper.showErrorDialog(
            description: notificationResponse!.message.toString());
      }
    });
  }
}
