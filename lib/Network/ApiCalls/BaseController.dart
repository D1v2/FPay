import 'dart:async';
import 'dart:io';

import 'package:fpay/Network/ApiCalls/AppExceptions.dart';
import 'package:fpay/Utils/DialogHelper.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      DialogHelper.showErrorDialog(description: "Bad Request");
    } else if (error is FetchDataException) {
      DialogHelper.showErrorDialog(
          title: "Please check your internet connection",
          description:
              "It seems that your device is not connected to the network, please check your internet connection or try again");
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(description: "Api not responding");
    } else if (error is UnAuthorizedException) {
      DialogHelper.showErrorDialog(
          title: "Unauthorized",
          description: "Oops! access is allowed only for registered users");
    } else if (error is SocketException) {
      DialogHelper.showErrorDialog(
          title: "Please check your internet connection",
          description:
              "It seems that your device is not connected to the network, please check your internet connection or try again");
    } else if (error is TimeoutException) {
      DialogHelper.showErrorDialog(description: "Api not responding on time");
    } else if (error is URLNotFound) {
      DialogHelper.showErrorDialog(description: "Url is invalid");
    } else {
      DialogHelper.showErrorDialog(description: error.toString());
    }
  }

  showLoading() {
    DialogHelper.showLoading();
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
