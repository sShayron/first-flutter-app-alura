import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:flutter_webapi_first_course/services/http-interceptors.dart';

class Client {
  static const String baseUrl = "http://172.22.192.1:3000";

  static final http.Client httpClient = InterceptedClient.build(
    interceptors: [
      LoggingInterceptor(),
    ],
    requestTimeout: const Duration(seconds: 10),
  );

  static Uri buildUri(String endpoint, {Map<String, String>? queryParameters}) {
    return Uri.parse(baseUrl).replace(
      path: Uri.parse(baseUrl).path + endpoint,
      queryParameters: queryParameters,
    );
  }
}
