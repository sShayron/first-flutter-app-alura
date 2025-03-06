import 'package:flutter/material.dart';
import 'package:flutter_http/components/movies_list.dart';
import 'package:flutter_http/models/movie.dart';
import 'package:flutter_http/services/movies.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Movie>>? movies;

  @override
  void initState() {
    movies = getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmes Studio Ghibli"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final movies = snapshot.data as List<Movie>;
            return MoviesList(movies: movies);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
