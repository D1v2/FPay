import '../../../Utils/ImageConstant.dart';

class UpiModel {
  final itemList = [
    UpiItem(
        image: ImageConstant.phonePayIcon, upiId: "ybl",),
    UpiItem(
        image: ImageConstant.phonePayIcon, upiId: "ibl",),
    UpiItem(
        image: ImageConstant.phonePayIcon, upiId: "axl",),
    UpiItem(
        image: ImageConstant.gPayIcon,
        upiId: "okhdfcbank",),
    UpiItem(
        image: ImageConstant.gPayIcon, upiId: "okaxis"),
    UpiItem(
        image: ImageConstant.gPayIcon, upiId: "oksbi",),
    UpiItem(image: ImageConstant.bharatPayIcon, upiId: "bharat",),
    UpiItem(
        image: ImageConstant.amazonPayIcon, upiId: "apl",),
    UpiItem(
        image: ImageConstant.amazonPayIcon, upiId: "yabl", ),
    UpiItem(
        image: ImageConstant.amazonPayIcon, upiId: "rapl",),
    UpiItem(
        image: ImageConstant.airtelPayIcon,
        upiId: "airtel",),
    UpiItem(
        image: ImageConstant.paytmIcon, upiId: "paytm", ),
    UpiItem(
        image: ImageConstant.axisBankIcon, upiId: "axis"),
    UpiItem(
        image: ImageConstant.iciciBankIcon,
        upiId: "icici",),
    UpiItem(
        image: ImageConstant.mobikwikIcon,
        upiId: "ikwik",),
    UpiItem(
        image: ImageConstant.whatsappPayIcon,
        upiId: "waicici",),
    UpiItem(
        image: ImageConstant.whatsappPayIcon,
        upiId: "waaxis",
       ),
    UpiItem(
        image: ImageConstant.whatsappPayIcon,
        upiId: "wahdfcbank",
        ),
    UpiItem(
        image: ImageConstant.whatsappPayIcon,
        upiId: "wasbi",
       ),
    UpiItem(
        image: ImageConstant.tataNueIcon,
        upiId: "tapicici",
       )
  ];
}

class UpiItem {
  final String image;
  final String upiId;

  UpiItem({required this.image, required this.upiId});
}
