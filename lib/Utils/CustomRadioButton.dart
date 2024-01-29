import 'package:flutter/material.dart';

import '../AppManager/ThemeColor.dart';

class CustomRadioButton extends StatelessWidget {
  String? title;
  dynamic value;
  dynamic selectedProductType;
  Function(dynamic)? onChanged;

  CustomRadioButton({
    Key? key,
    required this.title,
    required this.value,
    required this.selectedProductType,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<dynamic>(
          contentPadding: const EdgeInsets.all(0.0),
          value: value,
          groupValue: selectedProductType,
          dense: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          tileColor: AppColor.lightBlue801.withOpacity(0.1),
          title: Text(title!),
          onChanged: onChanged),
    );
  }
}
