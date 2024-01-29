import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpay/Pages/Dashboard/Settings.dart';
import 'package:fpay/Pages/Dashboard/Support.dart';
import 'package:fpay/Pages/Dashboard/reports/Reports.dart';
import 'package:fpay/Utils/ImageConstant.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../Pages/Dashboard/Home.dart';
import 'app_style.dart';

GlobalKey<CurvedNavigationBarState> bottomNavigationKeyhome = GlobalKey();
final dashBoardScreens = [
  const Home(),
  const Reports(),
  const Settings(),
  const Support()
];

bottomItems(int pos) {
  final items = <Widget>[
    Container(
      alignment: Alignment.center,
      margin: pos != 0 ? const EdgeInsets.only(top: 18) : const EdgeInsets.only(top: 0),
      padding: pos == 0 ? const EdgeInsets.only(top: 10,bottom: 10) : const EdgeInsets.only(top: 0),
      child: Column(children: [
        ImageIcon(
          AssetImage(ImageConstant.bottomHomeIcon),
          color: Colors.white,
        ),
        pos != 0
            ? Flexible(
                child: Text(
                  "Home",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsMedium12.copyWith(fontSize: 10),
                ),
              )
            : Container()
      ]),
    ),
    Container(
      margin: pos != 1 ? const EdgeInsets.only(top: 18) : const EdgeInsets.only(top: 0),
      padding: pos == 1 ? const EdgeInsets.only(top: 10,bottom: 10) : const EdgeInsets.only(top: 0),
      alignment: Alignment.center,
      child: Column(
        children: [
          ImageIcon(
            AssetImage(ImageConstant.bottomReportIcon),
            color: Colors.white,
          ),
          pos != 1
              ? Flexible(
                  child: Text(
                    "Reports",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsMedium12.copyWith(fontSize: 10),
                  ),
                )
              : Container()
        ],
      ),
    ),
    Container(
      margin: pos != 2 ? const EdgeInsets.only(top: 18) : const EdgeInsets.only(top: 0),
      padding: pos == 2 ? const EdgeInsets.only(top: 10,bottom: 10) : const EdgeInsets.only(top: 0),
      alignment: Alignment.center,
      child: Column(
        children: [
          ImageIcon(
            AssetImage(ImageConstant.bottomSettingIcon),
            color: Colors.white,
          ),
          pos != 2
              ? Flexible(
                  child: Text(
                    "Settings",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsMedium12.copyWith(fontSize: 10),
                  ),
                )
              : Container()
        ],
      ),
    ),
    Container(
    margin: pos != 3 ? const EdgeInsets.only(top: 18) : const EdgeInsets.only(top: 0),
    padding: pos == 3 ? const EdgeInsets.only(top: 10,bottom: 10) : const EdgeInsets.only(top: 0),
      alignment: Alignment.center,
      child: Column(
        children: [
          ImageIcon(
            AssetImage(ImageConstant.bottomSupportIcon),
            color: Colors.white,
          ),
          pos != 3
              ? Flexible(
                  child: Text(
                    "Support",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtPoppinsMedium12.copyWith(fontSize: 10),
                  ),
                )
              : Container()
        ],
      ),
    ),
  ];
  return items;
}
