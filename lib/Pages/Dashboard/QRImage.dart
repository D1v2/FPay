import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerPage extends StatefulWidget {
  @override
  _QRCodeScannerPageState createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  File? _pickedImage;
  List<Barcode> _barcodes = [];

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
        _barcodes = [];
      });
      _readQRCode();
    }
  }

  Future<void> _readQRCode() async {
    if (_pickedImage == null) {
      return;
    }

    // final barcodes = await QRCodeToolsPlugin.decodeFrom(_pickedImage!.path);
    // setState(() {
    //   _barcodes = barcodes;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image from Gallery'),
            ),
            SizedBox(height: 20),
            _pickedImage != null
                ? Image.file(_pickedImage!, height: 200)
                : Text('No Image Selected'),
            SizedBox(height: 20),
            Text('Detected QR Codes:'),
           // for (var barcode in _barcodes)
             // Text(barcode.code),
          ],
        ),
      ),
    );
  }
}