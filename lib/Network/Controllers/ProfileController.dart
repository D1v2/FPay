import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class ProfileController with BaseController {
  Future<dynamic> profile(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.profileEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> currentBalance(dynamic body) async {
    var response = await BaseClient()
        .post(ApiConstants.currentBalanceEndPoint, body)
        .catchError(handleError);
    if (response == null) return;

    return response;
  }

  Future<dynamic> homeIcons(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.homeIcons, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }
}
