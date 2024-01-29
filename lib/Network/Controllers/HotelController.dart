import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class HotelController extends BaseController {
  Future<dynamic> hotelList(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .hotelPost(ApiConstants.hotelList, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> hotelDetail(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .hotelPost(ApiConstants.hotelDetail, body)
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
