import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpay/Utils/DialogHelper.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../Utils/ImageConstant.dart';
import '../../../Utils/app_decoration.dart';
import '../../../Utils/app_style.dart';

class ContactNumber extends StatefulWidget {
  const ContactNumber({Key? key}) : super(key: key);

  @override
  State<ContactNumber> createState() => _ContactNumberState();
}

class _ContactNumberState extends State<ContactNumber> {
  List<Contact>? contacts;

  @override
  void initState() {
    super.initState();
    requestPermission();
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
        leading: Align(
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text("Select Contact Number",
            style: AppStyle.txtPoppinsBold18.copyWith()),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: contacts?.length ?? 0,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  navigateBack(
                      contacts?[index].displayName ?? "NA",
                      contacts?[index].phones != null ||
                              contacts![index].phones!.isNotEmpty
                          ? contacts![index].phones!.length > 1
                              ? contacts![index]
                                  .phones![1]
                                  .value
                                  .toString()
                                  .trim()
                              : contacts![index]
                                  .phones![0]
                                  .value
                                  .toString()
                                  .trim()
                          : "NA");
                },
                child: ListTile(
                  leading: SvgPicture.asset(ImageConstant.userAvatarIcon),
                  title: Text(contacts?[index].displayName ?? "NA"),
                  subtitle: Text(contacts?[index].phones != null ||
                          contacts![index].phones!.isNotEmpty
                      ? contacts![index].phones!.length > 1
                          ? contacts![index].phones![1].value.toString()
                          : contacts![index].phones![0].value.toString()
                      : "NA"),
                ),
              );
            }),
      ),
    ));
  }

  Future<void> requestPermission() async {
    final PermissionStatus permissionStatus =
        await Permission.contacts.request();

    if (permissionStatus.isGranted) {
      DialogHelper.showLoading();
      fetchContacts();
    } else {
      DialogHelper.showErrorWithBack(
          context: context,
          description: "You need to allow the permission for get the contact");
    }
  }

  Future<void> fetchContacts() async {
    contacts = await ContactsService.getContacts();
    DialogHelper.hideLoading();
    setState(() {});
  }

  navigateBack(String name, String number) {
    if (number.length < 10) {
      DialogHelper.showToast("Please select the valid mobile number");
    } else {
      if (number.length > 10) {
        number = number.substring(3, number.length);
      }
      Get.back(result: {'number': number, 'name': name});
    }
  }
}
