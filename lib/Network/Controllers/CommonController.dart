import '../ApiCalls/BaseClient.dart';
import '../ApiCalls/BaseController.dart';
import '../ApiConstants.dart';

class CommonController extends BaseController {

  Future<dynamic> doPayout(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.payoutEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> doDMT(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.moneyTransfer, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  // Future<dynamic> payBBPSBill(dynamic body) async {
  //   showLoading();
  //   var response = await BaseClient()
  //       .post(ApiConstants.payBBPSEndPoint, body)
  //       .catchError(handleError);
  //   if (response == null) return;
  //   hideLoading();
  //   return response;
  // }

}
