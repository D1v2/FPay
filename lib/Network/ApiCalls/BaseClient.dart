import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fpay/Network/ApiConstants.dart';
import 'package:http/http.dart' as http;

import '../../Utils/JWTTokenProvider.dart';
import 'AppExceptions.dart';

class BaseClient {
  //GET
  Future<dynamic> get(String endPoint) async {
    var uri = Uri.parse(ApiConstants.baseUrl + endPoint);
    String token = JWTTokenProvider().getToken();
    try {
      var response = await http.get(uri, headers: {
        'Authorization': 'Bearer $token'
      }).timeout(Duration(minutes: ApiConstants.TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Api not responding on time", uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String endPoint, dynamic payloadObj) async {
    var uri = Uri.parse(ApiConstants.baseUrl + endPoint);
    var payload = json.encode(payloadObj);
    String token = JWTTokenProvider().getToken();
    try {
      var response = await http
          .post(uri,
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token'
              },
              body: payload)
          .timeout(Duration(minutes: ApiConstants.TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Api not responding on time", uri.toString());
    }
  }

  //MultiPart Post
  Future<dynamic> genericMultipartPost(String endPoint,
      Map<String, dynamic> fields, List<Map<String, dynamic>> files) async {
    var uri = Uri.parse(ApiConstants.baseUrl + endPoint);
    try {
      var request = http.MultipartRequest('POST', uri);
      String token = JWTTokenProvider().getToken();

      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';

      var response = await request
          .send()
          .timeout(Duration(minutes: ApiConstants.TIME_OUT_DURATION));
      return _processResponse(convertStreamedResponse(response) as http.Response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Api not responding on time", uri.toString());
    }
  }

  Future<dynamic> hotelPost(String endPoint, dynamic payloadObj) async {
    var uri = Uri.parse(ApiConstants.hotelBaseUrl + endPoint);
    var payload = json.encode(payloadObj);
    try {
      var response = await http
          .post(uri,
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'apikey': ApiConstants.hotelApiKey
              },
              body: payload)
          .timeout(Duration(minutes: ApiConstants.TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Api not responding on time", uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(
            jsonDecode(response.body), response.request!.url.toString());
      case 401:
        throw UnAuthorizedException(jsonDecode(response.body).toString(),
            response.request!.url.toString());
      case 403:
        throw UnAuthorizedException(
            jsonDecode(response.body), response.request!.url.toString());
      case 404:
        throw URLNotFound(
            jsonDecode(response.body), response.request!.url.toString());
      case 500:
        throw FetchDataException(
            jsonDecode(response.body), response.request!.url.toString());
      default:
        throw const SocketException("Please Check your Internet Connectivity");
    }
  }
  Future<http.Response> convertStreamedResponse(http.StreamedResponse streamedResponse) async {
    final body = await streamedResponse.stream.bytesToString();
    final headers = streamedResponse.headers;
    final statusCode = streamedResponse.statusCode;

    return http.Response(body, statusCode, headers: headers);
  }
}
