import 'package:movies_flutter_app/model/movie.dart';

class MoviesResponse{
  final List<Movie> movies;
  final String error;

  MoviesResponse(this.movies, this.error);

  MoviesResponse.fromJson(Map<String, dynamic> json)
  : movies = (json["results"] as List).map((e) => new Movie.fromJson(e)).toList(),
   error = "";

  MoviesResponse.withError(String errorValue)
  : movies = List(),
  error = errorValue;
}