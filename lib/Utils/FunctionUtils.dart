import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Pages/Dashboard/Dashboard.dart';

bool isIfscCode(String code) {
  String pattern = '^[A-Z]{4}0[A-Z0-9]{6}\$';
  RegExp regExp = RegExp(pattern);
  if (code.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(code)) {
    return false;
  }
  return true;
}

bool isMobileNumber(String number) {
  String pattern = "[6-9]{1}[0-9]{9}\$";
  RegExp regExp = RegExp(pattern);
  if (number.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(number)) {
    return false;
  }
  return true;
}

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))';
  RegExp regExp = RegExp(p);
  if (em.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(em)) {
    return false;
  }
  return true;
}

bool isUpiId(String value) {
  String pattern = '[a-zA-Z0-9\\.\\-]{2,256}\\@[a-zA-Z][a-zA-Z]{2,64}';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

bool isAccountNumber(String value) {
  String pattern = '[0-9]{9,18}';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

bool isCreditCard(String value) {
  String pattern = '^[0-9]{13,19}\$';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

bool isAadhaarCard(String value) {
  String pattern = r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

bool isPanCard(String value) {
  String pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

String validateDrivingLicense(String value) {
  String pattern =
      r'^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please Enter DrivingLicense ID';
  } else if (!regExp.hasMatch(value)) {
    return 'Please Enter Valid DrivingLicense ID';
  }
  return "";
}

bool isJsonFormat(String jsonString) {
  try {
    jsonDecode(jsonString) as Map<String, dynamic>;
    return true;
  } catch (e) {
    return false;
  }
}

dynamic convertedStringToJson(String jsonString) {
  return jsonDecode(jsonString) as Map<String, dynamic>;
}

bool? validatePassword(String value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return false;
  } else {
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
}

bool validValue(String value, String regx) {
  RegExp regex = RegExp(regx);
  if (value.isEmpty) {
    return false;
  } else {
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
}

String formatDate(String? date) {
  if (date == null) {
    return "NA";
  } else {
    final DateTime docDateTime = DateTime.parse(date);
    return DateFormat("dd MMMM yyyy, h:mm:ss a").format(docDateTime);
  }
}

String formatTime(String? date) {
  if (date == null) {
    return "NA";
  } else {
    final DateTime docDateTime = DateTime.parse(date);
    return DateFormat("h:mm a").format(docDateTime);
  }
}

goWithTo(String path) {
  Get.toNamed(path);
}

void goToHome(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const Dashboard()),
  );
}

/*void savePdf(Uint8List pdfBytes, String filename) async {
  var directory;
  PermissionStatus status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  } else if (status.isDenied || status.isPermanentlyDenied) {
    await openAppSettings();
  } else {
    if (Platform.isIOS) {
      directory = await getDownloadsDirectory();
    } else {
      directory = Directory("/storage/emulated/0/FPay");
      if (!await directory.exists()) {
        await Directory(directory.path)
            .create(recursive: true)
            .then((value) {});
      }
    }
    final file = File(directory.path + "/$filename.pdf");
    if (!await file.exists()) {
      file.create(recursive: true);
    }
    if (file.existsSync()) {
      await file.writeAsBytes(pdfBytes.toList());
      DialogHelper.showToast("Pdf downloaded successfully...");
    } else {
      var files =
          await File(directory.path + "/$filename.pdf").create(recursive: true);
      await files.writeAsBytes(pdfBytes.toList());
      DialogHelper.showToast("Pdf downloaded successfully...");
    }
  }
}*/

// void savePdf(Uint8List pdfBytes, String filename) async {
//   PermissionStatus status = await Permission.storage.status;
//
//   if (!status.isGranted) {
//     // Request storage permission
//     status = await Permission.storage.request();
//   }
//
//   if (status.isGranted) {
//     // Storage permission granted
//     var directory;
//     if (Platform.isIOS) {
//       directory = await getDownloadsDirectory();
//     } else {
//       directory = Directory("/storage/emulated/0/FPay");
//       if (!await directory.exists()) {
//         await Directory(directory.path).create(recursive: true);
//       }
//     }
//
//     final file = File('${directory.path}/$filename.pdf');
//
//     // Create file if it does not exist
//     if (!await file.exists()) {
//       await file.create(recursive: true);
//     }
//
//     if (file.existsSync()) {
//       // Write PDF bytes to file
//       await file.writeAsBytes(pdfBytes.toList());
//       DialogHelper.showToast("PDF downloaded successfully...");
//     } else {
//       // Create the file and write PDF bytes to it
//       var createdFile = await File('${directory.path}/$filename.pdf').create(recursive: true);
//       await createdFile.writeAsBytes(pdfBytes.toList());
//       DialogHelper.showToast("PDF downloaded successfully...");
//     }
//   } else if (status.isPermanentlyDenied) {
//     // The user permanently denied the permission, open app settings
//     await openAppSettings();
//   } else {
//     // The user denied the permission, handle it accordingly
//     DialogHelper.showToast("Permission denied to save PDF");
//   }
// }

Map<String, dynamic> imageArray = {
  '0': ImageConstant.Id29,
  '1': ImageConstant.Id1,
  '2': ImageConstant.Id2,
  '3': ImageConstant.Id3,
  '4': ImageConstant.Id4,
  '5': ImageConstant.Id5,
  '6': ImageConstant.Id6,
  '8': ImageConstant.Id8,
  '9': ImageConstant.Id9,
  '10': ImageConstant.Id10,
  '11': ImageConstant.Id11,
  '12': ImageConstant.Id12,
  '13': ImageConstant.Id13,
  '14': ImageConstant.Id14,
  '15': ImageConstant.Id10,
  '16': ImageConstant.Id16,
  '17': ImageConstant.Id17,
  '18': ImageConstant.Id18,
  '19': ImageConstant.Id19,
  '20': ImageConstant.Id20,
  '21': ImageConstant.Id21,
  '23': ImageConstant.Id23,
  '24': ImageConstant.Id24,
  '25': ImageConstant.Id25,
  '26': ImageConstant.Id26,
  '27': ImageConstant.Id27,
  '29': ImageConstant.Id29,
  '30': ImageConstant.Id30,
  '31': ImageConstant.Id31,
  '32': ImageConstant.Id32,
  '33': ImageConstant.Id33,
  '34': ImageConstant.Id34,
  '35': ImageConstant.Id35,
  '36': ImageConstant.Id36,
  '39': ImageConstant.Id39,
  '40': ImageConstant.Id40,
  '41': ImageConstant.Id41,
  '44': ImageConstant.Id21,
  '48': ImageConstant.Id48,
  '54': ImageConstant.Id48,
  '55': ImageConstant.Id48,
};
