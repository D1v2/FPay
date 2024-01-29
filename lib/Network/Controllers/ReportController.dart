import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class ReportController extends BaseController {
  Future<dynamic> reportList(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.reportEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> serviceList(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.dropDownMasterEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }
}
