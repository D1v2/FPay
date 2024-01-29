import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../AppManager/ThemeColor.dart';
import '../../../Network/Controllers/BBPSControllers.dart';
import '../../../Network/Models/BBPSResponse.dart';
import '../../../Network/Models/HomeIconsResponse.dart';
import '../../../Utils/FunctionUtils.dart';
import '../../../Utils/WidgetsConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class BaseBBPS extends StatefulWidget {
  const BaseBBPS({Key? key}) : super(key: key);

  @override
  State<BaseBBPS> createState() => _BaseBBPSState();
}

class _BaseBBPSState extends State<BaseBBPS> {
  late HomeIconsData data;
  final controller = BBPSControllers();
  BBPSResponse? bbpsResponse;

  var mainData = [];
  var mainDataOnSearch = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    data = Get.arguments as HomeIconsData;
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => getOperators());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          flexibleSpace: Container(
            decoration: AppDecoration.mainGradient.copyWith(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          leading: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Align(
              child: InkWell(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          title: Text(data.serviceName!,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsMedium20Gray101.copyWith()),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.only(bottom: 10),
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        mainDataOnSearch = mainData
                            .where((element) => element.operatorName
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Search here..",
                        suffixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.only(left: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
              ),
              Expanded(
                child: Card(
                    elevation: 4,
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _searchController.text.isNotEmpty &&
                                    mainDataOnSearch.isEmpty
                                ? Container()
                                : mainData.isEmpty
                                    ? Container()
                                    : Container(
                                        alignment: Alignment.topLeft,
                                        margin: const EdgeInsets.only(
                                            left: 15, top: 5, bottom: 10),
                                        child: Text(
                                          "All Billers",
                                          style: TextStyle(
                                              color: AppColor.gray600,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              fontFamily: 'Poppins'),
                                        )),
                            _searchController.text.isNotEmpty &&
                                    mainDataOnSearch.isEmpty
                                ? dataNotFound()
                                : mainData.isNotEmpty
                                    ? getWidgetList()
                                    : dataNotFound(),
                          ],
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getOperators() async {
    var body = {"id": data.id};
    var json = await controller.operatorList(body);
    bbpsResponse = BBPSResponse.fromJson(json);
    mainData = bbpsResponse!.data!;
    setState(() {});
  }

  Widget getWidgetList() {
    return Expanded(
      child: ListView.separated(
          itemCount: _searchController.text.isNotEmpty
              ? mainDataOnSearch.length
              : mainData.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 2),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // fetchDetail(_searchController.text.isNotEmpty
                //     ? mainDataOnSearch[index]
                //     : mainData[index]);

                Get.offNamed('/bbpsDetail', arguments: {
                  'iconData': data,
                  'listData': _searchController.text.isNotEmpty
                      ? mainDataOnSearch[index]
                      : mainData[index]
                });
              },
              child: ListTile(
                leading: imageArray[data.id] != null
                    ? SvgPicture.asset(imageArray[data.id])
                    : Icon(
                        Icons.image,
                        color: AppColor.gray600,
                      ),
                title: Text(
                  _searchController.text.isNotEmpty
                      ? mainDataOnSearch[index].operatorName!
                      : mainData[index].operatorName!,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
              ),
            );
          }),
    );
  }

/*fetchDetail(BBPSData data1) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => FetchBBPSDetail(
                bbpsData: data1,
                homeIconsData: data,
              )),
    );
  }*/
}
