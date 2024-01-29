import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class SelfSettlementController extends BaseController {
  Future<dynamic> bankList(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.selfBankList, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> addBank(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.selfAddBank, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> selfTransaction(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.selfTransaction, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }
}
