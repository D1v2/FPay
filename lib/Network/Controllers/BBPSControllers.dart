import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class BBPSControllers extends BaseController {
  Future<dynamic> operatorList(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.allOperatorsEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> fetchDetail(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.fetchBBPSDetailEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> payBBPSBill(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.payBBPSEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

}
