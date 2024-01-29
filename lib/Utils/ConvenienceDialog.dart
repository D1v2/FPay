import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Utils/DialogHelper.dart';

import '../AppManager/ThemeColor.dart';


class ConvenienceFeeDialog extends StatelessWidget {
  const ConvenienceFeeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController amount = TextEditingController();
    return AlertDialog(
      title: Text(
        'Enter the convenience fee',
        style: TextStyle(fontWeight: FontWeight.w600, color: AppColor.black900),
      ),
      content: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 10),
        decoration: BoxDecoration(
            color: AppColor.whiteA700,
            border: Border.all(color: AppColor.gray600, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          maxLength: 6,
          controller: amount,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: 'Enter Amount',
              hintStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
              contentPadding: const EdgeInsets.all(10),
              counterText: '',
              prefixIconConstraints: const BoxConstraints(),
              prefixIcon: Container(
                  margin: const EdgeInsets.only(left: 15, right: 8),
                  child: const Icon(Icons.currency_rupee))),
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancel',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: AppColor.black900),
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Close the dialog without returning a value
          },
        ),
        TextButton(
          child: Text(
            'Confirm',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: AppColor.black900),
          ),
          onPressed: () {
            if (amount.value.text.isEmpty) {
              DialogHelper.showToast("Please enter the convenience fee");
            } else {
              Navigator.of(context).pop(amount.value.text);
            }
          },
        ),
      ],
    );
  }
}
