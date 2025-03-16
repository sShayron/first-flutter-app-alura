import 'dart:convert';

import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/http-interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

http.Client client = InterceptedClient.build(interceptors: [
  LoggingInterceptor(),
]);

class JournalService {
  static const String url = "http://192.168.96.1:3000/";
  static const String resource = "journals/";

  String getUrl() {
    return "$url$resource";
  }

  Future<List<Journal>> getAll() async {
    http.Response res = await client.get(Uri.parse(getUrl()));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Journal> journals =
          body.map((item) => Journal.fromMap(item)).toList();
      return journals;
    } else {
      throw "Failed to load journals";
    }
  }

  Future<bool> register(Journal jounal) async {
    String jsonJournal = json.encode(jounal.toMap());
    http.Response res = await client.post(
      Uri.parse(getUrl()),
      headers: {"content-type": "application/json"},
      body: jsonJournal,
    );

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }
}
