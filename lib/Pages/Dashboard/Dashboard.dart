import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import '../../Utils/constants.dart';
import 'SideMenu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: AppColor.blue500,
      statusBarColor: AppColor.lightBlue800,
    ));
    return WillPopScope(
      onWillPop: () async {
        return _onExitPopup(context);
      },
      child: SafeArea(
        child: Scaffold(
          endDrawerEnableOpenDragGesture: false,
          key: scaffoldKey,
          endDrawer: const SideMenu(),
          extendBody: true,
          body: dashBoardScreens[currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              key: bottomNavigationKeyhome,
              animationCurve: Curves.easeInOut,
              color: AppColor.blue500,
              height: 60.0,
              buttonBackgroundColor: Colors.blue,
              items: bottomItems(currentIndex),
              onTap: (index) => setState(() {
                    currentIndex = index;
                  })),
        ),
      ),
    );
  }

  Future<bool> _onExitPopup(BuildContext context) async {
    return DialogHelper().exitDialog(context) ?? false;
  }
}
