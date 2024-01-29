import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class PayoutController extends BaseController {
  Future<dynamic> banksList(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.payoutAccountsEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> payout(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.payoutEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> allBanksList() async {
    showLoading();
    var response = await BaseClient().post(
        ApiConstants.allPayoutAccountsEndPoint, {}).catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> verifyAccount(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.verifyAccountPayout, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> accountInformation(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.accountInformation, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> deleteAccounts(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.deleteAccounts, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> calculateCharges(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.payoutChargeCalculate, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> creditCardBill(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.creditCardBill, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> autoCollectorList() async {
    showLoading();
    var response = await BaseClient()
        .get(ApiConstants.autoCollectorList)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> doAutoCollector(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .get("${ApiConstants.doAutoCollector}?action=$body")
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }
}
