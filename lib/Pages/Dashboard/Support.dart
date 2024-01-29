import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../../AppManager/ThemeColor.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';
import '../Help/GenerateTicketHistory.dart';
import 'Notification.dart';
import 'SideMenu.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      key: scaffoldKey,
      backgroundColor: Colors.white60,
      extendBody: true,
      endDrawer: const SideMenu(),
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: AppDecoration.mainGradient.copyWith(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Align(
            child: InkWell(
              child: CommonImageView(
                svgPath: ImageConstant.mainNotificationIcon,
                height: 34.00,
                width: 34.00,
              ),
              onTap: () {
                goToNotification();
              },
            ),
          ),
        ),
        title: Text("Support",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Align(
              child: InkWell(
                child: CommonImageView(
                  svgPath: ImageConstant.menuIcon,
                  height: 16.00,
                  width: 20.00,
                ),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 14,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    decoration: AppDecoration.fillGray50.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder9,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () {
                            goToGenerateTicket();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              top: 22,
                              bottom: 22,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  ImageConstant.ticketIcon,
                                  height: 20,
                                  width: 20,
                                  color: AppColor.blue500,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 14,
                                    top: 3,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "Generate Ticket",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14Gray800
                                        .copyWith(
                                      height: 1.00,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25,
                            right: 30,
                            bottom: 25,
                          ),
                          child: SvgPicture.asset(
                            ImageConstant.moveIconForward,
                            height: 18,
                            width: 12,
                            color: AppColor.blue500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      UrlLauncher.launch('tel:+91 8090901004');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 24,
                        right: 24,
                      ),
                      decoration: AppDecoration.fillGray50.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder9,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              top: 22,
                              bottom: 22,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  ImageConstant.helplineIcon,
                                  height: 20,
                                  width: 20,
                                  color: AppColor.blue500,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 14,
                                    top: 3,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "Helpline No",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14Gray800
                                        .copyWith(
                                      height: 1.00,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 25,
                              right: 30,
                              bottom: 25,
                            ),
                            child: SvgPicture.asset(
                              ImageConstant.moveIconForward,
                              height: 18,
                              width: 12,
                              color: AppColor.blue500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      UrlLauncher.launch('mailto:support@fpay.net.in');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 24,
                        right: 24,
                      ),
                      decoration: AppDecoration.fillGray50.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder9,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 22,
                              top: 22,
                              bottom: 22,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  ImageConstant.emailIcon,
                                  height: 20,
                                  width: 20,
                                  color: AppColor.blue500,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 14,
                                    top: 3,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "Email ID",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14Gray800
                                        .copyWith(
                                      height: 1.00,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 25,
                              right: 30,
                              bottom: 25,
                            ),
                            child: SvgPicture.asset(
                              ImageConstant.moveIconForward,
                              height: 18,
                              width: 12,
                              color: AppColor.blue500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10, left: 24, right: 24),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 8, bottom: 8),
                    width: size.width,
                    decoration: AppDecoration.fillGray50.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder9,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _launchURL(
                                "https://www.youtube.com/channel/UCRpgZiFN-purRQV5bkC1gFQ");
                          },
                          child: CustomIconButton(
                            height: 60,
                            width: 60,
                            child: CommonImageView(
                              imagePath: ImageConstant.youtubeIcon,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _launchURL("https://www.facebook.com/Fpay012/");
                          },
                          child: CustomIconButton(
                            height: 60,
                            width: 60,
                            child: CommonImageView(
                              imagePath: ImageConstant.fbIcon,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _launchURL("https://twitter.com/FPay12");
                          },
                          child: CustomIconButton(
                            height: 60,
                            width: 60,
                            child: CommonImageView(
                              imagePath: ImageConstant.twitterIcon,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _launchURL("https://www.instagram.com/f_pay012/");
                          },
                          child: CustomIconButton(
                            height: 60,
                            width: 60,
                            child: CommonImageView(
                              imagePath: ImageConstant.instaIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void goToNotification() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationPage()),
    );
  }

  void goToGenerateTicket() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GenerateTicketHistory()),
    );
  }

  _launchURL(String url) async {
    UrlLauncher.launch(url);
  }
}
