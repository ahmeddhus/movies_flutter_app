class Movie {
  final int id;
  final double popularity;
  final String title;
  final String backPosters;
  final String poster;
  final String overview;
  final double rating;

  Movie(this.id, this.popularity, this.title, this.backPosters, this.poster,
      this.overview, this.rating);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        title = json["title"],
        backPosters = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        rating = json["vote_average"].toDouble();

}
