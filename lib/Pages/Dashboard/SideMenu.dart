import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fpay/Pages/Dashboard/settlement/BankList.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/PreferenceManager.dart';
import 'package:get/get.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../Profile/MyProfile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerRight,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: size.width * 0.88,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: CommonImageView(
                        imagePath: ImageConstant.drawerImage,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(
                          left: 14, right: 14, bottom: 1, top: 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 272,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: AppColor.whiteA700,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 15.0),
                                  height: 62.00,
                                  width: 62.00,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: const EdgeInsets.all(0),
                                    color: AppColor.gray400,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: AppColor.whiteA700,
                                        width: 1.00,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        31.43,
                                      ),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              31.43,
                                            ),
                                            child: CommonImageView(
                                              imagePath:
                                                  ImageConstant.imgImage70,
                                              height: 63.00,
                                              width: 62.00,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: SizedBox(
                                            height: 63.00,
                                            width: 62.00,
                                            child: Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      31.43,
                                                    ),
                                                    child: CommonImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle415863X62,
                                                      height: 63.00,
                                                      width: 62.00,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      31.50,
                                                    ),
                                                    child: CommonImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle4158,
                                                      height: 63.00,
                                                      width: 62.00,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: 20,
                                      top: 0,
                                      bottom: 13,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 10,
                                          ),
                                          child: Text(
                                            PreferenceManager.getName(),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                            maxLines: 1,
                                            style: AppStyle.txtPoppinsRegular22
                                                .copyWith(),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 0,
                                          ),
                                          child: Text(
                                            PreferenceManager.getEmail(),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                            maxLines: 1,
                                            style: AppStyle.txtPoppinsRegular16
                                                .copyWith(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => gotoHome(),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                  left: 77, top: 20, right: 77),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonImageView(
                                    imagePath: ImageConstant.homeIcon,
                                    height: 18.00,
                                    width: 18.00,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        top: 8,
                                        bottom: 2,
                                      ),
                                      child: Text(
                                        "Home",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        softWrap: true,
                                        maxLines: 1,
                                        style: AppStyle.txtPoppinsRegular16
                                            .copyWith(
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => gotoProfile(),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                left: 77,
                                top: 26,
                                right: 77,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonImageView(
                                    imagePath: ImageConstant.profileIcon,
                                    height: 18.00,
                                    width: 18.00,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        top: 8,
                                        bottom: 2,
                                      ),
                                      child: Text(
                                        "My profile",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        softWrap: true,
                                        maxLines: 1,
                                        style: AppStyle.txtPoppinsRegular16
                                            .copyWith(
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PreferenceManager.getMemberTypeId() == "7"
                              ? Container()
                              : InkWell(
                                  onTap: () => {
                                    Get.toNamed("/fundRequestList")
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                      left: 77,
                                      top: 26,
                                      // right: 77,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CommonImageView(
                                          imagePath:
                                              ImageConstant.paymentHistoryIcon,
                                          height: 18.00,
                                          width: 18.00,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 15,
                                              top: 8,
                                              bottom: 2,
                                            ),
                                            child: Text(
                                              "Fund Request Approved",
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              maxLines: 1,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular16
                                                  .copyWith(
                                                height: 1.00,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          InkWell(
                            onTap: () => selfSettlement(),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                left: 77,
                                top: 26,
                                // right: 77,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonImageView(
                                    imagePath: ImageConstant.paymentHistoryIcon,
                                    height: 18.00,
                                    width: 18.00,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        top: 8,
                                        bottom: 2,
                                      ),
                                      child: Text(
                                        "Self Settlement",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        softWrap: true,
                                        maxLines: 1,
                                        style: AppStyle.txtPoppinsRegular16
                                            .copyWith(
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PreferenceManager.getMemberTypeId() == "7"
                              ? Container()
                              : InkWell(
                                  onTap: () => gotoPaymentHistory(),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                      left: 77,
                                      top: 26,
                                      // right: 77,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CommonImageView(
                                          imagePath:
                                              ImageConstant.paymentHistoryIcon,
                                          height: 18.00,
                                          width: 18.00,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 15,
                                              top: 8,
                                              bottom: 2,
                                            ),
                                            child: Text(
                                              "Add Member",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              softWrap: true,
                                              maxLines: 1,
                                              style: AppStyle
                                                  .txtPoppinsRegular16
                                                  .copyWith(
                                                height: 1.00,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          PreferenceManager.getMemberTypeId() == "7"
                              ? Container()
                              : InkWell(
                                  onTap: () => gotoPaymentHistory(),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                      left: 77,
                                      top: 26,
                                      // right: 77,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CommonImageView(
                                          imagePath:
                                              ImageConstant.paymentHistoryIcon,
                                          height: 18.00,
                                          width: 18.00,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 15,
                                              top: 8,
                                              bottom: 2,
                                            ),
                                            child: Text(
                                              "My Down line",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              softWrap: true,
                                              maxLines: 1,
                                              style: AppStyle
                                                  .txtPoppinsRegular16
                                                  .copyWith(
                                                height: 1.00,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          PreferenceManager.getMemberTypeId() == "7"
                              ? Container()
                              : InkWell(
                                  onTap: () => gotoPaymentHistory(),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                      left: 77,
                                      top: 26,
                                      // right: 77,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CommonImageView(
                                          imagePath:
                                              ImageConstant.paymentHistoryIcon,
                                          height: 18.00,
                                          width: 18.00,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 15,
                                              top: 8,
                                              bottom: 2,
                                            ),
                                            child: Text(
                                              "Outstanding",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              softWrap: true,
                                              maxLines: 1,
                                              style: AppStyle
                                                  .txtPoppinsRegular16
                                                  .copyWith(
                                                height: 1.00,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          PreferenceManager.getMemberTypeId() != "7"
                              ? Container()
                              : InkWell(
                                  onTap: () => gotoNotification(),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                      left: 77,
                                      top: 26,
                                      right: 77,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CommonImageView(
                                          svgPath:
                                              ImageConstant.notificationIcon,
                                          height: 18.00,
                                          width: 18.00,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 15,
                                              top: 8,
                                              bottom: 2,
                                            ),
                                            child: Text(
                                              "Notification",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              softWrap: true,
                                              maxLines: 1,
                                              style: AppStyle
                                                  .txtPoppinsRegular16
                                                  .copyWith(
                                                height: 1.00,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          InkWell(
                            onTap: () => gotoQrcode(),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                left: 77,
                                top: 26,
                                right: 77,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonImageView(
                                    imagePath: ImageConstant.qrCodeIcon,
                                    height: 18.00,
                                    width: 18.00,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        top: 8,
                                        bottom: 2,
                                      ),
                                      child: Text(
                                        "My Commission",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        softWrap: true,
                                        maxLines: 1,
                                        style: AppStyle.txtPoppinsRegular16
                                            .copyWith(
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => gotoselect(),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                left: 77,
                                top: 26,
                                // right: 77,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonImageView(
                                    imagePath: ImageConstant.cartIcon,
                                    height: 18.00,
                                    width: 18.00,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        top: 8,
                                        bottom: 2,
                                      ),
                                      child: Text(
                                        "Orders & Booking",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        softWrap: true,
                                        style: AppStyle.txtPoppinsRegular16
                                            .copyWith(
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => signOut(),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 50, bottom: 50),
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColor.whiteA7004c,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonImageView(
                                    svgPath: ImageConstant.signOutIcon,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "SignOut",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: AppColor.whiteA700,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Center(
                                  child: Text(
                                "V 1.0.1",
                                style: AppStyle.normalLabelHeading.copyWith(
                                    fontSize: 14, color: AppColor.whiteA700),
                              )))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  selfSettlement() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BankList()),
    );
  }

  gotoHome() {
    DialogHelper.showToast(" Not Working on Testing Mode");
    // Get.toNamed(AppRoutes.home);
  }

  gotoPaymentHistory() {
    DialogHelper.showToast(" Not Working on Testing Mode");
    //Get.toNamed(AppRoutes.history);
  }

  gotoProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyProfile()),
    );
  }

  gotoNotification() {
    DialogHelper.showToast(" Not Working on Testing Mode");
    /*
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationPage()),
    );*/
  }

  gotoQrcode() {
    DialogHelper.showToast(" Not Working on Testing Mode");
    //Get.offAndToNamed(AppRoutes.scanbarcode);
    // Get.back();
    // Get.offAndToNamed(AppRoutes.mybarcode);
  }

  gotoAdd() {
    DialogHelper.showToast(" Not Working on Testing Mode");
    // Get.offAndToNamed(AppRoutes.paynow);
    // Get.offAndToNamed(AppRoutes.addpayment);
  }

  gotoselect() {
    DialogHelper.showToast(" Not Working on Testing Mode");
    // Get.offAndToNamed(AppRoutes.selectpayment);
    // Get.offAndToNamed(AppRoutes.security);
  }

  Future<void> signOut() async {
    DialogHelper.logOutDialog(context);
  }
}
