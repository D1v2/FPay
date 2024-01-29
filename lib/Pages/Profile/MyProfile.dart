import 'package:flutter/material.dart';
import 'package:fpay/Network/Models/ProfileResponse.dart';
import 'package:fpay/Pages/Profile/EditProfile.dart';
import 'package:get/get.dart';

import '../../AppManager/ThemeColor.dart';
import '../../Network/Controllers/ProfileController.dart';
import '../../Network/Models/ProfileData.dart';
import '../../Utils/ImageConstant.dart';
import '../../Utils/app_decoration.dart';
import '../../Utils/app_style.dart';
import '../../Utils/common_image_view.dart';
import '../../Utils/math_utils.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final controller = ProfileController();
  ProfileResponse? res;
  ProfileData? profileData;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => getData());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              decoration: AppDecoration.gradientLightblue800Blue500.copyWith(
                borderRadius: BorderRadiusStyle.customBorderBL30,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: size.width,
                    margin: const EdgeInsets.only(
                      left: 10,
                      top: 1,
                      right: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColor.whiteA700,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 7,
                            bottom: 8,
                          ),
                          child: Text(
                            "Profile",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                AppStyle.txtPoppinsMedium20Gray101.copyWith(),
                          ),
                        ),
                        GestureDetector(
                          // onTap: () => {gotoNotification()},
                          child: CommonImageView(
                            svgPath: ImageConstant.mainNotificationIcon,
                            height: 34.00,
                            width: 34.00,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      top: 15,
                      right: 24,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 63.00,
                              width: 62.00,
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                margin: const EdgeInsets.all(0),
                                color: AppColor.gray400,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: AppColor.whiteA700,
                                    width: getHorizontalSize(
                                      1.00,
                                    ),
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
                                          imagePath: ImageConstant.imgImage70,
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
                                              alignment: Alignment.centerLeft,
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
                                              alignment: Alignment.centerLeft,
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
                            Container(
                              margin: const EdgeInsets.only(
                                left: 16,
                                top: 7,
                                bottom: 6,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    profileData?.name ?? 'NA',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtPoppinsRegular22.copyWith(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      right: 8,
                                    ),
                                    child: Text(
                                      "+91 ${profileData?.mobile ?? 'NA'}",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular16
                                          .copyWith(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          //  onTap: () => editProfile(),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 1,
                              bottom: 42,
                            ),
                            child: CommonImageView(
                              svgPath: ImageConstant.editIcon,
                              height: 18.00,
                              width: 16.00,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                      ),
                      decoration: AppDecoration.fillGray50.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder9,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 22,
                              right: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "Email",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsMedium14Gray804
                                        .copyWith(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 100,
                                    top: 1,
                                  ),
                                  child: Text(
                                    profileData?.email ?? 'NA',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular12Gray500
                                        .copyWith(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1.00,
                            width: 287.00,
                            margin: const EdgeInsets.only(
                              left: 20,
                              top: 20,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.gray60067,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 21,
                              right: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Phone Number",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsMedium14Gray804
                                      .copyWith(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "+91 ${profileData?.mobile ?? 'NA'}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular12Gray500
                                        .copyWith(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1.00,
                            width: 287.00,
                            margin: const EdgeInsets.only(
                              left: 20,
                              top: 20,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.gray60067,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 20,
                              right: 19,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "DOB".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsMedium14Gray804
                                        .copyWith(),
                                  ),
                                ),
                                Text(
                                  profileData?.dob ?? 'NA',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray500
                                      .copyWith(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1.00,
                            width: 287.00,
                            margin: const EdgeInsets.only(
                              left: 20,
                              top: 18,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.gray60067,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 23,
                              right: 19,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "City".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsMedium14Gray800
                                      .copyWith(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 1,
                                    bottom: 2,
                                  ),
                                  child: Text(
                                    profileData?.cityName ?? 'NA',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular12Gray500
                                        .copyWith(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1.00,
                            width: 287.00,
                            margin: const EdgeInsets.only(
                              left: 20,
                              top: 16,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.gray60067,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 22,
                              right: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "State",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsMedium14Gray804
                                        .copyWith(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 1,
                                  ),
                                  child: Text(
                                    profileData?.stateName ?? 'NA',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular12Gray500
                                        .copyWith(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1.00,
                            width: 287.00,
                            margin: const EdgeInsets.only(
                              left: 20,
                              top: 18,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.gray60067,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 21,
                              right: 19,
                              bottom: 24,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Pin Code".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsMedium14Gray804
                                      .copyWith(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    profileData?.zip ?? 'NA',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular12Gray500
                                        .copyWith(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                        left: 24,
                        top: 20,
                        right: 24,
                      ),
                      decoration: AppDecoration.fillGray50.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder9,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 22,
                              right: 20,
                            ),
                            child: Text(
                              "Address",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  AppStyle.txtPoppinsMedium14Gray804.copyWith(),
                            ),
                          ),
                          Container(
                            width: 245.00,
                            margin: const EdgeInsets.only(
                              left: 20,
                              top: 14,
                              right: 20,
                              bottom: 20,
                            ),
                            child: Text(
                              profileData?.parmanentAddress ?? 'NA',
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular12Gray500
                                  .copyWith(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 24,
                        top: 20,
                        right: 24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.00,
                        ),
                      ),
                    ),
                  ),
                  /* Container(
                    margin:
                        const EdgeInsets.only(left: 34, right: 34, top: 10),
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    decoration: AppDecoration.fillGray50.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder9,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              ImageConstant.currentRupeeIcon,
                              height: 30,
                              width: 30,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 25),
                              child: Text(
                                "Current Balance",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsRegular14Gray601
                                    .copyWith(),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Text(
                                "₹ ${res?.data?[0].memberBalance ?? 0} ",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppStyle.txtPoppinsMedium16.copyWith(),
                              ),
                            ),
                            SvgPicture.asset(
                              ImageConstant.plusIcon,
                              height: 30,
                              width: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),*/
                  /* Container(
                    margin:
                        const EdgeInsets.only(left: 34, right: 34, top: 10),
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    decoration: AppDecoration.fillGray50.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder9,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(ImageConstant.myRewardIcon,height: 24,width: 24,),
                            Container(
                              margin: const EdgeInsets.only(left: 25),
                              child: Text(
                                "My Reward",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsRegular14Gray601
                                    .copyWith(),
                              ),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.blue500,
                          size: 20,
                        )
                      ],
                    ),
                  ),*/
                  /* Container(
                    margin:
                        const EdgeInsets.only(left: 34, right: 34, top: 10),
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    decoration: AppDecoration.fillGray50.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder9,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(ImageConstant.kycStatusIcon,height: 24,width: 24,),
                            Container(
                              margin: const EdgeInsets.only(left: 25),
                              child: Text(
                                "KYC Status",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsRegular14Gray601
                                    .copyWith(),
                              ),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.blue500,
                          size: 20,
                        )
                      ],
                    ),
                  ),*/
                  /*Container(
                    margin: const EdgeInsets.only(
                        left: 34, right: 34, top: 10, bottom: 50),
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    decoration: AppDecoration.fillGray50.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder9,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              ImageConstant.personIcon,
                              height: 20,
                              width: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 25),
                              child: Text(
                                "Account Delete",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsRegular14Gray601
                                    .copyWith(),
                              ),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.blue500,
                          size: 20,
                        )
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sidemenu() {
    //Get.offAndToNamed(AppRoutes.sidemenu);
  }

  goToHome() {
    //Get.offAndToNamed(AppRoutes.home);
  }

  goToHistory() {
    // Get.offAndToNamed(AppRoutes.history);
  }

  goToSetting() {
    // Get.offAndToNamed(AppRoutes.setting);
  }

  goToProfile() {
    //Get.offAndToNamed(AppRoutes.profile);
  }

  gotoNotification() {
    //Get.toNamed(AppRoutes.notification);
  }

  editProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfile()),
    );
  }

  getData() async {
    final body = {};
    var data = await controller.profile(body);
    res = ProfileResponse.fromJson(data);
    setState(() {
      if (res!.data!.isNotEmpty) {
        profileData = res?.data![0];
      }
    });
  }
}
