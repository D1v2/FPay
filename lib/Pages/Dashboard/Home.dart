import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpay/Network/Models/BalanceResponse.dart';
import 'package:fpay/Network/Models/HomeIconsResponse.dart';
import 'package:fpay/Pages/Dashboard/QRCodeScanner.dart';
import 'package:fpay/Pages/Dashboard/QrCode.dart';
import 'package:fpay/Pages/Dashboard/SideMenu.dart';
import 'package:fpay/Pages/services/payout/BanksList.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:fpay/Utils/FunctionUtils.dart';
import 'package:fpay/Utils/PreferenceManager.dart';
import 'package:get/get.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Network/Controllers/ProfileController.dart';
import '../../Network/Models/ProfileResponse.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/custom_icon_button.dart';
import '../../Utils/math_utils.dart';
import 'fundRequest/FundRequest.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final controller = ProfileController();
  ProfileResponse? res;
  HomeIconsResponse? homeIconsResponse;
  bool isBalanceVisible = false;
  bool isFinancialServiceMore = false;
  bool isOtherServiceMore = false;
  BalanceResponse? balanceResponse;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => getData());
    //  PinEncryption().getPin("pin");
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      key: scaffoldKey,
      endDrawer: const SideMenu(),
      extendBody: true,
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 20),
            width: size.width,
            decoration: AppDecoration.gradientLightblue800Blue500.copyWith(
              borderRadius: BorderRadiusStyle.customBorderBL30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 40.00,
                            width: 40.00,
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
                                  35.00,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    25.00,
                                  ),
                                  child: CommonImageView(
                                    imagePath: ImageConstant.imgRectangle4158,
                                    height: 60.00,
                                    width: 50.00,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              children: [
                                Text(
                                  PreferenceManager.getName(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  style: AppStyle.txtPoppinsRegular18
                                      .copyWith(fontSize: 14),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 7),
                                  child: Text(
                                    PreferenceManager.getEmail(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    style:
                                        AppStyle.txtPoppinsRegular12.copyWith(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: InkWell(
                          onTap: () =>
                              scaffoldKey.currentState!.openEndDrawer(),
                          child: CommonImageView(
                            svgPath: ImageConstant.menuIcon,
                            height: 15.00,
                            width: 20.00,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 190,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 150,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: AppColor.blue500.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.account_balance_wallet,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "F-Pay\nBalance",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10,
                                            color: AppColor.whiteA700),
                                      ),
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isBalanceVisible = true;
                                      currentBalance();
                                    });
                                  },
                                  child: !isBalanceVisible
                                      ? Text(
                                          "View Balance",
                                          style: AppStyle.txtPoppinsBold18
                                              .copyWith(fontSize: 12),
                                        )
                                      : Text(
                                          "₹ ${balanceResponse?.balance ?? 0}",
                                          style: AppStyle.txtPoppinsBold18
                                              .copyWith(),
                                        ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      goToBankTransfer();
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100)),
                                              color: AppColor.lightBlue801
                                                  .withOpacity(1.0)),
                                          child: CommonImageView(
                                            svgPath: ImageConstant.uploadIcon,
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            child: const Text("Send",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white))),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      qrCodeScanner();
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100)),
                                              color: AppColor.lightBlue801
                                                  .withOpacity(1.0)),
                                          child: CommonImageView(
                                            svgPath: ImageConstant.scannerIcon,
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            child: const Text("Scan",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white))),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () => qrCode(),
                                        child: Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100)),
                                              color: AppColor.lightBlue801
                                                  .withOpacity(1.0)),
                                          child: CommonImageView(
                                            svgPath: ImageConstant.historyIcon,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(top: 5),
                                          child: const Text("Receive",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white))),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          margin: const EdgeInsets.only(left: 50, right: 50),
                          decoration: BoxDecoration(
                              color: AppColor.greenA400,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          child: InkWell(
                            onTap: () {
                              goToFundRequest();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle_outline,
                                  color: AppColor.whiteA700,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Fund Request",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: AppColor.whiteA700,
                                        fontSize: (13),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 20, bottom: 15, top: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Text(
                              "All Offers",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsSemiBold18
                                  .copyWith(fontSize: 14),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8, right: 10),
                            child: Text(
                              "Many offers waiting for you, get it now",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular14Gray800
                                  .copyWith(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.only(right: 10, bottom: 25, left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 130.00,
                          width: 280.00,
                          margin: const EdgeInsets.only(left: 1, right: 10),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10.00,
                                  ),
                                  child: CommonImageView(
                                    imagePath: ImageConstant.banner,
                                    height: 130.00,
                                    width: 280.00,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 130.00,
                          width: 280.00,
                          margin: const EdgeInsets.only(left: 1, right: 10),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10.00,
                                  ),
                                  child: CommonImageView(
                                    imagePath: ImageConstant.banner1,
                                    height: 130.00,
                                    width: 280.00,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (homeIconsResponse?.data != null) services(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget services() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: homeIconsResponse?.data?.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
                decoration: AppDecoration.fillGray50.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        homeIconsResponse?.data?[index].heading ?? "NA",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsSemiBold18
                            .copyWith(fontSize: 14),
                      ),
                    ),
                    homeIconsResponse!.data![index].heading ==
                            "Financial Services"
                        ? Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 10),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      childAspectRatio: (1 / 1.2),
                                      crossAxisSpacing: 13.0,
                                      mainAxisSpacing: 10.0),
                              itemBuilder: (context, index1) {
                                if (isFinancialServiceMore) {
                                  return InkWell(
                                    onTap: () {
                                      goToServices(homeIconsResponse!
                                          .data![index].data![index1]);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                            ),
                                            child: imageArray[homeIconsResponse!
                                                        .data![index]
                                                        .data![index1]
                                                        .id!] !=
                                                    null
                                                ? SvgPicture.asset(imageArray[
                                                    homeIconsResponse!
                                                        .data![index]
                                                        .data![index1]
                                                        .id!])
                                                : Icon(
                                                    Icons.image,
                                                    color: AppColor.gray600,
                                                  )),
                                        Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          child: Text(
                                            homeIconsResponse!.data![index]
                                                .data![index1].showServices!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: AppStyle.formLabelHeading
                                                .copyWith(
                                                    fontSize: 12,
                                                    color: AppColor.gray600),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                } else {
                                  if (index1 != 3) {
                                    return InkWell(
                                      onTap: () {
                                        goToServices(homeIconsResponse!
                                            .data![index].data![index1]);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(10),
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                              ),
                                              child: imageArray[
                                                          homeIconsResponse!
                                                              .data![index]
                                                              .data![index1]
                                                              .id!] !=
                                                      null
                                                  ? SvgPicture.asset(imageArray[
                                                      homeIconsResponse!
                                                          .data![index]
                                                          .data![index1]
                                                          .id!])
                                                  : Icon(
                                                      Icons.image,
                                                      color: AppColor.gray600,
                                                    )),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 8),
                                            child: Text(
                                              homeIconsResponse!.data![index]
                                                  .data![index1].showServices!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: AppStyle.formLabelHeading
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color: AppColor.gray600),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  } else {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          isFinancialServiceMore = true;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(10),
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                              ),
                                              child: SvgPicture.asset(
                                                  ImageConstant.seeAllIcon)),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 8),
                                            child: Text(
                                              "See More",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: AppStyle.formLabelHeading
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color: AppColor.gray600),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                }
                              },
                              itemCount: isFinancialServiceMore
                                  ? homeIconsResponse!.data![index].data!.length
                                  : 4,
                              shrinkWrap: true,
                              physics:
                                  const NeverScrollableScrollPhysics(), // use it
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 10),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      childAspectRatio: (1 / 1.2),
                                      crossAxisSpacing: 13.0,
                                      mainAxisSpacing: 10.0),
                              itemBuilder: (context, index1) {
                                if (isOtherServiceMore) {
                                  return InkWell(
                                    onTap: () {
                                      goToServices(homeIconsResponse!
                                          .data![index].data![index1]);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                            ),
                                            child: imageArray[homeIconsResponse!
                                                        .data![index]
                                                        .data![index1]
                                                        .id!] !=
                                                    null
                                                ? SvgPicture.asset(imageArray[
                                                    homeIconsResponse!
                                                        .data![index]
                                                        .data![index1]
                                                        .id!])
                                                : Icon(
                                                    Icons.image,
                                                    color: AppColor.gray600,
                                                  )),
                                        Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          child: Text(
                                            homeIconsResponse!.data![index]
                                                .data![index1].showServices!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: AppStyle.formLabelHeading
                                                .copyWith(
                                                    fontSize: 12,
                                                    color: AppColor.gray600),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                } else {
                                  if (index1 != 7) {
                                    return InkWell(
                                      onTap: () {
                                        goToServices(homeIconsResponse!
                                            .data![index].data![index1]);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(10),
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                              ),
                                              child: imageArray[
                                                          homeIconsResponse!
                                                              .data![index]
                                                              .data![index1]
                                                              .id!] !=
                                                      null
                                                  ? SvgPicture.asset(imageArray[
                                                      homeIconsResponse!
                                                          .data![index]
                                                          .data![index1]
                                                          .id!])
                                                  : Icon(
                                                      Icons.image,
                                                      color: AppColor.gray600,
                                                    )),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              homeIconsResponse!.data![index]
                                                  .data![index1].showServices!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: AppStyle.formLabelHeading
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color: AppColor.gray600),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  } else {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          isOtherServiceMore = true;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(10),
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                              ),
                                              child: SvgPicture.asset(
                                                  ImageConstant.seeAllIcon)),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 8),
                                            child: Text(
                                              "See More",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: AppStyle.formLabelHeading
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color: AppColor.gray600),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                }
                              },
                              itemCount: isOtherServiceMore
                                  ? homeIconsResponse!.data![index].data!.length
                                  : homeIconsResponse!
                                              .data![index].data!.length >
                                          8
                                      ? 8
                                      : homeIconsResponse!
                                          .data![index].data!.length,
                              shrinkWrap: true,
                              physics:
                                  const NeverScrollableScrollPhysics(), // use it
                            ),
                          )
                    //   getMainItem(homeIconsResponse!.data![index].data!)
                  ],
                ),
              ),
              index == 0
                  ? CustomIconButton(
                      height: 30,
                      width: 30,
                      variant: IconButtonVariant.GradientLightblue800Blue500,
                      shape: IconButtonShape.CircleBorder15,
                      padding: IconButtonPadding.PaddingAll8,
                      alignment: Alignment.topCenter,
                      child: CommonImageView(
                        imagePath: ImageConstant.tooMoveIcon,
                      ),
                    )
                  : Container()
            ],
          );
        });
  }

  goToFundRequest() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FundRequest()),
    );
  }

  qrCodeScanner() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QRCodeScanner()),
    );
  }

  qrCode() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QrCode()),
    );
  }

  goToBankTransfer() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BankList(
                serviceId: "25",
              )),
    );
  }

  getData() async {
    final body1 = {};
    var homeData = await controller.homeIcons(body1);
    setState(() {
      homeIconsResponse = HomeIconsResponse.fromJson(homeData);
    });
  }

  goToServices(HomeIconsData data) {
    if (data.groupName == "BBPS") {
      Get.toNamed('/baseBBPS', arguments: data);
    } else if (data.groupName == "Aeps") {
      Get.toNamed('/aeps');
    } else if (data.groupName == "Payout") {
      if (data.id == "25" || data.id == "26") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BankList(serviceId: data.id.toString())),
        );
      } else if (data.id == "27") {
        Get.toNamed('/creditCard');
      } else {
        DialogHelper.showToast("Coming Soon.....");
      }
    } else if (data.groupName == "DMR") {
      Get.toNamed('/checkNumber', arguments: data);
    } else if (data.groupName == "Recharge") {
      Get.toNamed('/recharge', arguments: data);
    } else if (data.groupName == "Credit Card Payment") {
      //  Get.toNamed('/matm');
    } else if (data.groupName == "Travel") {
      //DialogHelper.showToast("Coming Soon.....");
      if (data.id == "41") {
        //  Get.toNamed('/hotelDashboard');
      } else if (data.id == "39") {
        Get.toNamed('/busDashboard');
      } else {
        DialogHelper.showToast("Coming Soon.....");
      }
    } else if (data.groupName == "MATM") {
      Get.toNamed('/matm', arguments: data.id == "54" ? 1 : 0);
    } else if (data.id == "44") {
      Get.toNamed('/aepsPro');
    } else {
      DialogHelper.showToast("Coming Soon.....");
    }
  }

  void currentBalance() async {
    var body = {};
    var jsonBody = await controller.currentBalance(body);
    setState(() {
      balanceResponse = BalanceResponse.fromJson(jsonBody);
      _viewBalance();
    });
  }

  _viewBalance() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isBalanceVisible = false;
      });
    });
  }
}
