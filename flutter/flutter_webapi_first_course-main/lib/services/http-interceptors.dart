import 'dart:convert';
import 'dart:io';

import 'package:flutter_webapi_first_course/helpers/logout.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");
    if (token != null) {
      data.headers.addAll({"Authorization": "Bearer $token"});
    }

    logger.v(
        "Req: ${data.baseUrl} \n Headers: ${data.headers} \n Body: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode ~/ 100 == 2) {
      logger.v(
          "Res: ${data.url} \n Headers: ${data.headers} Status: ${data.statusCode} \n Body: ${data.body}");
    } else {
      logger.e(
          "Res: ${data.url} \n Headers: ${data.headers} Status: ${data.statusCode} \n Body: ${data.body}");

      if (data.body == null) {
        throw const HttpException("Erro desconhecido");
      }

      final content = json.decode(data.body!);

      switch (content) {
        case "jwt expired":
          logout();
          throw TokenNotValidException();
        case "Cannot find user":
          throw UserNotFindException();
      }

      throw HttpException(json.decode(data.body!));
    }

    return data;
  }
}

class TokenNotValidException implements Exception {}

class UserNotFindException implements Exception {}
