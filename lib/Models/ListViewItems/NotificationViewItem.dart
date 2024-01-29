import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../Utils/ImageConstant.dart';

class NotificationViewItem extends StatelessWidget {
  final dynamic data;

  const NotificationViewItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          leading: SvgPicture.asset(ImageConstant.notificationViewItemIcon),
          title: Text(data.description),
          subtitle: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                DateFormat().format(DateTime.parse(data.addDate)),
              )),
        ),
        const Divider()
      ]),
    );
  }
}
