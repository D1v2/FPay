import 'dart:math';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'PreferenceManager.dart';

class JWTTokenProvider {
  var token = "";
  String getToken() {
    var ref = Random().nextInt(1000000).toString();
    final jwt = JWT(
      {
        "RefNo": ref,
        "MsrNo": PreferenceManager.getMsrNumber(),
        "Mobile": PreferenceManager.getNumber(),
        "Token": "1",
        "Source": "APP",
        "UserType": "2"
      },
    );
    token = jwt.sign(SecretKey("FPay2cHiaSipqMdaIurqWmpM2"),
        algorithm: JWTAlgorithm.HS256, expiresIn: const Duration(minutes: 2));
    return token;
  }

  void hasExpired() {
    print(JwtDecoder.isExpired(token));
  }
}
