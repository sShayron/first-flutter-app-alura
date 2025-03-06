import 'package:flutter/material.dart';
import 'package:flutter_http/components/movie_card.dart';
import 'package:flutter_http/models/movie.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemCount: movies.length,
      itemBuilder: ((context, index) {
        final movie = movies[index];
        return MovieCard(
          name: movie.name,
          image: movie.image,
        );
      }),
    );
  }
}
