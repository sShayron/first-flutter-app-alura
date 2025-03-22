import 'dart:convert';

import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/client.dart';
import 'package:http/http.dart' as http;

class JournalService {
  Future<List<Journal>> getAll({required int id}) async {
    final uri = Client.buildUri("/users/$id/journals");
    http.Response res = await Client.httpClient.get(uri);

    List<dynamic> body = jsonDecode(res.body);
    List<Journal> journals = body.map((item) => Journal.fromMap(item)).toList();
    return journals;
  }

  Future<bool> edit(String id, Journal journal) async {
    journal.updatedAt = DateTime.now();
    String jsonJournal = json.encode(journal.toMap());
    final uri = Client.buildUri("/journals/$id");
    await Client.httpClient.put(
      uri,
      headers: {"content-type": "application/json"},
      body: jsonJournal,
    );

    return true;
  }

  Future<bool> register(Journal journal) async {
    String jsonJournal = json.encode(journal.toMap());
    final uri = Client.buildUri("/journals");
    await Client.httpClient.post(
      uri,
      headers: {"content-type": "application/json"},
      body: jsonJournal,
    );

    return true;
  }

  Future<bool> delete(String id) async {
    final uri = Client.buildUri("/journals/$id");
    await Client.httpClient.delete(uri);

    return true;
  }
}
