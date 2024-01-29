import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpay/Utils/ImageConstant.dart';

Widget dataNotFound() {
  return Expanded(
    child: Center(
      child: Image.asset(ImageConstant.noDataFound,height: 130,width: 130,),
    ),
  );
}
