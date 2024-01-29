import 'package:flutter/material.dart';

import '../AppManager/ThemeColor.dart';
import 'math_utils.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Ask Permission ?',
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColor.black900),
      ),
      content: Container(
          margin: getMargin(top: 5, bottom: 5),
          child: Text(
            "Allow the allow management of all files for download pdf",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.gray800),
          )),
      actions: [
        TextButton(
          child: Text(
            'No',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: AppColor.black900),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            'Allow',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: AppColor.black900),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            //  openAppSettings();
          },
        ),
      ],
    );
  }
}
