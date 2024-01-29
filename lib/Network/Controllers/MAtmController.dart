import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class MAtmController extends BaseController {
  Future<dynamic> checkOnboarding(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.checkOnboardingMAtm, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> doOnboarding(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.completeOnboardingMAtm, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> updateTransaction(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.updateTransactionMAtm, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }
}
