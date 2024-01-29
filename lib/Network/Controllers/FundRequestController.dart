import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class FundRequestController extends BaseController {
  Future<dynamic> fundRequestList(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.fundRequestList, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> fundStatus(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.fundRequest, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }
}
