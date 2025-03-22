import 'dart:convert';
import 'dart:io';

import 'package:flutter_webapi_first_course/services/client.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> login({required String email, required String password}) async {
    final uri = Client.buildUri("/login");
    http.Response res = await Client.httpClient.post(
      uri,
      body: {"email": email, "password": password},
    );

    saveUserInfos(res.body);
    return true;
  }

  Future<bool> register(
      {required String email, required String password}) async {
    final uri = Client.buildUri("/register");
    http.Response res = await Client.httpClient.post(
      uri,
      body: {"email": email, "password": password},
    );

    saveUserInfos(res.body);
    return true;
  }

  saveUserInfos(String body) async {
    Map<String, dynamic> map = json.decode(body);

    String token = map["accessToken"];
    String email = map["user"]["email"];
    int id = map["user"]["id"];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", token);
    prefs.setString("email", email);
    prefs.setInt("id", id);
  }
}
