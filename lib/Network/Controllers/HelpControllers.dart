import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class HelpController extends BaseController {
  Future<dynamic> ticketsList(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.ticketHistoryEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> dropDown(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.dropDownMasterEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> submitForm(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.raisedTicketEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

}
