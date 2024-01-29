import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class DashboardController extends BaseController {
  Future<dynamic> notificationList(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.notificationListEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }
}
