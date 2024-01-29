import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class AepsControllers extends BaseController {
  Future<dynamic> bankList(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.dropDownMasterEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> doAeps(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.doAepsEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> onBoard(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.onBoardingEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> outletStatus() async {
    showLoading();
    var response = await BaseClient()
        .get(ApiConstants.outLetStatus)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> outletLogin(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.outLetLogin, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  /// AEPS PRO

  Future<dynamic> checkOnBoardingPro(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.checkOnBoardingAepsProEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> completeOnBoardingPro(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.completeOnBoardingAepsProEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> completePro(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.completeAepsProEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }
}
