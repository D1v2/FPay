import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class MoneyTransferController extends BaseController {
  Future<dynamic> checkNumber(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.checkMoneyTransferNumber, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> allBankList(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.allBankListMoneyTransfer, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> addBank(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.addBankMoneyTransfer, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> addMobileNumber(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.addMoneyTransferNumber, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> verifyMobileOtp(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.verifyOtpMoneyTransfer, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> bankList(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.bankListMoneyTransfer, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> deleteBank(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.deleteBankMoneyTransfer, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> moneyTransfer(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.moneyTransfer, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> limit(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.limit, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> chargesCalculate(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.calculateChargesMoneyTransfer, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }
}
