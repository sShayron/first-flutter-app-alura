import 'dart:convert';

import 'package:flutter_http/models/movie.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> getMovies() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/alura-cursos/obtendo_dados_com_flutter_http/main/filmes.json'));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);

    return List<Movie>.from(
      json.map(
        (el) => Movie.fromJson(el),
      ),
    );
  } else {
    return Future.error('Ops! Ocorreu um erro.');
  }
}
