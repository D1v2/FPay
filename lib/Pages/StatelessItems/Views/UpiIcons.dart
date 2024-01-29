import 'package:flutter/material.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../Classes/UpiModel.dart';

class UpiIcons extends StatelessWidget {
  UpiItem? upiItem;

  UpiIcons({Key? key, required this.upiItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all( 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColor.whiteA701),
        child: Row(
          children: [
            Image.asset(
              upiItem!.image,
              height: 45,
              width: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: Text(
                upiItem!.upiId,
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
