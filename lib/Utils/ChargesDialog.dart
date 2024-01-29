import 'package:flutter/material.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Utils/app_style.dart';
import 'package:fpay/Utils/math_utils.dart';

class ChargesDialog extends StatelessWidget {
  int currentAmount;
  dynamic charges;
  String bankName;

  ChargesDialog(
      {Key? key,
      required this.currentAmount,
      required this.charges,
      required this.bankName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              bankName,
              style: AppStyle.formLabelHeading.copyWith(fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Amount",
                    style: AppStyle.formLabelHeading.copyWith(fontSize: 14),
                  ),
                  Text(
                    "₹ $currentAmount",
                    style: AppStyle.formLabelHeading.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Charges",
                    style: AppStyle.formLabelHeading.copyWith(fontSize: 14),
                  ),
                  Text(
                    "₹ $charges",
                    style: AppStyle.formLabelHeading.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: AppStyle.formLabelHeading.copyWith(fontSize: 14),
                  ),
                  Text(
                    "₹ ${charges + currentAmount}",
                    style: AppStyle.formLabelHeading.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => {Navigator.of(context).pop()},
                    child: Container(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: AppColor.gray600, width: 0.5)),
                      child: Text(
                        "Cancel",
                        style: AppStyle.formLabelHeading.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        {Navigator.of(context).pop(charges + currentAmount)},
                    child: Container(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: AppColor.gray600, width: 0.5)),
                      child: Text(
                        "Transfer",
                        style: AppStyle.formLabelHeading.copyWith(fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
