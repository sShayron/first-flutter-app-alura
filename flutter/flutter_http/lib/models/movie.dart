class Movie {
  String name;
  String image;

  Movie({required this.name, required this.image});

  Movie.fromJson(Map<String, dynamic> json)
      : name = json['nome'].toString(),
        image = json['imagem'].toString();
}
