import 'package:flutter/material.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Network/Controllers/HotelController.dart';
import 'package:fpay/Network/Models/hotelModel/hotelDetail/HotelDetailResponse.dart';
import 'package:fpay/Pages/services/hotel/HotelFormDetail.dart';
import 'package:fpay/Utils/app_style.dart';
import 'package:fpay/Utils/math_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Utils/DialogHelper.dart';
import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/common_image_view.dart';
import '../../../Utils/custom_icon_button.dart';

class HotelDetail extends StatefulWidget {
  String hotelId;

  HotelDetail({super.key, required this.hotelId});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  List<Widget> item = [];
  GoogleMapController? mapController;
  var hotelController = HotelController();
  HotelDetailResponse? hotelDetailResponse;
  final PageController _pageController =
      PageController(viewportFraction: 0.8, initialPage: 1);

  @override
  void initState() {
    super.initState();
    // item.add(facilityItem("Wifi Free", Icons.wifi));
    // item.add(facilityItem("Swimming Pool", Icons.pool_rounded));
    // item.add(facilityItem("TV", Icons.tv));
    // item.add(facilityItem("Laundry", Icons.local_laundry_service));
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => hotelDetail());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45)),
                    child: hotelDetailResponse?.hotel?.img != null
                        ? SizedBox(
                            height: 320,
                            width: MediaQuery.of(context).size.width,
                            child: PageView.builder(
                                itemCount:
                                    hotelDetailResponse?.hotel?.img?.length,
                                pageSnapping: true,
                                controller: _pageController,
                                itemBuilder: (context, pagePosition) {
                                  return Image.network(
                                    // images[pagePosition],
                                    hotelDetailResponse
                                            ?.hotel?.img?[pagePosition].url ??
                                        "NA",
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                    height: 300,
                                  );
                                }),
                          )
                        : Image.asset(
                            ImageConstant.banner,
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: 300,
                          ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => {Navigator.pop(context)},
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black.withOpacity(0.2)),
                            child: Icon(Icons.arrow_back,
                                color: AppColor.whiteA700),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black.withOpacity(0.2)),
                          child: Icon(Icons.favorite_border,
                              color: AppColor.whiteA700),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          hotelDetailResponse?.hotel?.name ?? "NA",
                          style: AppStyle.normalLabelHeading.copyWith(
                              fontWeight: FontWeight.w800, fontSize: 15),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 4, bottom: 4),
                          decoration: AppDecoration.mainGradient
                              .copyWith(borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 12,
                                color: AppColor.whiteA700,
                              ),
                              Text(
                                " ${hotelDetailResponse?.hotel?.rt}",
                                style: AppStyle.normalLabelHeading.copyWith(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12,
                                    color: AppColor.whiteA700),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 7, bottom: 10),
                      child: Text(
                        "",
                        style: AppStyle.normalLabelHeading.copyWith(
                            color: AppColor.gray500,
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      margin: const EdgeInsets.only(bottom: 10, top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: AppColor.gray400, width: 0.4)),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 1.0,
                                  mainAxisExtent: 60),
                          itemCount: item.length,
                          itemBuilder: (context, index) {
                            return item[index];
                          }),
                    ),
                    const Divider(),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        "Overview",
                        style: AppStyle.normalLabelHeading.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        " ${hotelDetailResponse?.hotel?.des}",
                        style: AppStyle.formLabelHeading
                            .copyWith(color: AppColor.gray401),
                      ),
                    ),
                    const Divider(),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Location & Contact",
                        style: AppStyle.normalLabelHeading.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(top: 10, bottom: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.formBackGround),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: GoogleMap(
                              initialCameraPosition: const CameraPosition(
                                target: LatLng(26.9124, 75.7873),
                                zoom: 24.0, // Set the initial zoom level
                              ),
                              onMapCreated: (GoogleMapController controller) {
                                setState(() {
                                  mapController = controller;
                                });
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.whiteA700),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.all(8),
                                    decoration: AppDecoration.mainGradient
                                        .copyWith(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.pin_drop,
                                      size: 20,
                                      color: AppColor.whiteA700,
                                    )),
                                Expanded(
                                  child: Text(
                                    "${hotelDetailResponse?.hotel?.ad?.adr}, "
                                    "${hotelDetailResponse?.hotel?.ad?.city?.name}, "
                                    "${hotelDetailResponse?.hotel?.ad?.state?.name}, "
                                    "${hotelDetailResponse?.hotel?.ad?.postalCode}",
                                    style: AppStyle.formLabelHeading,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.whiteA700),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.all(8),
                                    decoration: AppDecoration.mainGradient
                                        .copyWith(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.email_outlined,
                                      size: 20,
                                      color: AppColor.whiteA700,
                                    )),
                                Text(
                                  "abcd@gmail.com",
                                  style: AppStyle.formLabelHeading,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.whiteA700),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.all(8),
                                    decoration: AppDecoration.mainGradient
                                        .copyWith(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.phone,
                                      size: 20,
                                      color: AppColor.whiteA700,
                                    )),
                                Text(
                                  hotelDetailResponse?.hotel?.cnt?.ph ?? "NA",
                                  style: AppStyle.formLabelHeading,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Customer Reviews",
                      style: AppStyle.normalLabelHeading
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(top: 10, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.formBackGround),
                      child: ListView(
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        //  scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 50.0,
                            height: 100,
                            color: Colors.red,
                            margin: EdgeInsets.all(8.0),
                          ),
                          Container(
                            width: 50.0,
                            height: 100,
                            color: Colors.blue,
                            margin: EdgeInsets.all(8.0),
                          ),
                          Container(
                            width: 50.0,
                            height: 100,
                            color: Colors.green,
                            margin: EdgeInsets.all(8.0),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment",
                          style: AppStyle.formLabelHeading.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "₹ 3029",
                          style: AppStyle.formLabelHeading.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          fillForm();
                        },
                        child: Container(
                            height: (60.00),
                            margin: const EdgeInsets.only(
                                left: 23, top: 30, right: 23),
                            child:
                                Stack(alignment: Alignment.center, children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      decoration: AppDecoration
                                          .gradientLightblue800Blue500
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomIconButton(
                                                height: 25,
                                                width: 25,
                                                margin:
                                                    const EdgeInsets.all(10),
                                                variant: IconButtonVariant
                                                    .OutlineWhiteA701,
                                                shape: IconButtonShape
                                                    .CircleBorder15,
                                                padding: IconButtonPadding
                                                    .PaddingAll8,
                                                alignment:
                                                    Alignment.centerRight,
                                                child: CommonImageView(
                                                    svgPath:
                                                        ImageConstant.moveIcon))
                                          ]))),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40,
                                        top: 21,
                                        right: 40,
                                        bottom: 20),
                                    child: Text("confirm payment".toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsSemiBold16
                                            .copyWith(letterSpacing: 1.00))),
                              )
                            ]))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  fillForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HotelFormDetail()),
    );
  }

  Future hotelDetail() async {
    var body = {"id": widget.hotelId};
    var json = await hotelController.hotelDetail(body);
    hotelDetailResponse = HotelDetailResponse.fromJson(json);

    if (hotelDetailResponse?.status?.success == true) {
      for (int i = 0; i < hotelDetailResponse!.hotel!.fl!.length; i++) {
        item.add(facilityItem(hotelDetailResponse!.hotel!.fl![i], Icons.add));
      }
    } else {
      if (hotelDetailResponse?.errors != null) {
        DialogHelper.showErrorDialog(
            description: hotelDetailResponse!.errors![0].message.toString());
      } else {
        DialogHelper.showErrorDialog(description: "Something went wrong...");
      }
    }

    setState(() {});
  }

  Widget facilityItem(String name, IconData image) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(8),
            decoration: AppDecoration.mainGradient
                .copyWith(borderRadius: BorderRadius.circular(100)),
            child: Icon(
              image,
              size: 20,
              color: AppColor.whiteA700,
            )),
        Expanded(
          child: Text(
            name,
            style: AppStyle.formLabelHeading,
          ),
        )
      ],
    );
  }
}
