import 'package:flutter/material.dart';

class PayoutScreenShot extends StatefulWidget {
  const PayoutScreenShot({Key? key}) : super(key: key);

  @override
  State<PayoutScreenShot> createState() => _PayoutScreenShotState();
}

class _PayoutScreenShotState extends State<PayoutScreenShot> {
  // final screenShotController = ScreenshotController();

  void _takeScreenShotController() async {
    //  final imageFile = await screenShotController.capture(pixelRatio: 3);
    //Share.shareFiles([imageFile!.path]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // margin: getMargin(all: 15),
          // child: Screenshot(
          //   controller: screenShotController,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
