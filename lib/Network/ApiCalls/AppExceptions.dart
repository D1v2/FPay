class AppExceptions implements Exception {
  final String message;
  final String prefix;
  final String url;

  AppExceptions(
      {required this.message, required this.prefix, required this.url});
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message, String? url])
      : super(message: message!, prefix: "Bad Request", url: url!);
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message, String? url])
      : super(message: message!, prefix: "Unable to process", url: url!);
}

class ApiNotRespondingException extends AppExceptions {
  ApiNotRespondingException([String? message, String? url])
      : super(message: message!, prefix: "Api not responding", url: url!);
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message, String? url])
      : super(message: message!, prefix: "Your token is invalid", url: url!);
}

class URLNotFound extends AppExceptions {
  URLNotFound([String? message, String? url])
      : super(message: message!, prefix: "Your url is invalid", url: url!);
}