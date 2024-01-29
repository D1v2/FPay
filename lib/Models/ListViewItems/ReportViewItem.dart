import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpay/AppManager/ThemeColor.dart';
import 'package:fpay/Network/Models/ReportData.dart';
import 'package:fpay/Utils/math_utils.dart';

import '../../Utils/FunctionUtils.dart';
import '../../Utils/ImageConstant.dart';

class ReportViewItem extends StatelessWidget {
  final ReportData? item;

  const ReportViewItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: imageArray[item?.subServiceID.toString()] != null
                        ? SvgPicture.asset(imageArray[item?.subServiceID.toString()])
                        : Icon(
                            Icons.image,
                            color: AppColor.gray600,
                          ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            item?.heading ?? "NA",
                            maxLines: 3,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                                fontSize: 17,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              item?.subheading ?? "NA",
                              maxLines: 3,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: item?.status == "Success"
                                      ? AppColor.greenA700
                                      : item?.status == "Failed"
                                          ? AppColor.red600
                                          : AppColor.gray600),
                            ),
                          ),
                          Text(
                            formatDate(item?.addDate),
                            maxLines: 3,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            item?.status == "Success"
                ? SvgPicture.asset(
                    ImageConstant.successIcon,
                    height: 25,
                    width: 25,
                  )
                : item?.status == "Failed"
                    ? SvgPicture.asset(
                        ImageConstant.errorIcon,
                        height: 25,
                        width: 25,
                      )
                    : SvgPicture.asset(
                        ImageConstant.pendingIcon,
                        height: 30,
                        width: 30,
                      )
          ],
        )

        /* ListTile(
        leading: item?.logo != null
            ? Container(
                padding: const EdgeInsets.all( 8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 1)),
                child: SvgPicture.network(
                  PreferenceConstant.servicesLogoUrl + item!.logo!,
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(
                Icons.image,
                color: Colors.grey,
              ),
        title: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                item!.heading!,
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    item.toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  )),
            ),
          ],
        ),
        subtitle: Container(
          margin: const EdgeInsets.only(top: 15),
          child: Text(
            item!.addDate!,
            style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(119, 119, 119, 1)),
          ),
        ),
      ),*/
        );
  }
}
