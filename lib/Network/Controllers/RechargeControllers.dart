import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class RechargeControllers extends BaseController {

  Future<dynamic> fetchRechargePlans0(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.fetchRechargeEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> fetchRechargePlans(dynamic body) async {
    var response = await BaseClient()
        .post(ApiConstants.fetchRechargeEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    return response;
  }

  Future<dynamic> doRechargePlans(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.doRechargeEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> fetchOperatorName(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.fetchOperatorName, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> fetchCircleName(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.dropDownMasterEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> recentTransactions(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.reportEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }
}
