import 'package:flutter/material.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/PreferenceManager.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  void _navigateHome() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    if (PreferenceManager.isLogin()) {
      Get.toNamed('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height / 1.8,
              child: Image.asset(
                ImageConstant.splash_icon,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      ImageConstant.splash_logo,
                    ),
                    Container(
                      margin: getMargin(left: 20, top: 10, right: 20),
                      child: Text(
                        "Effortless transactions, now at your fingertips.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColor.gray600,
                          fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        clickGo();
                      },
                      child: Container(
                        margin: getMargin(top: 20),
                        child: Image.asset(ImageConstant.splash_go_icon),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: getMargin(top: 30),
              child: Image.asset(ImageConstant.splash_cer_image),
            ),
          ],
        ),
      ),
    );
  }

  clickGo() {
    if (PreferenceManager.isLogin() == false) {
      Get.offNamed("/login");
    }
  }
}
