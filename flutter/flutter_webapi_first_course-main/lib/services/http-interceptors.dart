import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
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
    }

    return data;
  }
}
