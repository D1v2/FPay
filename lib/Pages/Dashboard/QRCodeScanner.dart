import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Pages/services/payout/AddUpiId.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/app_style.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({Key? key}) : super(key: key);

  @override
  State<QRCodeScanner> createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String upiId = "";
  bool onScanned = true;
  File? _pickedImage;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => reassemble());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _buildQrView(context),
        Container(
          margin: const EdgeInsets.all(20),
          height: 100,
          width: 600,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
              Text(
                "Scan Any QR Code",
                style: AppStyle.normalLabelHeading.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller?.toggleFlash();
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          if (snapshot.data != true) {
                            return const Row(
                              children: [
                                Icon(
                                  Icons.flash_on,
                                  color: Colors.white,
                                ),
                              ],
                            );
                          }
                          return const Row(
                            children: [
                              Icon(
                                Icons.flash_off,
                                color: Colors.white,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const InkWell(
                    //  onTap: () => _pickImage(),
                    child: Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 180.0
        : 350.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: AppColor.lightBlue801,
          borderRadius: 5,
          borderLength: 20,
          borderWidth: 5,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  Future _onQRViewCreated(QRViewController controller) async {
    setState(() {
      this.controller = controller;
    });
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      if (onScanned == true) {
        result = scanData;
        setState(() {});
        upiId = extractUPIID(result?.code);
        onScanned = false;
        if (upiId != "") {
          Get.offNamed('/addUpiPayout', arguments: upiId);
        } else {
          DialogHelper.showToast("Invalid Qr Code");
          onScanned = true;
        }
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
      // _readQRCodeFromImage();
    }
  }

  Future<void> _readQRCodeFromImage() async {
    if (_pickedImage == null) {
      return;
    }
    // final result = await QrCodeToolsPlugin.decodeFrom(_pickedImage!.path);

    //  print("result -------- $result");

    // setState(() {
    //   this.result = Barcode(result.first.code, BarcodeFormat.qrcode, result.);
    //   //  this.result = Barcode(type: BarcodeFormat.qrcode, code: result.first.code);
    //   this.result =
    //       Barcode(type: BarcodeFormat.qrcode, code: result.first.code);
    // });
  }
}

String extractUPIID(String? qrCodeResult) {
  RegExp regExp = RegExp(r"upi://pay\?pa=([^&]+)");
  if (regExp.hasMatch(qrCodeResult!)) {
    var match = regExp.firstMatch(qrCodeResult);
    return Uri.decodeComponent(match!.group(1)!);
  }
  return "";
}
