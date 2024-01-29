import 'package:fpay/Network/ApiCalls/BaseController.dart';

import '../ApiCalls/BaseClient.dart';
import '../ApiConstants.dart';

class AuthenticationController with BaseController {
  Future<dynamic> login(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.loginEndPoint, body)
        .catchError(handleError);
    print("response ---- $response");
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> changeCredentials(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.changeCredentialsEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> forgotCredentials(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.forgotCredentialsEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

  Future<dynamic> sendOTP(dynamic body) async {
    showLoading();
    var response = await BaseClient()
        .post(ApiConstants.sendOTPEndPoint, body)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }
}
